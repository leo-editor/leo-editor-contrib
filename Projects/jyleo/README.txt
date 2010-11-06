You will need the following to run JyLeo

java 1.5, the 'Tiger' release
jython 2.2 alpha( or better when released )

to execute JyLeo
you need to type at the command line:
jython leo.py

or

jython 'path to leo.py'


Note: the leo.py is not the leo.py in a CPython distribution,
its the leo.py in this distribution.


Important Note:
jython compiles its __file__ attribute instead of setting it at
startup time.  This has severe implications for jyleo.  If you move
your jyleo distribution after you have executed it, you should wipe
out any compile py class files in the directory.  Otherwise jyleo will
not start in its new location.













