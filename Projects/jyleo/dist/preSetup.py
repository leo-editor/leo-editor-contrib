#! /usr/bin/env python
#@+leo-ver=4-thin
#@+node:EKR.20040519082027.20:@thin preSetup.py
#@@first

""" Preprocess before executing setup.py. """

import leoGlobals as g

#@+others
#@+node:EKR.20040519082027.21:saveAllLeoFiles
def saveAllLeoFiles():
	
	for frame in g.app.windowList:
		c = frame.c
		name = c.mFileName
		if name == "": name = "untitled"
		if c.changed:
			print "saving ",name
			c.save()
#@nonl
#@-node:EKR.20040519082027.21:saveAllLeoFiles
#@+node:EKR.20040519082027.22:tangleLeoConfigDotLeo
def tangleLeoConfigDotLeo():

	c = None
	name = g.os_path_join("config","leoConfig.leo")
	oldtop = g.top()
	for frame in g.app.windowList:
		if frame.c.mFileName == name :
			c = frame.c
			break
	
	if c == None:
		c = g.top()
		flag,frame = g.openWithFileName(name,c)
		if not flag:
			print "can not open ",name
			return
		c = frame.c
			
	print "Tangling ", name
	g.app.setLog(oldtop.frame.log) # Keep sending messages to the original frame.
	c.tangleCommands.tangleAll()
	c.close()
	g.app.setLog(oldtop.frame.log)
#@nonl
#@-node:EKR.20040519082027.22:tangleLeoConfigDotLeo
#@-others

def setup():
	saveAllLeoFiles()
	tangleLeoConfigDotLeo()
	print "preSetup complete"
#@nonl
#@-node:EKR.20040519082027.20:@thin preSetup.py
#@-leo
