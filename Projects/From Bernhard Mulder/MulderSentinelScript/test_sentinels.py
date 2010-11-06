#@+leo-ver=4
#@+node:@file test_sentinels.py
#@+others
#@+node:imports
import os
from unittest import TestCase, TestSuite, TextTestRunner
import sentinel
import shutil
#@-node:imports
#@+node:class sentinel_test
class sentinel_test(TestCase):
   #@   @+others
   #@+node:setUp
   def setUp(self):
      self.prefix = ["#@+leo-ver=4\n",
   "#@+node:@file sentinel.py\n",
   "#@@language python\n"]
      self.postfix = ["#@-node:@file sentinel.py\n",
   "#@-leo\n"]
   #@-node:setUp
   #@+node:setup_inputfile
   def setup_inputfile(self, input):
      classname = self.__class__.__name__
      self.input_filename = os.path.join('test/s_%s.txt' % classname)
      self.output_filename = os.path.join('test/d_%s.txt' % classname)
      outfile = file(self.input_filename, "w")
      for line in input:
         outfile.write(line)
      outfile.close()
      
      
    
   #@-node:setup_inputfile
   #@+node:setup_configfile
   def setup_configfile(self):
      self.configfilename = "test/sentinel.cfg"
      outfile = file(self.configfilename, "w")
      outfile.write("[sentinel]\n")
      outfile.write("\ns1=%s\n" % self.input_filename)
      outfile.write("\nd1=%s\n" % self.output_filename)
      outfile.close()
   
   #@-node:setup_configfile
   #@-others
#@nonl
#@-node:class sentinel_test
#@+node:class insert_test
class insert_test(sentinel_test):
   #@   @+others
   #@+node:setUp
   def setUp(self):
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
   #@-node:setUp
   #@+node:runTest
   def runTest(self):
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
      
      
      
      
      
      
   
   
   
   #@-node:runTest
   #@-others
#@nonl
#@-node:class insert_test
#@+node:class replace_test
class replace_test(sentinel_test):
   """
   Replace a single line.
   """
   #@   @+others
   #@+node:setUp
   def setUp(self):
      sentinel_test.setUp(self)
      self.lines = [
       "Proof of concept implementation of sentinel free LEO files.\n",
       "This line should be replaced\n",
       "This should be the last line in the file\n"]
      self.setup_inputfile(self.prefix + self.lines + self.postfix)
   
      # here are the same lines, without sentinels
      self.setup_configfile()
   #@-node:setUp
   #@+node:runTest
   def runTest(self):
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
      
      
      
      
      
      
   
   
   
   #@-node:runTest
   #@-others
#@nonl
#@-node:class replace_test
#@+node:class replace_test2
class replace_test2(sentinel_test):
   """
   Replace two lines.
   """
   #@   @+others
   #@+node:setUp
   def setUp(self):
      sentinel_test.setUp(self)
      self.lines = [
      "Line 0\n",    #0
   "   Line 1\n",    #1
   "   Line 2.\n",   #2
   "   Line 3.\n",   #3
   "   Line 4\n",    #4
   "\n", #5
   " We have two subclasses:\n", #6
   "   single_clss represents a (condition, register) => (expression_number, linenumber) mapping.\n", #7
   "   set_class represents a set of (condition, register) => (expression_number, linenumber) mapping.\n", #8
   "\n", #9
   " Line 10\n", #10
   " Line 11\n" #11
   ]
      self.setup_inputfile(self.prefix + self.lines + self.postfix)
   
      # here are the same lines, without sentinels
      self.setup_configfile()
   #@-node:setUp
   #@+node:runTest
   def runTest(self):
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
      lines[7:9] = ["   single_class represents a (condition, register) => (expression_number, linenumber) mapping.\n", #7
                    "   set_class represents a set of (condition, register) => (expression_number, linenumber) mappings.\n", #8
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
      
      
      
      
      
      
   
   
   
   #@-node:runTest
   #@-others
#@nonl
#@-node:class replace_test2
#@+node:class replace_test3
class replace_test3(sentinel_test):
   """
   Replace the lines of a whole node.
   """
   #@   @+others
   #@+node:setUp
   def setUp(self):
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
   #@-node:setUp
   #@+node:runTest
   def runTest(self):
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
      
      
      
      
      
      
   
   
   
   #@-node:runTest
   #@-others
#@nonl
#@-node:class replace_test3
#@+node:class replace_test4
class replace_test4(sentinel_test):
   """
   Replace the lines of a whole node.
   """
   #@   @+others
   #@+node:setUp
   def setUp(self):
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
   #@-node:setUp
   #@+node:runTest
   def runTest(self):
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
      
      
      
      
      
      
   
   
   
   #@-node:runTest
   #@-others
#@nonl
#@-node:class replace_test4
#@+node:regression tests
#@+doc
# these are tests representing errors which I encountered during the 
# development of the code.
#@-doc
#@nonl
#@-node:regression tests
#@+node:class regression_test_1
class regression_test_1(sentinel_test):
   """
   Replace a single line.
   """
   #@   @+others
   #@+node:setUp
   def setUp(self):
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
   #@-node:setUp
   #@+node:runTest
   def runTest(self):
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
      
      
      
      
      
   
   
   
   #@-node:runTest
   #@-others
#@nonl
#@-node:class regression_test_1
#@+node:main
if __name__ == '__main__':
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
 
#@nonl
#@-node:main
#@-others
#@nonl
#@-node:@file test_sentinels.py
#@-leo
