<?xml version="1.0" encoding="utf-8"?>
<?xml-stylesheet ekr_test?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20110518141533.1402"><vh>Description</vh></v>
<v t="ekr.20110518141533.1413"><vh>class Runwith</vh>
<v t="ekr.20110518141533.1414"><vh>__init__</vh></v>
<v t="ekr.20110518141533.1415"><vh>_prepare_run</vh></v>
<v t="ekr.20110518141533.1416"><vh>_prepare_jsonfile</vh></v>
<v t="ekr.20110518141533.1417"><vh>_normalize_code</vh></v>
<v t="ekr.20110518141533.1418"><vh>run</vh></v>
<v t="ekr.20110518141533.1419"><vh>_report</vh></v>
<v t="ekr.20110518141533.1420"><vh>_cleanup</vh></v>
<v t="ekr.20110518141533.1421"><vh>get_runfile</vh></v>
<v t="ekr.20110518141533.1422"><vh>get_jsonfile</vh></v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20110518141533.1402">@nocolor-node

This code contributed by Kent Tenney.

See http://groups.google.com/group/leo-editor/browse_thread/thread/b8e8fbf6d97fa9f2/a4537fafaf2442ba

I've had endless problems with interpreter versioning, leading me create the
Runwith class. It writes a file to disk, makes it executable, runs it, captures
exitcode, err and output, removes the files, provides reports.

This provides complete decoupling from Leo.

I have run-bash and run-python buttons in Leo which run the node
contents as shell or python.

I'm liking it a lot.

I'm currently extending it to provide command line sugar:

$ rw ln -s /home/ktenney/work/src/project/bin/myscript
/home/ktenney/bin --makelink.sh--

The "rw" script executes the command, and creates the script makelink.sh

The following is Outline -&gt; Copy Node version of the Runwith class

It does some data gathering which probably don't apply: hashes of the code,
hostname, timestamps. These get stored in json.
</t>
<t tx="ekr.20110518141533.1413">class Runwith(object):
   """Generate and manage scripts.

   &gt;&gt;&gt; import getatdata

   """
   import tempfile
   import os
   import platform
   import json
   import md5
   import time
   import subprocess
   @others
</t>
<t tx="ekr.20110518141533.1414">def __init__(self, interpreter, code,
            cleanup=True, autorun=True,
            ):
   """Init a Runwith object, will run ``code`` using ``interpreter``

   &gt;&gt;&gt; import getatdata
   &gt;&gt;&gt; rw = getatdata.Runwith('/bin/bash', 'ls -la /tmp')
   &gt;&gt;&gt; rw.get_runfile()
   '/tmp/...

   &gt;&gt;&gt; rw.get_runfile('/tmp/listing')
   '/tmp/listing'

   """

   self.interpreter = interpreter
   self.code = code
   self._normalize_code()
   self.cleanup = cleanup
   self.fbase = self.tempfile.mktemp()
   self.runfile = self.fbase + '.run'
   self.outfile = self.fbase + '.out'
   self.errfile = self.fbase + '.err'
   self.jsonfile = self.fbase + '.json'
   self.fileset = [self.outfile, self.errfile, self.runfile, self.jsonfile]
   self.hostname = platform.node()
   if autorun:
       self.run()

</t>
<t tx="ekr.20110518141533.1415">def _prepare_run(self):
   """
   """

   self.hashbang = "#!" + self.interpreter
   contents = self.hashbang + "\n" + self.code + "\n"
   with file(self.runfile, 'w') as f:
       f.write(self.hashbang + '\n' + self.code + '\n')
       f.close()
       self.os.chmod(self.runfile, 0500)
</t>
<t tx="ekr.20110518141533.1416">def _prepare_jsonfile(self):
   """
   """

   with file(self.jsonfile, 'w') as f:
       f.write(self.json_data)
</t>
<t tx="ekr.20110518141533.1417">def _normalize_code(self):
   """Normalize the spacing in a command line.

   We don't want whitespace variations to result in different hashes for
   the same command.
   """

   # don't try to normalize scripts
   fixed_code = self.code.strip()
   if '\n' in fixed_code:
       self.multiline = True

   else:
       self.multiline = False
       # normalize the command line
       chunks = self.code.split()
       fixed_code = ' '.join(chunks)

   self.code = fixed_code

   code_hash_obj = self.md5.md5(fixed_code)
   self.codehash = code_hash_obj.hexdigest()
</t>
<t tx="ekr.20110518141533.1418">def run(self):
   """Do it.

   """

   #create output files for writing
   outfile = file(self.outfile, 'w')
   errfile = file(self.errfile, 'w')
   self._prepare_run()
   self.begintime = self.time.time()
   self.exitcode = self.subprocess.Popen(self.runfile, shell=True,
                             stdout=outfile, stderr=errfile).wait()
   self.endtime = self.time.time()
   outfile = file(self.outfile)
   errfile = file(self.errfile)
   self.out = outfile.read()
   self.err = errfile.read()
   outfile.close()
   errfile.close()
   self._report()
   if self.cleanup:
       self._cleanup()
</t>
<t tx="ekr.20110518141533.1419">def _report(self):
   """
   """

   rundict = {'exitcode':self.exitcode,
              'stdout':self.out, 'stderr':self.err}
   rundict['code'] = self.code
   rundict['hashbang'] = self.hashbang
   rundict['hostname'] = self.hostname
   rundict['codehash'] = self.codehash
   humantime = self.time.ctime(self.endtime)
   timestamps = {'begintime':self.begintime, 'endtime':self.endtime,
                 'humantime':humantime}
   rundict['timestamps'] = timestamps

   self.rundict = rundict
   self.json_data = self.json.dumps(rundict)

</t>
<t tx="ekr.20110518141533.1420">def _cleanup(self):
   """Remove files.

   """

   for f in self.fileset:
       if os.path.exists(f):
           os.remove(f)
</t>
<t tx="ekr.20110518141533.1421">def get_runfile(self, fname=None):
   """Create the executable and return it's filename.
   """

   if fname is not None:
       self.runfile = fname

   if fname is not self.runfile:
       self._prepare_run()

   return self.runfile



</t>
<t tx="ekr.20110518141533.1422">def get_jsonfile(self, fname='codehash'):
   """Create the json file and return it's filename.
   """

   if fname is not None:
       if fname is 'codehash':
           # name according to the code and run timestamp
           hash = self.codehash
           ts = str(self.rundict['timestamps']['begintime'])
           jsonfile = hash + "-" + ts + ".json"

       else:
           # use the tempfile name
           jsonfile = fname

   dest_dir = self.os.path.dirname(self.fbase)
   self.jsonfile = os.path.join(dest_dir, jsonfile)
   self._prepare_jsonfile()
   return self.jsonfile



</t>
</tnodes>
</leo_file>
