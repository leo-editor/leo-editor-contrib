<?xml version="1.0" encoding="UTF-8"?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="16" clone_windows="0"/>
<globals body_outline_ratio="0.46344647519582244">
	<global_window_position top="52" left="255" height="766" width="946"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences>
</preferences>
<find_panel_settings>
	<find_string></find_string>
	<change_string></change_string>
</find_panel_settings>
<vnodes>
<v t="bwmulder.120603131249" a="EV"><vh>Experimental sentinel killing script</vh>
<v t="bwmulder.120803161509"><vh>todo</vh></v>
<v t="bwmulder.120603131812" tnodeList="bwmulder.120603131812,edream.121003145513,edream.121003153242,bwmulder.120603131812.2,bwmulder.120603131812.3,bwmulder.120603131812.4,bwmulder.120703170308,bwmulder.120803131809,bwmulder.120603131812.5,bwmulder.120603131812.7,bwmulder.120603131812.8,bwmulder.120603131812.9,bwmulder.120603131812.10,bwmulder.120603131812.11,bwmulder.120603131812.12,bwmulder.120603131812.13,bwmulder.120603131812.14,bwmulder.120603131812.15,bwmulder.120603131812.16,bwmulder.120603131812.17,bwmulder.120903101940,bwmulder.120603131812.19,bwmulder.120603131812.20,bwmulder.120603131812.21,edream.121003145513.1,bwmulder.120803144940,bwmulder.120803130808,edream.121003151551,edream.121003145513.2,edream.121003145513.3,edream.121003145513.4,edream.121003145513.5,bwmulder.120903191818,bwmulder.120603131812.22,bwmulder.120703004049"><vh>@file sentinel.py</vh>
<v t="edream.121003145513"><vh>&lt;&lt; about this script &gt;&gt;</vh></v>
<v t="edream.121003153242"><vh>&lt;&lt; EKR: about this script &gt;&gt;</vh></v>
<v t="bwmulder.120603131812.2"><vh>get_filenames</vh></v>
<v t="bwmulder.120603131812.3"><vh>write_if_changed</vh></v>
<v t="bwmulder.120603131812.4"><vh>push</vh></v>
<v t="bwmulder.120703170308"><vh>push_filter</vh></v>
<v t="bwmulder.120803131809"><vh>push_filter_lines</vh></v>
<v t="bwmulder.120603131812.5"><vh>class sourcereader</vh>
<v t="bwmulder.120603131812.7"><vh>__init__</vh></v>
<v t="bwmulder.120603131812.8"><vh>index</vh></v>
<v t="bwmulder.120603131812.9"><vh>get</vh></v>
<v t="bwmulder.120603131812.10"><vh>sync</vh></v>
<v t="bwmulder.120603131812.11"><vh>size</vh></v>
</v>
<v t="bwmulder.120603131812.12"><vh>class sourcewriter</vh>
<v t="bwmulder.120603131812.13"><vh>__init__</vh></v>
<v t="bwmulder.120603131812.14"><vh>push</vh></v>
<v t="bwmulder.120603131812.15"><vh>index</vh></v>
<v t="bwmulder.120603131812.16"><vh>getlines</vh></v>
</v>
<v t="bwmulder.120603131812.17"><vh>class sentinel_squasher</vh>
<v t="bwmulder.120903101940"><vh>check_lines_for_equality</vh></v>
<v t="bwmulder.120603131812.19" a="M"><vh>create_back_mapping</vh></v>
<v t="bwmulder.120603131812.20"><vh>copy_sentinels</vh></v>
<v t="bwmulder.120603131812.21" a="M"><vh>pull_source</vh>
<v t="edream.121003145513.1"><vh>&lt;&lt; init pull_source vars &gt;&gt;</vh></v>
<v t="bwmulder.120803144940"><vh>&lt;&lt;establish loop invariant&gt;&gt;</vh></v>
<v t="bwmulder.120803130808"><vh>&lt;&lt;check loop invariant&gt;&gt;</vh></v>
<v t="edream.121003151551"><vh>&lt;&lt; print debugging info &gt;&gt;</vh></v>
<v t="edream.121003145513.2"><vh>&lt;&lt; copy the lines from the leo file to the new sourcefile &gt;&gt;</vh></v>
<v t="edream.121003145513.3"><vh>&lt;&lt; replace lines &gt;&gt;</vh></v>
<v t="edream.121003145513.4"><vh>&lt;&lt; delete lines &gt;&gt;</vh></v>
<v t="edream.121003145513.5"><vh>&lt;&lt; insert lines &gt;&gt;</vh></v>
<v t="bwmulder.120903191818"><vh>&lt;&lt;final paranoia check&gt;&gt;</vh></v>
</v>
</v>
<v t="bwmulder.120603131812.22"><vh>pull</vh></v>
<v t="bwmulder.120703004049"><vh>main</vh></v>
</v>
<v t="bwmulder.120603223857" tnodeList="bwmulder.120603223857"><vh>@file sentinel.cfg</vh></v>
</v>
<v t="bwmulder.120603223949" a="E"><vh>tests</vh>
<v t="bwmulder.120703000133" tnodeList="bwmulder.120703000133,bwmulder.120703000133.1,bwmulder.120703001355,bwmulder.120703141328,bwmulder.120703001355.1,bwmulder.120703002843,bwmulder.120703000409,bwmulder.120703001355.2,bwmulder.120703001355.3,bwmulder.120703105944,bwmulder.120703105944.1,bwmulder.120703105944.2,bwmulder.120803112447,bwmulder.120803112447.1,bwmulder.120803112447.2,bwmulder.120803171348,bwmulder.120803171348.1,bwmulder.120803171348.2,bwmulder.120803234359,bwmulder.120803234359.1,bwmulder.120803234359.2,bwmulder.120903095722.2,bwmulder.120903095939,bwmulder.120903095939.1,bwmulder.120903095939.2,bwmulder.120703002020"><vh>@file test_sentinels.py</vh>
<v t="bwmulder.120703000133.1"><vh>imports</vh></v>
<v t="bwmulder.120703001355"><vh>class sentinel_test</vh>
<v t="bwmulder.120703141328"><vh>setUp</vh></v>
<v t="bwmulder.120703001355.1"><vh>setup_inputfile</vh></v>
<v t="bwmulder.120703002843"><vh>setup_configfile</vh></v>
</v>
<v t="bwmulder.120903095722"><vh>insert tests</vh>
<v t="bwmulder.120703000409"><vh>class insert_test</vh>
<v t="bwmulder.120703001355.2"><vh>setUp</vh></v>
<v t="bwmulder.120703001355.3"><vh>runTest</vh></v>
</v>
</v>
<v t="bwmulder.120903095722.1"><vh>replacement tests</vh>
<v t="bwmulder.120703105944"><vh>class replace_test</vh>
<v t="bwmulder.120703105944.1"><vh>setUp</vh></v>
<v t="bwmulder.120703105944.2"><vh>runTest</vh></v>
</v>
<v t="bwmulder.120803112447"><vh>class replace_test2</vh>
<v t="bwmulder.120803112447.1"><vh>setUp</vh></v>
<v t="bwmulder.120803112447.2"><vh>runTest</vh></v>
</v>
<v t="bwmulder.120803171348"><vh>class replace_test3</vh>
<v t="bwmulder.120803171348.1"><vh>setUp</vh></v>
<v t="bwmulder.120803171348.2"><vh>runTest</vh></v>
</v>
<v t="bwmulder.120803234359"><vh>class replace_test4</vh>
<v t="bwmulder.120803234359.1"><vh>setUp</vh></v>
<v t="bwmulder.120803234359.2"><vh>runTest</vh></v>
</v>
</v>
<v t="bwmulder.120903095722.2"><vh>regression tests</vh>
<v t="bwmulder.120903095939"><vh>class regression_test_1</vh>
<v t="bwmulder.120903095939.1"><vh>setUp</vh></v>
<v t="bwmulder.120903095939.2"><vh>runTest</vh></v>
</v>
</v>
<v t="bwmulder.120703002020"><vh>main</vh></v>
</v>
<v t="bwmulder.120903214930"><vh>not used</vh>
<v t="bwmulder.120603231526" tnodeList="bwmulder.120603231526"><vh>@file testtesting.ini</vh></v>
<v t="bwmulder.120703004433"><vh>tests to write</vh>
<v t="bwmulder.120603231230"><vh>Insert tests.</vh></v>
<v t="bwmulder.120603231306"><vh>deletion tests.</vh></v>
<v t="bwmulder.120703004433.1"><vh>Creation of backup files.</vh></v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="bwmulder.120603131249">@ignore # EKR: I've made untested changes.

@nocolor

This is an experimental script intended to show that sentinels in files are not really necessary.

EKR notes:

- I've modified this script: it should be considered completely untested!

- Something like the sourcereader and sourcewriter classes will be used in a future version of Leo's read/write logic.

- The pull_source method need not do a perfect job of allocating lines to adjacent nodes, provided that Leo tells the user that there is some ambiguity in what was done.

- A few places in the code do not handle @verbatim sentinels properly.  This is no big deal.

@color</t>
<t tx="bwmulder.120603131812">@language python

&lt;&lt; about this script &gt;&gt;
&lt;&lt; EKR: about this script &gt;&gt;

import ConfigParser,difflib,os,sys

testing = False

print_copy_operations = True
# Should this script tell if files are copied?

do_backups = True
# Just in case something goes wrong, there will always be a backup file around.

@others

if __name__ == '__main__':
   main(sys.argv[1], sys.argv[2])</t>
<t tx="bwmulder.120603131812.2">def get_filenames(configfilename):
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
      assert len(key) &gt;= 2
      assert key[0] in ('s', 'd')
      if key[0] == 's':
         dkey = 'd' + key[1:]
         if not dkey in keys:
            print "key %s is in the section, then so must %s" % (key, dkey)
            assert 0
         files.append((cp.get(sectionkey, key), cp.get(sectionkey, dkey)))
   return files</t>
<t tx="bwmulder.120603131812.3">def write_if_changed(lines, sourcefilename, targetfilename):
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
   return copy</t>
<t tx="bwmulder.120603131812.4">def push(files):
   """
   
   Copies the sourcefiles from the source location to the target
   location, deleting all sentinels.
   
   """
   for sourcefilename, targetfilename in files:
      outlines, sentinel_lines = push_filter(sourcefilename)
      write_if_changed(outlines, sourcefilename, targetfilename)
</t>
<t tx="bwmulder.120603131812.5">
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
   @others
</t>
<t tx="bwmulder.120603131812.7">def __init__(self, lines):
   self.lines = lines
   self.i = 0
</t>
<t tx="bwmulder.120603131812.8">def index(self):
   return self.i
</t>
<t tx="bwmulder.120603131812.9">def get(self):
   result = self.lines[self.i]
   self.i += 1
   return result
</t>
<t tx="bwmulder.120603131812.10">def sync(self, i):
   self.i = i
</t>
<t tx="bwmulder.120603131812.11">def size(self):
   return len(self.lines)
</t>
<t tx="bwmulder.120603131812.12">class sourcewriter:
   """
   Convenience class to capture output to a file.
   """
    @others

</t>
<t tx="bwmulder.120603131812.13">def __init__(self):
   self.i = 0
   self.lines = []
</t>
<t tx="bwmulder.120603131812.14">def push(self, line):
   self.lines.append(line)
   self.i += 1
</t>
<t tx="bwmulder.120603131812.15">def index(self):
   return self.i
</t>
<t tx="bwmulder.120603131812.16">def getlines(self):
   return self.lines
</t>
<t tx="bwmulder.120603131812.17">class sentinel_squasher:

   """
   The heart of the script.
   
   Creates files without sentinels from files with sentinels.
   
   Propagates changes in the files without sentinels back to the files with sentinels.
   
   """

   @others</t>
<t tx="bwmulder.120603131812.19">def create_back_mapping(self, sourcelines):
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
   # EKR: resultlines[i] == sourcelines[mapping[i]] for 0 &lt;= i &lt; len(resultlines)
   # EKR: this is used in pull_source to look for inserted, deleted and changed lines.
   i = 0, 
   while i &lt; len(sourcelines):
      line = sourcelines[i]
      if not line.lstrip().startswith("#@"):
         resultlines.append(line)
         mapping.append(i)
      i += 1

   # for programing convenience, we create an additional mapping entry.
   # This simplifies the programming of the copy_sentinels function below.
   mapping.append(i)
   return resultlines, mapping</t>
<t tx="bwmulder.120603131812.20">def copy_sentinels(self, writer_new_sourcefile, reader_leo_file, mapping, startline, endline):
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
   
   while unmapped_line &lt;= endline:
      mapped_line = mapping[unmapped_line]
      if old_mapped_line + 1 != mapped_line:
         reader_leo_file.sync(old_mapped_line + 1)
         # There was a gap. This gap must have consisted of sentinels, which have
         # been deleted.
         # Copy those sentinels.
         while reader_leo_file.index() &lt; mapped_line:
            line = reader_leo_file.get()
            if testing:
               print "Copy sentinels:", line,
            writer_new_sourcefile.push(line)
      old_mapped_line = mapped_line
      unmapped_line += 1
   reader_leo_file.sync(mapping[endline])</t>
<t tx="bwmulder.120603131812.21">def pull_source(self, sourcefile, targetfile):
   """
   Propagate the changes of targetfile back to sourcefile.
   Assume that sourcefile has sentinels, and targetfile has not.
   
   This is the heart of the script.
   """
   &lt;&lt; init pull_source vars &gt;&gt;
   &lt;&lt; establish loop invariant &gt;&gt;
   for tag, i1_internal_file, i2_internal_file, i1_modified_file, i2_modified_file in sm.get_opcodes():
      &lt;&lt; check loop invariant &gt;&gt;
      &lt;&lt; print debugging info &gt;&gt;
      if tag == 'equal':
         &lt;&lt; Copy the lines from the leo file to the new sourcefile &gt;&gt;
      elif tag == 'replace':
           &lt;&lt; replace lines &gt;&gt;
      elif tag == 'delete':
         &lt;&lt; delete lines &gt;&gt;
      elif tag == 'insert':
           &lt;&lt; insert lines &gt;&gt;
      else: assert 0

   # Copy the sentinels at the end of the file.
   while reader_leo_file.index() &lt; reader_leo_file.size():
      writer_new_sourcefile.push(reader_leo_file.get())
      
   written = write_if_changed(writer_new_sourcefile.getlines(), targetfile, sourcefile)
   if written:
      &lt;&lt;final paranoia check&gt;&gt;

</t>
<t tx="bwmulder.120603131812.22">def pull(files):
	
   """
   Propagate the changes back to the files with sentinels.
   """

   sq = sentinel_squasher()
   for sourcefile, targetfile in files:
      sq.pull_source(sourcefile, targetfile)
</t>
<t tx="bwmulder.120603223857">@doc
This is what a configuration file for 'sentinel.py' might look like.
@code
[sentinel]
sourcedir=c:/leo/cmp_new
targetdir=c:/leo/cmp_run

s0=%(sourcedir)s/addressmodes.py
d0=%(targetdir)s/addressmodes.py
# and so on...</t>
<t tx="bwmulder.120603223949">@doc
This is some basic testing.</t>
<t tx="bwmulder.120603231230"></t>
<t tx="bwmulder.120603231306"></t>
<t tx="bwmulder.120603231526">[Main]
test_to_run = all
# use all to run all tests.

cleanup = True
# Set to true if you want all files deleted.

leodir = C:/bwm/ftptoot/Cleo-4.1-beta-5</t>
<t tx="bwmulder.120703000133">@others</t>
<t tx="bwmulder.120703000133.1">import os
from unittest import TestCase, TestSuite, TextTestRunner
import sentinel
import shutil
</t>
<t tx="bwmulder.120703000409">class insert_test(sentinel_test):
   @others</t>
<t tx="bwmulder.120703001355">class sentinel_test(TestCase):
   @others</t>
<t tx="bwmulder.120703001355.1">def setup_inputfile(self, input):
   classname = self.__class__.__name__
   self.input_filename = os.path.join('test/s_%s.txt' % classname)
   self.output_filename = os.path.join('test/d_%s.txt' % classname)
   outfile = file(self.input_filename, "w")
   for line in input:
      outfile.write(line)
   outfile.close()
   
   
 
</t>
<t tx="bwmulder.120703001355.2">def setUp(self):
   sentinel_test.setUp(self)
   self.setup_inputfile(self.prefix + 
["Proof of concept implementation of sentinel free LEO files.\n",
"We try to insert a line after here\n",
"This should be after the inserted line\n",
"This should be the last line in the file\n"]
 + self.postfix)

   # here are the same lines, without sentinels
   self.lines = ["Proof of concept implementation of sentinel free LEO files.\n",
    "We try to insert a line after here\n",
    "This should be after the inserted line\n",
    "This should be the last line in the file\n"]
   self.setup_configfile()
</t>
<t tx="bwmulder.120703001355.3">def runTest(self):
   """
   
   Insert a line in a file without sentinels of a file derived of a file with sentinels, and make sure that this line is inserted in the proper place.
   
   """
   
   # First, produce the sentinel free output.
   sentinel.main(self.configfilename, "push")
   
   # Verify this first step.
   assert os.path.exists(self.output_filename)
   assert file(self.output_filename).readlines() == self.lines
   
   # then insert one line in the sentinel free output.
   lines = self.lines
   lines[2:2] = ["This is an inserted line\n"]
   outfile = file(self.output_filename, "w")
   for line in lines:
      outfile.write(line)
   outfile.close()
   
   # get the sources back.
   sentinel.main(self.configfilename, "pull")
   
   # re-generate the output.
   sentinel.main(self.configfilename, "push")
   
   # and check for equality.
   assert file(self.output_filename).readlines() == lines
   
   
   
   
   
   



</t>
<t tx="bwmulder.120703002020">if __name__ == '__main__':
   #fileName = os.path.join(os.getcwd(),"testing.ini")
   #config = ConfigParser.ConfigParser()
   #config.read(fileName)
   #main = "Main"
   #leodir = config.get(main, "leodir")
   #test_to_run = config.get(main, "test_to_run")
   test_to_run = 'all'
   
   if os.path.exists("test"):
      shutil.rmtree("test")
   os.mkdir("test")
   suite = TestSuite()
   if test_to_run == 'all':
      for testclass in (
         insert_test,
         replace_test,
         replace_test2,
         replace_test3,
         regression_test_1,         
      ):
         suite.addTest(testclass())
   else:
      suite.addTest(globals()[test_to_run]())
   testrunner = TextTestRunner()
   testrunner.run(suite)
 </t>
<t tx="bwmulder.120703002843">def setup_configfile(self):
   self.configfilename = "test/sentinel.cfg"
   outfile = file(self.configfilename, "w")
   outfile.write("[sentinel]\n")
   outfile.write("\ns1=%s\n" % self.input_filename)
   outfile.write("\nd1=%s\n" % self.output_filename)
   outfile.close()

</t>
<t tx="bwmulder.120703004049">def main(configuration_file, command)

   files = get_filenames(configuration_file)

   if command == 'sync':
      sync(files)
   elif command == 'push':
      push(files)
   else:
      assert command == 'pull'
      pull(files)
</t>
<t tx="bwmulder.120703004433"></t>
<t tx="bwmulder.120703004433.1"></t>
<t tx="bwmulder.120703105944">class replace_test(sentinel_test):
   """
   Replace a single line.
   """
   @others</t>
<t tx="bwmulder.120703105944.1">def setUp(self):
   sentinel_test.setUp(self)
   self.lines = [
    "Proof of concept implementation of sentinel free LEO files.\n",
    "This line should be replaced\n",
    "This should be the last line in the file\n"]
   self.setup_inputfile(self.prefix + self.lines + self.postfix)

   # here are the same lines, without sentinels
   self.setup_configfile()
</t>
<t tx="bwmulder.120703105944.2">def runTest(self):
   """
   
   Insert a line in a file without sentinels of a file derived of a file with sentinels, and make sure that this line is inserted in the proper place.
   
   """
   
   # First, produce the sentinel free output.
   sentinel.main(self.configfilename, "push")
   
   # Verify this first step.
   assert os.path.exists(self.output_filename)
   assert file(self.output_filename).readlines() == self.lines
   
   # then insert one line in the sentinel free output.
   lines = self.lines
   lines[2:2] = ["This is a replaced line\n"]
   outfile = file(self.output_filename, "w")
   for line in lines:
      outfile.write(line)
   outfile.close()
   
   # get the sources back.
   sentinel.main(self.configfilename, "pull")
   
   # re-generate the output.
   sentinel.main(self.configfilename, "push")
   
   # and check for equality.
   assert file(self.output_filename).readlines() == lines
   
   
   
   
   
   



</t>
<t tx="bwmulder.120703141328">def setUp(self):
   self.prefix = ["#@+leo-ver=4\n",
"#@+node:@file sentinel.py\n",
"#@@language python\n"]
   self.postfix = ["#@-node:@file sentinel.py\n",
"#@-leo\n"]
</t>
<t tx="bwmulder.120703170308">def push_filter(sourcefilename):
   """
   
   Removes sentinels from the lines of 'sourcefilename'.
   
   """
   return push_filter_lines(file(sourcefilename).readlines())

</t>
<t tx="bwmulder.120803112447">class replace_test2(sentinel_test):
   """
   Replace two lines.
   """
   @others</t>
<t tx="bwmulder.120803112447.1">def setUp(self):
   sentinel_test.setUp(self)
   self.lines = [
   "Line 0\n",    #0
"   Line 1\n",    #1
"   Line 2.\n",   #2
"   Line 3.\n",   #3
"   Line 4\n",    #4
"\n", #5
" We have two subclasses:\n", #6
"   single_clss represents a (condition, register) =&gt; (expression_number, linenumber) mapping.\n", #7
"   set_class represents a set of (condition, register) =&gt; (expression_number, linenumber) mapping.\n", #8
"\n", #9
" Line 10\n", #10
" Line 11\n" #11
]
   self.setup_inputfile(self.prefix + self.lines + self.postfix)

   # here are the same lines, without sentinels
   self.setup_configfile()
</t>
<t tx="bwmulder.120803112447.2">def runTest(self):
   """
   
   Insert a line in a file without sentinels of a file derived of a file with sentinels, and make sure that this line is inserted in the proper place.
   
   """
   
   # First, produce the sentinel free output.
   sentinel.main(self.configfilename, "push")
   
   # Verify this first step.
   assert os.path.exists(self.output_filename)
   assert file(self.output_filename).readlines() == self.lines
   
   # then insert two lines in the sentinel free output.
   lines = self.lines
   lines[7:9] = ["   single_class represents a (condition, register) =&gt; (expression_number, linenumber) mapping.\n", #7
                 "   set_class represents a set of (condition, register) =&gt; (expression_number, linenumber) mappings.\n", #8
                ]
   outfile = file(self.output_filename, "w")
   for line in lines:
      outfile.write(line)
   outfile.close()
   
   # get the sources back.
   sentinel.main(self.configfilename, "pull")
   
   # re-generate the output.
   sentinel.main(self.configfilename, "push")
   
   # and check for equality.
   assert file(self.output_filename).readlines() == lines
   
   
   
   
   
   



</t>
<t tx="bwmulder.120803130808"># We need the ranges returned by get_opcodes to completely cover the source lines being compared.
# We also need the ranges not to overlap.
if i2_internal_old != -1:
   assert i2_internal_old == i1_internal_file
   assert i2_modified_old == i1_modified_file
 
i2_internal_old, i2_modified_old = i2_internal_file, i2_modified_file

@
Loosely speaking, the loop invariant is that
we have processed everything up to, but not including,
the lower bound of the ranges returned by the iterator.

We have to check the three readers, reader_internal_file,
reader_modified_file, and reader_leo_file.

For the writer, the filter must reproduce the modified file
up until, but not including, i1_modified_file.

In addition, all the sentinels of the original LEO file, up until
mapping[i1_internal_file], must be present in the new_source_file.
@c

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
   assert t_sentinel_lines == push_filter_lines(reader_leo_file.lines[:reader_leo_file.i])[1]</t>
<t tx="bwmulder.120803131809">def push_filter_lines(lines):
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
</t>
<t tx="bwmulder.120803144940">@
We compare the 'targetlines' with 'internal_sourcelines' and propagate
the changes back into 'writer_new_sourcefile' while making sure that
all sentinels of 'sourcelines' are copied as well.

An invariant of the following loop is that all three readers are in sync.
In addition, writer_new_sourcefile has accumulated the new file, which
is going to replace reader_leo_file.
@c

# Check that all ranges returned by get_opcodes() are contiguous.
i2_internal_old, i2_modified_old = -1, -1

# Copy the sentinels at the beginning of the file.
while reader_leo_file.index() &lt; mapping[0]:
   line = reader_leo_file.get()
   writer_new_sourcefile.push(line)</t>
<t tx="bwmulder.120803161509">@nocolor
Implement sync.

Turn into plugin.

smooth out workflow
</t>
<t tx="bwmulder.120803171348">class replace_test3(sentinel_test):
   """
   Replace the lines of a whole node.
   """
   @others</t>
<t tx="bwmulder.120803171348.1">def setUp(self):
   sentinel_test.setUp(self)
   self.lines = [
   "#@+node:main\n",
   "node 1: line 1\n", # 1
   "node 1: line 2\n", # 2
   "#@-node:main\n",
   "#@-others\n",
   "node 2: line 3\n", # 3
   "node 2: line 4\n", # 4
   "#@-node:@file sentinel.py\n",
   ]
   self.setup_inputfile(self.prefix + self.lines + self.postfix)

   # here are the same lines, without sentinels
   self.setup_configfile()
</t>
<t tx="bwmulder.120803171348.2">def runTest(self):
   """
   
   Insert a line in a file without sentinels of a file derived of a file with sentinels, and make sure that this line is inserted in the proper place.
   
   """
   
   # First, produce the sentinel free output.
   sentinel.main(self.configfilename, "push")
   
   # Verify this first step.
   assert os.path.exists(self.output_filename)
   filtered_lines = sentinel.push_filter_lines(self.lines)[0]
   assert file(self.output_filename).readlines() == filtered_lines
   
   # then insert one line in the sentinel free output.
   filtered_lines [2:4] = [   "These lines should be totally different\n",
   "and be replaced across sentinel blocks,\n",

                ]
   outfile = file(self.output_filename, "w")
   for line in filtered_lines:
      outfile.write(line)
   outfile.close()
   
   # get the sources back.
   sentinel.main(self.configfilename, "pull")
   
   # re-generate the output.
   sentinel.main(self.configfilename, "push")
   
   # and check for equality.
   assert file(self.output_filename).readlines() == filtered_lines
   
   
   
   
   
   



</t>
<t tx="bwmulder.120803234359">class replace_test4(sentinel_test):
   """
   Replace the lines of a whole node.
   """
   @others</t>
<t tx="bwmulder.120803234359.1">def setUp(self):
   sentinel_test.setUp(self)
   self.lines = [
   "#@+node:main\n",
   "node 1: line 1\n", # 1
   "node 1: line 2\n", # 2
   "#@-node:main\n",
   "#@-others\n",
   "node 2: line 3\n", # 3
   "node 2: line 4\n", # 4
   "#@-node:@file sentinel.py\n",
   ]
   self.setup_inputfile(self.prefix + self.lines + self.postfix)

   # here are the same lines, without sentinels
   self.setup_configfile()
</t>
<t tx="bwmulder.120803234359.2">def runTest(self):
   """
   
   Insert a line in a file without sentinels of a file derived of a file with sentinels, and make sure that this line is inserted in the proper place.
   
   """
   
   # First, produce the sentinel free output.
   sentinel.main(self.configfilename, "push")
   
   # Verify this first step.
   assert os.path.exists(self.output_filename)
   filtered_lines = sentinel.push_filter_lines(self.lines)[0]
   assert file(self.output_filename).readlines() == filtered_lines
   
   # then insert one line in the sentinel free output.
   filtered_lines [1:3] = [   "These lines should be totally different\n",
   "and be replaced across sentinel blocks,\n",

                ]
   outfile = file(self.output_filename, "w")
   for line in filtered_lines:
      outfile.write(line)
   outfile.close()
   
   # get the sources back.
   sentinel.main(self.configfilename, "pull")
   
   # re-generate the output.
   sentinel.main(self.configfilename, "push")
   
   # and check for equality.
   assert file(self.output_filename).readlines() == filtered_lines
   
   
   
   
   
   



</t>
<t tx="bwmulder.120903095722"></t>
<t tx="bwmulder.120903095722.1"></t>
<t tx="bwmulder.120903095722.2">@doc
these are tests representing errors which I encountered during the development of the code.</t>
<t tx="bwmulder.120903095939">class regression_test_1(sentinel_test):
   """
   Replace a single line.
   """
   @others</t>
<t tx="bwmulder.120903095939.1">def setUp(self):
   self.lines = [
"#@+leo-ver=4\n",
"#@+node:@file driver.py\n",
"#@@language python\n",
"#@+others\n",
"#@+node:imports\n",
"# Analyse an IA64 assembly file:\n",
"#   1. Identify basic blocks.\n",
"#   2. Track the contents of registers symbolically.\n",
"import os, sys, cmp_globals\n",
"\n",
"#@-node:imports\n",
"#@+node:process_file\n",
"def process_file(infile, pyname_full, configfile, firststep, laststep):\n",
"   \n",
"      proc()\n",
"#@nonl\n",
"#@-node:process_file\n",
"#@-others\n",
"#@-node:@file driver.py\n",
"#@-leo\n"
]
   self.setup_inputfile(self.lines)

   # here are the same lines, without sentinels
   self.setup_configfile()
</t>
<t tx="bwmulder.120903095939.2">def runTest(self):
   """
   
   Insert a line in a file without sentinels of a file derived of a file with sentinels, and make sure that this line is inserted in the proper place.
   
   """
   
   # First, produce the sentinel free output.
   sentinel.main(self.configfilename, "push")
   
   # Verify this first step.
   assert os.path.exists(self.output_filename)
   assert file(self.output_filename).readlines() == sentinel.push_filter_lines(self.lines)[0]
      
   # get the sources back.
   sentinel.main(self.configfilename, "pull")
   
   # Now check that the source has not been changed.
   assert file(self.input_filename).readlines() == self.lines   
   
   
   
   
   



</t>
<t tx="bwmulder.120903101940">def check_lines_for_equality(self, lines1, lines2, message, lines1_message, lines2_message):
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
   assert 0,message</t>
<t tx="bwmulder.120903191818">@
For the initial usage, we check that the output actually makes sense.
We check two things:
    1. Applying a 'push' operation will produce the modified file.
    2. Our new sourcefile still has the same sentinels as the replaced one.
@c

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
   "Old sentinel lines:")</t>
<t tx="bwmulder.120903214930">@ignore</t>
<t tx="edream.121003145513">"""
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
something of the form s&lt;string&gt; in the configuration file, then the
name d&lt;string&gt; must be in the configuration file too, and vice versa,
where &lt;string&gt; is some arbitrary identifier.

The name name 'sourcedirectory' is *not* taken to be the indication of
a sourcefile. You can use this to define one sourcedirectory.
Similarly, the name 'destinationdirectory' is explicitly checked for.

It supports the following operations:

  sync:   update s1 or d1 depending on date.
  push:   update d1 from s1
  pull:   update s1 from d1

call:

sentinel.py &lt;configuration_file&gt; &lt;operation&gt;

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
"""</t>
<t tx="edream.121003145513.1">if testing:
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
# This is the file which is currently produced by Leo, with sentinels.</t>
<t tx="edream.121003145513.2"># EKR: Copy lines from the derived file to the outline.

# This loop copies both text and sentinels.
while reader_leo_file.index() &lt;= mapping[i2_internal_file - 1]:
	
   line = reader_leo_file.get()
  
   if testing: print "Equal: copying ", line,
	
   writer_new_sourcefile.push(line)

if testing:
   print "Equal: syncing internal file from ", reader_internal_file.i, " to ", i2_internal_file
   print "Equal: syncing modified  file from ", reader_modified_file.i, " to ", i2_modified_file

reader_internal_file.sync(i2_internal_file)
reader_modified_file.sync(i2_modified_file)

# Copy the sentinels which might follow the lines which were equal.       
self.copy_sentinels(writer_new_sourcefile, reader_leo_file, mapping, i2_internal_file - 1, i2_internal_file)</t>
<t tx="edream.121003145513.3">@
The replaced lines may span across several sections of sentinels.

For now, we put all the new contents after the first sentinels.
Different strategies may be possible later.

We might, for example, run the difflib across the different
lines and try to construct a mapping changed line =&gt; orignal line.

Since this will make this portion of the script considerably more
complex, we postpone this idea for now.

EKR: allowing end-of-section sentinels in derived files would solve this problem completely.
@c

while reader_modified_file.index() &lt; i2_modified_file:

 line = reader_modified_file.get()

 if testing: print "Replace: copy modified line:", line,

 writer_new_sourcefile.push(line)

# Take care of the sentinels which might be between the changed code.         
self.copy_sentinels(writer_new_sourcefile, reader_leo_file, mapping, i1_internal_file, i2_internal_file)
reader_internal_file.sync(i2_internal_file)</t>
<t tx="edream.121003145513.4"># EKR: Delete the lines from the outline that have been deleted from the derived file.

# However, we NEVER delete sentinels, so they must be copied over.

# Sync the readers.
if testing:
   print "delete: syncing modified file from ", reader_modified_file.i, " to ", i1_modified_file
   print "delete: syncing internal file from ", reader_internal_file.i, " to ", i1_internal_file

reader_modified_file.sync(i2_modified_file) # 12/11/03 per Bernhard's posting.
reader_internal_file.sync(i2_internal_file)

self.copy_sentinels(writer_new_sourcefile, reader_leo_file, mapping, i1_internal_file, i2_internal_file)</t>
<t tx="edream.121003145513.5"># EKR: Insert new lines from the derived file into the outline.

while reader_modified_file.index() &lt; i2_modified_file:

 line = reader_modified_file.get()

 if testing: print "insert: copy line:", line,

 writer_new_sourcefile.push(line)

# Since (only) lines are inserted, we do not have to reposition any reader.</t>
<t tx="edream.121003151551">if testing:
   print "tag:", tag,\
      "i1, i2 (internal file):",i1_internal_file, i2_internal_file,\
      "i1, i2 (modified file)", i1_modified_file, i2_modified_file</t>
<t tx="edream.121003153242">@nocolor
@

This script assumes that:

a) sourcefile is a file _with_ sentinels that was originally produces by Leo.
b) targetfile is a modified version of sourcefile, _without_ sentinels.

N.B. This script uses sourcefile (an actual file) to generate this data because
the script doesn't care to delve into Leo's internals, in particular, the
atFile.write methods. Leo itself, however, could easily generate any data used
by the script. Indeed, .leo files contain all information needed to generate
derived files, with or without sentinels!

1. First, the script creates internal_sourcelines from sourcefile by stripping
all sentinels. This is done in the create_back_mapping method, which also
generates a mapping from lines in internal_sourcelines to lines in sourcefile.
internal_sourcelines and sourcelines are lists of lines of the corresponding
"files" (actual or virtual). mapping is a list of indices such that
internal_sourcefile[i] == sourcelines[mapping[i]] for all i: 0 &lt;= i &lt;
len(internal_sourcefile)

2. Next, the script uses difflib.SequenceMatcher to get a list of changes
between

a) internal_sourcelines (the representation of the virtual derived file) and
b) targetlines (the representation of the changed derived file).

N.B. Neither of these files contains sentinels.  This ensures that diff won't mess with sentinels.  Dealing with sentinels is done only in the next step.

3. Using the list of changes given by difflib.SequenceMatcher, and the mapping
between lines in sourcefile and internal_sourcefile, the script writes a
"virtual derived output file" that contains sentinels _and_ all changes. It
does this by merging the changes to the internal_sourcefile into the output,
copying sentinels from the sourcefile to the virtual derived output file as it
goes along.

This is the heart of the algorithm. Because the targetfile does not contain
sentinels, there may be some irresolvable ambiguities about where changed lines
are to appear. For example, some changes might appear on "either side" of a
missing sentinel. There is in general no way for any algorithm to resolve such
ambiguities. Fortunately, such occurrences are likely to be rare, and Leo only
need alert the user when an ambiguous situation occurs. Moreover, inserting
just begin-section and end-section comments into actual derived files would
eliminate the possibility of all such ambiguities.

4. Given this virtual derived output file, Leo's present read logic could
propagate the changes from back into the outline automatically. This doesn't
happen automatically with this script: the pull_source routine merely checks
that stripping all sentinels from the output file results in the original
targetfile.

That's _all_.  This is an amazingly simple, powerful and general algorithm.

Correction by Bernhard: The script contains a mechanism to use sentinel free files *now*.

Here is how to do that:

1. Create a new directory to hold the sentinel free files.

2. Create a configfile of the form:

[sentinel]
sourcedir=c:/leo/orig
targetdir=c:/leo/sentinel_free

s0=%(sourcedir)s/leo.py
d0=%(targetdir)s/leo.py

where c:/leo/orig/leo.py is the file with sentinels,
and c:/leo/sentinel_fee/leo.py is the file without sentinels.

If you change your outline in LEO, the changes should be written to
c:/leo/orig/leo.py

3. Call

sentinel &lt;configfile&gt; push.

This copies the files with sentinels to the files without sentinels.

In our example:

c:/leo/orig/leo.py is copied c:/leo/sentinel_free/leo.py

4. Now you can edit or correct c:/leo/sentinel_free/leo.py

5. Once you did step 1 - 4, you can propagate changes back with

sentinel.py &lt;configfile&gt; pull

In our example,

c:/leo/sentinel_free/leo.py is copied to c:/leo/orig/leo.py.

Sentinels in c:/leo/orig/leo.py are left alone, however. The script *never*
deletes sentinels in the orig directory.

push can be used to propagate changes from the outline to the sentinel free
files:

sentinel.py &lt;configfile&gt; push

The script checks, for each pull and push operation, which
files changed, and does not touch files which would not change.

By default, it also tells you about changed files.</t>
</tnodes>
</leo_file>
