#@+leo-ver=4
#@+node:@file sentinel.py
#@@tabwidth -3
#@@language python

#@<< about this script >>
#@+node:<< about this script >>
"""
Proof of concept implementation of sentinel free LEO files.

This script operates on files. It maps files with sentinels to files
without sentinels, and back.

The mapping itself is given in a configuration file:

[sentinel]
s1 = file1
d1 = file2

maps 'file1' to 'file2'. 'file1' is the file produce by LEO, with
sentinels, 'file2' is the file without sentinels.

The names 's1' and 'd1' do not mean anything; they are just used to
match an input name to an output name. The configuration script reader
just looks at the first character, if it is a 's' or 'd'. If there is
something of the form s<string> in the configuration file, then the
name d<string> must be in the configuration file too, and vice versa,
where <string> is some arbitrary identifier.

The name name 'sourcedirectory' is *not* taken to be the indication of
a sourcefile. You can use this to define one sourcedirectory.
Similarly, the name 'destinationdirectory' is explicitly checked for.

It supports the following operations:

  sync:   update s1 or d1 depending on date.
  push:   update d1 from s1
  pull:   update s1 from d1

call:

sentinel.py <configuration_file> <operation>

This is a proof of concept implementation only, because of the following reasons:

   1. Error checking is minimal. Since the script will be thrown away anyway,
      I did not want to put the effort in cleaning up the script.

   2. The configuration options are minimal too: I chose the smallest interface
      which allows the job to be done.
   
   3. The script treats LEO as a black box: no change whatsoever is
      required in LEO.
   
      Of course, the logic implemented here can and should be
      integrated into LEO.  But since I do not really know or
      understand the LEO internals, it deemed me to be faster to get
      to results by completely ignoring how LEO does things
      internally.

Despite this, the script tries to implement a complete solution.

The current version of the script is programmed very defensivly. It
has extra internal checks, and keeps backup versions of files
around. This is only temporary until I have some confidence in the
program.

The 'sync' option is not implemented yet.

Eventually, this script may morph into a plugin which will address
some additional usability issues.
"""
#@nonl
#@-node:<< about this script >>
#@nl
#@<< EKR: about this script >>
#@+node:<< EKR: about this script >>
#@+at 
#@nonl
# This script assumes that:
# a) sourcefile is a file _with_ sentinels that was originally produces by 
# Leo.
# b) targetfile is a modified version of sourcefile, _without_ sentinels.
# 
# N.B. This script uses sourcefile (an actual file) to generate this data 
# because the script doesn't care to delve into Leo's internals, in 
# particular, the atFile.write methods.  Leo itself, however, could easily 
# generate any data used by the script.  Indeed, .leo files contain all 
# information needed to generate derived files, with or without sentinels!
# 
# 1. First, the script creates internal_sourcelines from sourcefile by 
# stripping all sentinels.  This is done in the create_back_mapping method, 
# which also generates a mapping from lines in internal_sourcelines to lines 
# in sourcefile.  internal_sourcelines and sourcelines are lists of lines of 
# the corresponding "files" (actual or virtual).  mapping is a list of indices 
# such that internal_sourcefile[i] == sourcelines[mapping[i]] for all i: 0 <= 
# i < len(internal_sourcefile)
# 
# 2. Next, the script uses difflib.SequenceMatcher to get a list of changes 
# between
# 
# a) internal_sourcelines (the representation of the virtual derived file) and
# b) targetlines (the representation of the changed derived file).
# 
# N.B. Neither of these files contains sentinels.  This ensures that diff 
# won't mess with sentinels.  Dealing with sentinels is done only in the next 
# step.
# 
# 3. Using the list of changes given by difflib.SequenceMatcher, and the 
# mapping between lines in sourcefile and internal_sourcefile, the script 
# writes a "virtual derived output file" that contains sentinels _and_ all 
# changes.  It does this by merging the changes to the internal_sourcefile 
# into the output, copying sentinels from the sourcefile to the virtual 
# derived output file as it goes along.
# 
# This is the heart of the algorithm.  Because the targetfile does not contain 
# sentinels, there may be some irresolvable ambiguities about where changed 
# lines are to appear.  For example, some changes might appear on "either 
# side" of a missing sentinel.  There is in general no way for any algorithm 
# to resolve such ambiguities.  Fortunately, such occurrences are likely to be 
# rare, and Leo only need alert the user when an ambiguous situation occurs.  
# Moreover, inserting just begin-section and end-section comments into actual 
# derived files would eliminate the possibility of all such ambiguities.
# 
# 4. Given this virtual derived output file, Leo's present read logic could 
# propagate the changes from back into the outline.  This script doesn't 
# actually do that: it merely checks that stripping all sentinels from the 
# output file results in the original targetfile.
# 
# That's _all_.  This is an amazingly simple, powerful and general algorithm.
#@-at
#@nonl
#@-node:<< EKR: about this script >>
#@nl

import ConfigParser,difflib,os,sys

testing = False

print_copy_operations = True
# Should this script tell if files are copied?

do_backups = True
# Just in case something goes wrong, there will always be a backup file around.

#@+others
#@+node:get_filenames
def get_filenames(configfilename):
   """
   Get the source and destination files.

   Later, we might get the module level variables too.
   
   """
   cp = ConfigParser.ConfigParser()
   cp.read(configfilename)
   sectionkey = 'sentinel'
   assert cp.has_section(sectionkey)
   keys = cp.options(sectionkey)
   keys.sort()
   mapping = {}
   files = []
   for key in keys:
      if key in ('sourcedir', 'targetdir'):
         continue
      assert len(key) >= 2
      assert key[0] in ('s', 'd')
      if key[0] == 's':
         dkey = 'd' + key[1:]
         if not dkey in keys:
            print "key %s is in the section, then so must %s" % (key, dkey)
            assert 0
         files.append((cp.get(sectionkey, key), cp.get(sectionkey, dkey)))
   return files
#@nonl
#@-node:get_filenames
#@+node:write_if_changed
def write_if_changed(lines, sourcefilename, targetfilename):
   """
   
   Checks if 'lines' matches the contents of
   'targetfilename'. Refreshes the targetfile with 'lines' if not.

   Produces a message, if wanted, about the overrite, and optionally
   keeps the overwritten file with a backup name.

   """
   if not os.path.exists(targetfilename):
      copy = True
   else:
      copy = lines != file(targetfilename).readlines()
   if copy:
      if print_copy_operations:
         print "Copying ", sourcefilename, " to ", targetfilename, " without sentinals"

      if do_backups:
         # Keep the old file around while we are debugging this script
         if os.path.exists(targetfilename):
            count = 0
            backupname = "%s.~%s~" % (targetfilename, count)
            while os.path.exists(backupname):
               count += 1
               backupname = "%s.~%s~" % (targetfilename, count)
            os.rename(targetfilename, backupname)
            if print_copy_operations:
               print "backup file in ", backupname
         outfile = open(targetfilename, "w")
      for line in lines:
         outfile.write(line)
      outfile.close()
   return copy
#@nonl
#@-node:write_if_changed
#@+node:push
def push(files):
   """
   
   Copies the sourcefiles from the source location to the target
   location, deleting all sentinels.
   
   """
   for sourcefilename, targetfilename in files:
      outlines, sentinel_lines = push_filter(sourcefilename)
      write_if_changed(outlines, sourcefilename, targetfilename)
#@-node:push
#@+node:push_filter
def push_filter(sourcefilename):
   """
   
   Removes sentinels from the lines of 'sourcefilename'.
   
   """
   return push_filter_lines(file(sourcefilename).readlines())

#@-node:push_filter
#@+node:push_filter_lines
def push_filter_lines(lines):
   """
   
   Removes sentinels from lines.
   
   """
   result, sentinel_lines = [], []

   for line in lines:
      s = line.lstrip()
      if not s.startswith("#@"):
         result.append(line)
      else:
         sentinel_lines.append(line)

   return result, sentinel_lines
#@-node:push_filter_lines
#@+node:class sourcereader

class sourcereader:
   """
   A simple class to read lines sequentially.
   
   The class keeps an internal index, so that each
   call to get returns the next line.
   
   Index returns the internal index, and sync
   advances the index to the the desired line.
   
   The index is the *next* line to be returned.
   
   The line numbering starts from 0.
   
   """
   #@   @+others
   #@+node:__init__
   def __init__(self, lines):
      self.lines = lines
      self.i = 0
   #@-node:__init__
   #@+node:index
   def index(self):
      return self.i
   #@-node:index
   #@+node:get
   def get(self):
      result = self.lines[self.i]
      self.i += 1
      return result
   #@-node:get
   #@+node:sync
   def sync(self, i):
      self.i = i
   #@-node:sync
   #@+node:size
   def size(self):
      return len(self.lines)
   #@-node:size
   #@-others
#@-node:class sourcereader
#@+node:class sourcewriter
class sourcewriter:
   """
   Convenience class to capture output to a file.
   """
    #@    @+others
    #@+node:__init__
    def __init__(self):
       self.i = 0
       self.lines = []
    #@-node:__init__
    #@+node:push
    def push(self, line):
       self.lines.append(line)
       self.i += 1
    #@-node:push
    #@+node:index
    def index(self):
       return self.i
    #@-node:index
    #@+node:getlines
    def getlines(self):
       return self.lines
    #@-node:getlines
    #@-others

#@-node:class sourcewriter
#@+node:class sentinel_squasher
class sentinel_squasher:

   """
   The heart of the script.
   
   Creates files without sentinels from files with sentinels.
   
   Propagates changes in the files without sentinels back to the files with sentinels.
   
   """

   #@   @+others
   #@+node:check_lines_for_equality
   def check_lines_for_equality(self, lines1, lines2, message, lines1_message, lines2_message):
      """
      Little helper function to get nice output if something goes wrong.
      """
      if lines1 == lines2:
         return
      print "================================="
      print message
      print "================================="
      print lines1_message
      print "---------------------------------"
      for line in lines1:
         print line,
      print "=================================="
      print lines2_message
      print "---------------------------------"
      for line in lines2:
         print line,
      assert 0,message
   #@nonl
   #@-node:check_lines_for_equality
   #@+node:create_back_mapping
   def create_back_mapping(self, sourcelines):
      """
   
      'sourcelines' is a list of lines of a file with sentinels.
   
      Creates a new list of lines without sentinels, and keeps a
      mapping which maps each source line in the new list back to its
      original line.
   
      Returns the new list of lines, and the mapping.
   
      To save an if statement later, the mapping is extended by one
      extra element.
   
      """
      mapping, resultlines = [], []
      # EKR: resultlines[i] == sourcelines[mapping[i]] for 0 <= i < len(resultlines)
      # EKR: this is used in pull_source to look for inserted, deleted and changed lines.
      i = 0, 
      while i < len(sourcelines):
         line = sourcelines[i]
         if not line.lstrip().startswith("#@"):
            resultlines.append(line)
            mapping.append(i)
         i += 1
   
      # for programing convenience, we create an additional mapping entry.
      # This simplifies the programming of the copy_sentinels function below.
      mapping.append(i)
      return resultlines, mapping
   #@nonl
   #@-node:create_back_mapping
   #@+node:copy_sentinels
   def copy_sentinels(self, writer_new_sourcefile, reader_leo_file, mapping, startline, endline):
      """
      
      Sentinels are NEVER deleted by this script. They are changed as
      a result of user actions in the LEO.
   
      If code is replaced, or deleted, then we must make sure that the
      sentinels are still in the LEO file.
   
      Taking lines from reader_leo_file, we copy lines to writer_new_sourcefile, 
      if those lines contain sentinels.
   
      We copy all sentinels up to, but not including, mapped[endline].
      
      We copy only the sentinels *after* the current position of reader_leo_file.
      
      We have two options to detect sentinel lines:
         1. We could detect sentinel lines by examining the lines of the leo file.
         2. We can check for gaps in the mapping.
        
      Since there is a complication in the detection of sentinels (@verbatim), we
      are choosing the 2. approach. This also avoids duplication of code.
      ???This has to be verified later???
      """
    
      old_mapped_line = mapping[startline]
      unmapped_line = startline + 1
      
      while unmapped_line <= endline:
         mapped_line = mapping[unmapped_line]
         if old_mapped_line + 1 != mapped_line:
            reader_leo_file.sync(old_mapped_line + 1)
            # There was a gap. This gap must have consisted of sentinels, which have
            # been deleted.
            # Copy those sentinels.
            while reader_leo_file.index() < mapped_line:
               line = reader_leo_file.get()
               if testing:
                  print "Copy sentinels:", line,
               writer_new_sourcefile.push(line)
         old_mapped_line = mapped_line
         unmapped_line += 1
      reader_leo_file.sync(mapping[endline])
   #@nonl
   #@-node:copy_sentinels
   #@+node:pull_source
   def pull_source(self, sourcefile, targetfile):
      """
      Propagate the changes of targetfile back to sourcefile.
      Assume that sourcefile has sentinels, and targetfile has not.
      
      This is the heart of the script.
      """
      #@   << init pull_source vars >>
      #@+node:<< init pull_source vars >>
      if testing:
         print "pull_source:", sourcefile, targetfile
      
      sourcelines = file(sourcefile).readlines() # EKR: Has sentinels
      targetlines = file(targetfile).readlines() # EKR: No sentinels.
      
      internal_sourcelines, mapping = self.create_back_mapping(sourcelines)
      # EKR: internal_sourcelines: no sentinels.
      
      sm = difflib.SequenceMatcher(None, internal_sourcelines, targetlines)
      
      writer_new_sourcefile = sourcewriter()
      # collects the contents of the new file.
      
      reader_modified_file = sourcereader(targetlines)
      # Contains the changed source code. There are no sentinels in 'targetlines'
      
      reader_internal_file = sourcereader(internal_sourcelines)
      # This is the same file as reader_leo_file, without sentinels.
      
      reader_leo_file = sourcereader(sourcelines)
      # This is the file which is currently produced by Leo, with sentinels.
      #@nonl
      #@-node:<< init pull_source vars >>
      #@nl
      #@   << establish loop invariant >>
      #@+node:<<establish loop invariant>>
      #@+at
      # We compare the 'targetlines' with 'internal_sourcelines' and propagate
      # the changes back into 'writer_new_sourcefile' while making sure that
      # all sentinels of 'sourcelines' are copied as well.
      # 
      # An invariant of the following loop is that all three readers are in 
      # sync.
      # In addition, writer_new_sourcefile has accumulated the new file, which
      # is going to replace reader_leo_file.
      #@-at
      #@@c
      
      # Check that all ranges returned by get_opcodes() are contiguous.
      i2_internal_old, i2_modified_old = -1, -1
      
      # Copy the sentinels at the beginning of the file.
      while reader_leo_file.index() < mapping[0]:
         line = reader_leo_file.get()
         writer_new_sourcefile.push(line)
      #@nonl
      #@-node:<<establish loop invariant>>
      #@nl
      for tag, i1_internal_file, i2_internal_file, i1_modified_file, i2_modified_file in sm.get_opcodes():
         #@      << check loop invariant >>
         #@+node:<<check loop invariant>>
         # We need the ranges returned by get_opcodes to completely cover the source lines being compared.
         # We also need the ranges not to overlap.
         if i2_internal_old != -1:
            assert i2_internal_old == i1_internal_file
            assert i2_modified_old == i1_modified_file
          
         i2_internal_old, i2_modified_old = i2_internal_file, i2_modified_file
         
         #@+at
         # Loosely speaking, the loop invariant is that
         # we have processed everything up to, but not including,
         # the lower bound of the ranges returned by the iterator.
         # 
         # We have to check the three readers, reader_internal_file,
         # reader_modified_file, and reader_leo_file.
         # 
         # For the writer, the filter must reproduce the modified file
         # up until, but not including, i1_modified_file.
         # 
         # In addition, all the sentinels of the original LEO file, up until
         # mapping[i1_internal_file], must be present in the new_source_file.
         #@-at
         #@@c
         
         # Check the loop invariant.
         assert reader_internal_file.i == i1_internal_file
         assert reader_modified_file.i == i1_modified_file
         assert reader_leo_file.i == mapping[i1_internal_file]
         if testing:
            # These conditions are a little bit costly to check. Do this only if we are testing
            # the script.
            t_sourcelines, t_sentinel_lines = push_filter_lines(writer_new_sourcefile.lines)
            
            # Check that we have all the modifications so far.
            assert t_sourcelines == reader_modified_file.lines[:i1_modified_file]
            
            # Check that we kept all sentinels so far.
            assert t_sentinel_lines == push_filter_lines(reader_leo_file.lines[:reader_leo_file.i])[1]
         #@nonl
         #@-node:<<check loop invariant>>
         #@nl
         #@      << print debugging info >>
         #@+node:<< print debugging info >>
         if testing:
            print "tag:", tag,\
               "i1, i2 (internal file):",i1_internal_file, i2_internal_file,\
               "i1, i2 (modified file)", i1_modified_file, i2_modified_file
         #@nonl
         #@-node:<< print debugging info >>
         #@nl
         if tag == 'equal':
            #@         << Copy the lines from the leo file to the new sourcefile >>
            #@+node:<< copy the lines from the leo file to the new sourcefile >>
            # EKR: Copy lines from the derived file to the outline.
            
            # This loop copies both text and sentinels.
            while reader_leo_file.index() <= mapping[i2_internal_file - 1]:
            	
               line = reader_leo_file.get()
              
               if testing: print "Equal: copying ", line,
            	
               writer_new_sourcefile.push(line)
            
            if testing:
               print "Equal: syncing internal file from ", reader_internal_file.i, " to ", i2_internal_file
               print "Equal: syncing modified  file from ", reader_modified_file.i, " to ", i2_modified_file
            
            reader_internal_file.sync(i2_internal_file)
            reader_modified_file.sync(i2_modified_file)
            
            # Copy the sentinels which might follow the lines which were equal.       
            self.copy_sentinels(writer_new_sourcefile, reader_leo_file, mapping, i2_internal_file - 1, i2_internal_file)
            #@nonl
            #@-node:<< copy the lines from the leo file to the new sourcefile >>
            #@nl
         elif tag == 'replace':
              #@           << replace lines >>
              #@+node:<< replace lines >>
              #@+at
              # The replaced lines may span across several sections of 
              # sentinels.
              # 
              # For now, we put all the new contents after the first 
              # sentinels.
              # Different strategies may be possible later.
              # 
              # We might, for example, run the difflib across the different
              # lines and try to construct a mapping changed line => orignal 
              # line.
              # 
              # Since this will make this portion of the script considerably 
              # more
              # complex, we postpone this idea for now.
              # 
              # EKR: allowing end-of-section sentinels in derived files would 
              # solve this problem completely.
              #@-at
              #@@c
              
              while reader_modified_file.index() < i2_modified_file:
              
               line = reader_modified_file.get()
              
               if testing: print "Replace: copy modified line:", line,
              
               writer_new_sourcefile.push(line)
              
              # Take care of the sentinels which might be between the changed code.         
              self.copy_sentinels(writer_new_sourcefile, reader_leo_file, mapping, i1_internal_file, i2_internal_file)
              reader_internal_file.sync(i2_internal_file)
              #@nonl
              #@-node:<< replace lines >>
              #@nl
         elif tag == 'delete':
            #@         << delete lines >>
            #@+node:<< delete lines >>
            # EKR: Delete the lines from the outline that have been deleted from the derived file.
            
            # However, we NEVER delete sentinels, so they must be copied over.
            
            # Sync the readers.
            if testing:
               print "delete: syncing modified file from ", reader_modified_file.i, " to ", i1_modified_file
               print "delete: syncing internal file from ", reader_internal_file.i, " to ", i1_internal_file
            
            reader_modified_file.sync(i2_modified_file) # 12/11/03 per Bernhard's posting.
            reader_internal_file.sync(i2_internal_file)
            
            self.copy_sentinels(writer_new_sourcefile, reader_leo_file, mapping, i1_internal_file, i2_internal_file)
            #@nonl
            #@-node:<< delete lines >>
            #@nl
         elif tag == 'insert':
              #@           << insert lines >>
              #@+node:<< insert lines >>
              # EKR: Insert new lines from the derived file into the outline.
              
              while reader_modified_file.index() < i2_modified_file:
              
               line = reader_modified_file.get()
              
               if testing: print "insert: copy line:", line,
              
               writer_new_sourcefile.push(line)
              
              # Since (only) lines are inserted, we do not have to reposition any reader.
              #@nonl
              #@-node:<< insert lines >>
              #@nl
         else: assert 0
   
      # Copy the sentinels at the end of the file.
      while reader_leo_file.index() < reader_leo_file.size():
         writer_new_sourcefile.push(reader_leo_file.get())
         
      written = write_if_changed(writer_new_sourcefile.getlines(), targetfile, sourcefile)
      if written:
         #@      <<final paranoia check>>
         #@+node:<<final paranoia check>>
         #@+at
         # For the initial usage, we check that the output actually makes 
         # sense.
         # We check two things:
         #     1. Applying a 'push' operation will produce the modified file.
         #     2. Our new sourcefile still has the same sentinels as the 
         # replaced one.
         #@-at
         #@@c
         
         s_outlines, sentinel_lines = push_filter(sourcefile)
         
         # Check that 'push' will re-create the changed file.
         self.check_lines_for_equality(s_outlines, targetlines,
            "Pull did not work as expected",
            "Content of sourcefile:",
            "Content of modified file:")
         
         # Check that no sentinels got lost.
         old_sentinel_lines = push_filter_lines(reader_leo_file.lines[:reader_leo_file.i])[1]
         self.check_lines_for_equality(sentinel_lines, old_sentinel_lines,
            "Pull modified sentinel lines:",
            "Current sentinel lines:",
            "Old sentinel lines:")
         #@nonl
         #@-node:<<final paranoia check>>
         #@nl
   
   #@-node:pull_source
   #@-others
#@nonl
#@-node:class sentinel_squasher
#@+node:pull
def pull(files):
	
   """
   Propagate the changes back to the files with sentinels.
   """

   sq = sentinel_squasher()
   for sourcefile, targetfile in files:
      sq.pull_source(sourcefile, targetfile)
#@-node:pull
#@+node:main
def main(configuration_file, command)

   files = get_filenames(configuration_file)

   if command == 'sync':
      sync(files)
   elif command == 'push':
      push(files)
   else:
      assert command == 'pull'
      pull(files)
#@-node:main
#@-others

if __name__ == '__main__':
   main(sys.argv[1], sys.argv[2])
#@-node:@file sentinel.py
#@-leo
