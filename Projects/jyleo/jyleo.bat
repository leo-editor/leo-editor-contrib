@echo off

rem "C:\Program Files\Java\jre1.6.0\bin\java.exe" -Dpython.home="C:\jythonRelease_2_2alpha1" -classpath "C:\jythonRelease_2_2alpha1\jython.jar;%CLASSPATH%" org.python.util.jython c:\jyleo\src\leo.py

"C:\Program Files\Java\jre1.6.0\bin\java.exe" -Dpython.home="jython2.2rc2" -classpath "jython2.2rc2\jython.jar;%CLASSPATH%" org.python.util.jython c:\jyleo\src\leo.py