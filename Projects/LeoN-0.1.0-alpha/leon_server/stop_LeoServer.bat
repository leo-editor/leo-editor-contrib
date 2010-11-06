#@+leo-ver=4
#@+node:@file stop_LeoServer.bat
echo "(I don't know how to write {kill `cat LeoServer.pid`} in DOS batch)"
# in python? sure, a scripting language! I can do it in one line !
python -c "import os; import signal; os.kill(int(file(\"LeoServer.pid\").read()), signal.SIGTERM)"
# (will this work in windows ?)
#@nonl
#@-node:@file stop_LeoServer.bat
#@-leo
