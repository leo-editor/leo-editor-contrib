<?xml version="1.0" encoding="UTF-8"?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="4" clone_windows="0"/>
<globals body_outline_ratio="0.41772151898734178">
	<global_window_position top="10" left="237" height="808" width="938"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences>
</preferences>
<find_panel_settings>
	<find_string></find_string>
	<change_string></change_string>
</find_panel_settings>
<vnodes>
<v t="bwmulder.120603131249" a="E"><vh>Experimental sentinel killing script</vh>
<v t="bwmulder.120603131812" a="EM" tnodeList="bwmulder.120603131812,bwmulder.120603131812.1,bwmulder.120603131812.2,bwmulder.120603131812.3,bwmulder.120603131812.4,bwmulder.120703170308,bwmulder.120603131812.5,bwmulder.120603131812.7,bwmulder.120603131812.8,bwmulder.120603131812.9,bwmulder.120603131812.10,bwmulder.120603131812.11,bwmulder.120603131812.12,bwmulder.120603131812.13,bwmulder.120603131812.14,bwmulder.120603131812.15,bwmulder.120603131812.16,bwmulder.120603131812.17,bwmulder.120603131812.19,bwmulder.120603131812.20,bwmulder.120603131812.21,edream.120803100819,edream.120803100128,edream.120803100128.4,edream.120803095509,edream.120803100128.1,edream.120803100128.2,edream.120803100128.3,edream.120803100454,bwmulder.120603131812.22,bwmulder.120703004049"><vh>@file sentinel.py</vh>
<v t="bwmulder.120603131812.1"><vh>imports</vh></v>
<v t="bwmulder.120603131812.2"><vh>get_filenames</vh></v>
<v t="bwmulder.120603131812.3"><vh>write_if_changed</vh></v>
<v t="bwmulder.120603131812.4"><vh>push</vh></v>
<v t="bwmulder.120703170308"><vh>push_filter (EKR: doesn't handle verbatim sentinels)</vh></v>
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
<v t="bwmulder.120603131812.17" a="EM"><vh>class sentinel_squasher</vh>
<v t="bwmulder.120603131812.19" a="V"><vh>create_back_mapping</vh></v>
<v t="bwmulder.120603131812.20"><vh>copy_sentinels</vh></v>
<v t="bwmulder.120603131812.21" a="M"><vh>pull_source</vh>
<v t="edream.120803100819" a="M"><vh>&lt;&lt; about this script &gt;&gt;</vh></v>
<v t="edream.120803100128"><vh>&lt;&lt; set up vars for pull_source &gt;&gt;</vh></v>
<v t="edream.120803095509"><vh>&lt;&lt; copy the lines from the leo file to the new sourcefile &gt;&gt;</vh></v>
<v t="edream.120803100128.1"><vh>&lt;&lt; replace lines &gt;&gt;</vh></v>
<v t="edream.120803100128.2"><vh>&lt;&lt; delete lines, but not sentinels &gt;&gt;</vh></v>
<v t="edream.120803100128.3"><vh>&lt;&lt; insert lines &gt;&gt;</vh></v>
<v t="edream.120803100128.4"><vh>&lt;&lt; check that get_opcodes returns continuous sequences &gt;&gt;</vh></v>
<v t="edream.120803100454"><vh>&lt;&lt; copy the sentinels at the end of the file &gt;&gt;</vh></v>
</v>
</v>
<v t="bwmulder.120603131812.22"><vh>pull</vh></v>
<v t="bwmulder.120703004049"><vh>main</vh></v>
</v>
<v t="bwmulder.120603223857" tnodeList="bwmulder.120603223857"><vh>@file sentinel.cfg</vh></v>
</v>
<v t="bwmulder.120603223949"><vh>tests</vh>
<v t="bwmulder.120703000133" tnodeList="bwmulder.120703000133,bwmulder.120703000133.1,bwmulder.120703001355,bwmulder.120703141328,bwmulder.120703001355.1,bwmulder.120703002843,bwmulder.120703000409,bwmulder.120703001355.2,bwmulder.120703001355.3,bwmulder.120703105944,bwmulder.120703105944.1,bwmulder.120703105944.2,bwmulder.120703002020"><vh>@file test_sentinels.py</vh>
<v t="bwmulder.120703000133.1"><vh>imports</vh></v>
<v t="bwmulder.120703001355"><vh>class sentinel_test</vh>
<v t="bwmulder.120703141328"><vh>setUp</vh></v>
<v t="bwmulder.120703001355.1"><vh>setup_inputfile</vh></v>
<v t="bwmulder.120703002843"><vh>setup_configfile</vh></v>
</v>
<v t="bwmulder.120703000409"><vh>class insert_test</vh>
<v t="bwmulder.120703001355.2"><vh>setUp</vh></v>
<v t="bwmulder.120703001355.3"><vh>runTest</vh></v>
</v>
<v t="bwmulder.120703105944"><vh>class replace_test</vh>
<v t="bwmulder.120703105944.1"><vh>setUp</vh></v>
<v t="bwmulder.120703105944.2"><vh>runTest</vh></v>
</v>
<v t="bwmulder.120703002020"><vh>main</vh></v>
</v>
<v t="bwmulder.120603231526" tnodeList="bwmulder.120603231526"><vh>@file test/testing.ini</vh></v>
<v t="bwmulder.120703004433"><vh>tests to write</vh>
<v t="bwmulder.120603231230"><vh>Insert tests.</vh></v>
<v t="bwmulder.120603231306"><vh>deletion tests.</vh></v>
<v t="bwmulder.120603231306.1"><vh>replace tests.</vh></v>
<v t="bwmulder.120703004433.1"><vh>Creation of backup files.</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="bwmulder.120603131249">@doc
This is an experimental script intended to show that sentinels in files are not really necessary.</t>
<t tx="bwmulder.120603131812">@language python
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

The names 's1' and
'd1' do not mean anything; they are just used to match an input name
to an output name. The configuration script reader just looks at the
first character, if it is a 's' or 'd'. If there is something of the
form s&lt;string&gt; in the configuration file, then the name d&lt;string&gt; must
be in the configuration file too, and vice versa, where &lt;string&gt; is
some arbitrary identifier.

The name name 'sourcedirectory' is *not* taken to be the indication of
a sourcefile, but the indiciation of a source directory.

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
	
	2. The script treats LEO as a black box: no change whatsoever is
		required in LEO.
	
		Of course, the logic implemented here can and should be
		integrated into LEO.  But since I do not really know or
		understand the LEO internals, it deemed me to be faster to get
		to results by completely ignoring how LEO does things
		internally.

Despite this, the script tries to implement a complete solution.

As an extra layer of protection, the script checks that the 'pulled' source converts to the changed sentinel free file. This should make this script very safe.

The 'sync' option is not implemented yet.
"""
@others

@tabwidth 4


if __name__ == '__main__':
	main(sys.argv[1], sys.argv[2])


</t>
<t tx="bwmulder.120603131812.1">from ConfigParser import ConfigParser
from difflib      import SequenceMatcher
import sys, os</t>
<t tx="bwmulder.120603131812.2">def get_filenames(configfilename):

	cp = ConfigParser()
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
	return files
</t>
<t tx="bwmulder.120603131812.3">def write_if_changed(lines, filename):
	if not os.path.exists(filename):
		copy = True
	else:
		copy = lines != file(filename).readlines()
	if copy:
		print "Copying ", filename, " to ", filename, " without sentinals"

		# Keep the old file around while we are debugging this script
		if os.path.exists(filename):
			count = 0
			backupname = "%s.~%s~" % (filename, count)
			while os.path.exists(backupname):
				count += 1
				backupname = "%s.~%s~" % (filename, count)
			os.rename(filename, backupname)
			print "backup file in ", backupname
		outfile = open(filename, "w")
		for line in lines:
			outfile.write(line)
		outfile.close()
	return copy
</t>
<t tx="bwmulder.120603131812.4">def push(files):
	"""
	
	Copies the sourcefiles from the source location to the target
	location, deleting all sentinels.
	
	"""
	for sourcefilename, targetfilename in files:
		outlines = push_filter(sourcefilename)
		write_if_changed(outlines, targetfilename)
</t>
<t tx="bwmulder.120603131812.5">
class sourcereader:
	"""
	A simple class to read lines sequentially.
	
	The class keeps an internal index, so that each
	call to get returns the next line.
	
	index returns the internal index, and sync
	advances the index to the the desired line.
	"""
	@others</t>
<t tx="bwmulder.120603131812.7">def __init__(self, lines):
	self.lines = lines
	self.i = 0
</t>
<t tx="bwmulder.120603131812.8">def index(self):
	return self.i
</t>
<t tx="bwmulder.120603131812.9">def get(self):
	self.i += 1
	return self.lines[self.i - 1]
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
	return self.i - 1
</t>
<t tx="bwmulder.120603131812.16">def getlines(self):
	return self.lines
</t>
<t tx="bwmulder.120603131812.17">class sentinel_squasher:
	
	"""
	
	The heart of the script.
	
	Creates files without sentinels from files with sentinels.
	
	Propagates changes in the files without sentinels back
	to the files with sentinels.
	
	"""
	
	@others
</t>
<t tx="bwmulder.120603131812.19">def create_back_mapping(self, sourcelines):

	"""

	Sourceslines is a list of lines of a file with sentinels.

	Creates a new list of lines without sentinels, and keeps a
	mapping which maps each source line in the new list back to its
	original line.

	Returns the new list of lines, and the mapping

	"""
	
	# EKR: mapping is a list of lines in the original file.
	# EKR: for every i, the line resultlines[i] occurs at line mapping[i] in the original file.
	mapping, resultlines = [], []
	si = 0, 
	while si &lt; len(sourcelines):
		sline = sourcelines[si]
		if not sline.lstrip().startswith("#@"):  ## EKR: doesn't handle @verbatim.
			resultlines.append(sline)
			mapping.append(si)
		si += 1

	return resultlines, mapping</t>
<t tx="bwmulder.120603131812.20">def copy_sentinels(self, writer_new_sourcfile, reader_leo_file, mapping, startline, endline):
	"""
	
	Sentinels are NEVER deleted.

	If code is replaced, or deleted, then we must make sure that the
	sentinels are still in the LEO file.

	Taking lines from reader_leo_file, we copy lines to writer_new_sourcefile, if those lines contain
	sentinels.

	We copy lines from startline to endline, not including endline.

	startline and endline refer to lines in the file derived of reader_leo_file.
	
	"""
	
	old_mapped_line = mapping[startline]
	unmapped_line = startline + 1
	try:
		mapped_line  = mapping[unmapped_line]
	except:
		import pdb; pdb.set_trace()

	while unmapped_line &lt; endline:
		if old_mapped_line + 1 != mapped_line:
			reader_leo_file.sync(old_mapped_line)
			# There was a gap. This gap must have consisted of sentinels, which have
			# been deleted.
			# Copy those sentinels.
			while reader_leo_file.index() &lt; mapped_line:
				writer_new_sourcefile.push(reader_leo_file.get())
		old_mapped_line = mapped_line
		unmapped_line += 1
</t>
<t tx="bwmulder.120603131812.21">def pull_source(self, sourcefile, targetfile):

	""" Propagate changes in targetfile back to sourcefile.
	Assume sourcefile has sentinels, and targetfile has no sentinels."""
	
	&lt;&lt; about this script &gt;&gt;
	&lt;&lt; set up vars for pull_source &gt;&gt;

	i2_internal_old, i2_modified_old = -1, -1
	for tag, i1_internal_file, i2_internal_file, i1_modified_file, i2_modified_file in sm.get_opcodes():
		&lt;&lt; check that get_opcodes returns continuous sequences &gt;&gt;
		i2_internal_old, i2_modified_old = i2_internal_file, i2_modified_file
		if tag == 'equal':
			&lt;&lt; copy the lines from the leo file to the new sourcefile &gt;&gt;
		elif tag == 'replace':
			&lt;&lt; replace lines &gt;&gt;
		elif tag == 'delete':
			&lt;&lt; delete lines, but not sentinels &gt;&gt;
		elif tag == 'insert':
			&lt;&lt; insert lines &gt;&gt;
		else: assert 0

	&lt;&lt; copy the sentinels at the end of the file &gt;&gt;
	written = write_if_changed(writer_new_sourcefile.getlines(), sourcefile)
	if written:
		s_outlines = push_filter(sourcefile)
		assert s_outlines == targetlines, "Pull did not work as expected"
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
# and so on...
</t>
<t tx="bwmulder.120603223949">@doc
This is some basic testing.</t>
<t tx="bwmulder.120603231230"></t>
<t tx="bwmulder.120603231306"></t>
<t tx="bwmulder.120603231306.1"></t>
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
</t>
<t tx="bwmulder.120703000409">class insert_test(sentinel_test):
   @others</t>
<t tx="bwmulder.120703001355">class sentinel_test(TestCase):
   @others</t>
<t tx="bwmulder.120703001355.1">def setup_inputfile(self, input):
   self.input_filename = os.path.join('test/s1.txt')
   self.output_filename = os.path.join('test/d1.txt')
   outfile = file(self.input_filename, "w")
   for line in input:
      outfile.write(line.replace("#~@", "#@"))
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
      
   suite = TestSuite()
   if test_to_run == 'all':
      for testclass in (insert_test,
                        replace_test,
                        
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
<t tx="bwmulder.120703004049">def main(configuration_file, command):
	
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
   self.prefix = ["#~@+leo-ver=4\n",
"#~@+node:@file sentinel.py\n",
"#~@@language python\n"]
   self.postfix = ["#~@-node:@file sentinel.py\n",
"#~@-leo\n"]
</t>
<t tx="bwmulder.120703170308">def push_filter(sourcefilename):
	"""
	
	Removes sentinels from the lines of 'sourcefilename'.
	
	"""
	result = []
	for line in file(sourcefilename):
		s = line.lstrip()
		if not s.startswith("#@"):
			result.append(line)
	return result

</t>
<t tx="edream.120803095509"># Nothing is to be done: leave the Leo file alone.

while reader_leo_file.index() &lt;= mapping[i2_internal_file - 1]:
	writer_new_sourcefile.push(reader_leo_file.get())

reader_internal_file.sync(i2_internal_file)
reader_modified_file.sync(i2_modified_file)</t>
<t tx="edream.120803100128">sourcelines = file(sourcefile).readlines()
targetlines = file(targetfile).readlines()

internal_sourcelines, mapping = self.create_back_mapping(sourcelines)

sm = SequenceMatcher(None, internal_sourcelines, targetlines) # EKR: from difflib

writer_new_sourcefile = sourcewriter()
# collects the contents of the new file.

reader_modified_file = sourcereader(targetlines)
# Reads the modified file: a file without sentinels.

reader_leo_file = sourcereader(sourcelines)
# This is the file which is currently produced by LEO,
# with sentinels.

reader_internal_file = sourcereader(internal_sourcelines)
# This is the same file as reader_leo_file, without sentinels.</t>
<t tx="edream.120803100128.1"># The replaced lines may span across several sections of sentinels.

# tbd: check if the replacement is done completely within a section.

# Position the reader_leo_file.
while reader_leo_file.index() &lt;= mapping[i1_internal_file]:
	writer_new_sourcefile.push(reader_leo_file.get())

# Sync the readers.
reader_modified_file.sync(i1_modified_file)
reader_internal_file.sync(i1_internal_file)
reader_leo_file.sync(mapping[i1_modified_file])

# Copy over the new contents.
# For now, we put all the new contents after the first sentinels.
# Different strategies may be possible later.
while reader_modified_file.index() &lt; i2_modified_file:
	writer_new_sourcefile.push(reader_modified_file.get())

# Take care of the sentinels which might be between the changed code.
self.copy_sentinels(writer_new_sourcefile, reader_leo_file, mapping, i1_internal_file, i2_internal_file)</t>
<t tx="edream.120803100128.2"># We _never_ delete sentinels, so they must be copied here.

# Sync the readers
reader_modified_file.sync(i1_modified_file)
reader_internal_file.sync(i1_internal_file)

self.copy_sentinels(writer_new_sourcefile, reader_leo_file, mapping, i1_internal_file, i2_internal_file - 1)</t>
<t tx="edream.120803100128.3">reader_modified_file.sync(i1_modified_file)
reader_internal_file.sync(i1_internal_file)

while reader_modified_file.index() &lt; i2_modified_file:
	writer_new_sourcefile.push(reader_modified_file.get())</t>
<t tx="edream.120803100128.4">if i2_internal_old != -1:
	assert i2_internal_old == i1_internal_file
	assert i2_modified_old == i1_modified_file</t>
<t tx="edream.120803100454">while reader_leo_file.index() &lt; reader_leo_file.size():
	writer_new_sourcefile.push(reader_leo_file.get())</t>
<t tx="edream.120803100819">@ This is the heart of the script:

Given the differences between:
a) the sentinel-free file as produced by Leo and
b) the file produced by this script

put the changes back into the file producedby Leo, which does have the sentinels.

Loop invariants:
- All three readers are in sync.
- writer_new_sourcefile has the new file, which will replace reader_leo_file.</t>
</tnodes>
</leo_file>
