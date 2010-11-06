#! /usr/bin/env python
#@+leo-ver=4-thin
#@+node:EKR.20040519082027.29:@thin postSetup.py
#@@first

""" Postprocess after executing setup.py """

import leoGlobals as g

#@+others
#@+node:EKR.20040519082027.30:replacePatterns
def replacePatterns (file,pats):

	try:
		path = os.getcwd()
		name  = g.os_path_join(path,file)
		f = open(name)
	except:
		print "*****", file, "not found"
		return
	try:
		data = f.read()
		f.close()
		changed = False
		for pat1,pat2 in pats:
			newdata = data.replace(pat1,pat2)
			if data != newdata:
				changed = True
				data = newdata
				print file,"replaced",pat1,"by",pat2
		if changed:
			f = open(name,"w")
			f.write(data)
			f.close()
	except:
		import traceback ; traceback.print_exc()
		sys.exit()
#@-node:EKR.20040519082027.30:replacePatterns
#@+node:EKR.20040519082027.31:unsetDefaultParams
def unsetDefaultParams():
	
	print "unsetDefaultParams"
	
	pats = (("use_plugins = 0","use_plugins = 1"),)

	replacePatterns(g.os_path_join("config","leoConfig.leo"),pats)
	replacePatterns(g.os_path_join("config","leoConfig.txt"),pats)
#@nonl
#@-node:EKR.20040519082027.31:unsetDefaultParams
#@-others

def setup():
	if 1: # Use this only for final distributions.
		unsetDefaultParams()
	print "postSetup complete"
#@nonl
#@-node:EKR.20040519082027.29:@thin postSetup.py
#@-leo
