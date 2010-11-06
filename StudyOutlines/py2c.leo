<?xml version="1.0" encoding="UTF-8"?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="6" clone_windows="0"/>
<globals body_outline_ratio="0.5">
	<global_window_position top="99" left="52" height="21" width="79"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences allow_rich_text="0">
</preferences>
<find_panel_settings>
	<find_string></find_string>
	<change_string></change_string>
</find_panel_settings>
<vnodes>
<v a="E"><vh>Py2C</vh>
<v t="T1"><vh>To do</vh></v>
<v t="T2"><vh>Design notes</vh>
<v a="E"><vh>Propagating types</vh>
<v><vh>Use C code to determine types of args to library functions?</vh></v>
</v>
<v t="T3"><vh>Interface with Python's C library?</vh></v>
</v>
<v t="T4" a="V"><vh>Hand compiling</vh>
<v t="T5"><vh>Import &amp; outer statements</vh></v>
<v t="T6"><vh>def &amp; types</vh></v>
<v><vh>NewHeadline</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="T1">@nocolor
Keep studying tk.

Hand-translate all code in leo.py, especially:
	__init__, __del__ memory allocation.
	
Study the C API's.  These are the only interface to the library!
	
Study Python debugger
		
Study Python interpreter, especially:
	How memory gets allocated/deallocate.
		What happens on function entry/exit.
		What the Py_Incref/decref macros do.
	How the Py_typeStruct is used.</t>
<t tx="T2">@nocolor</t>
<t tx="T3">Can we use the C library source code as is?  This implies strict souce-code compatibility.</t>
<t tx="T4">@nocolor</t>
<t tx="T5">Imports affect Py2C tables; they do not generate code.

Outer statements affect initialization at "import time".  We may have to eliminate some of it.

if __name__ == "__main__":

This may have to go...</t>
<t tx="T6">def f (a):  ==&gt;  t1 f (t2 a) {}

def f (a = b) ==&gt; t1 f (t2 a = b) {}

def f (*args) ==&gt; ??

def f (**keys) ==&gt; ??
	This is crucial: think Tkinter!
	The compiler could translate keyword args to positional args by scanning all files.</t>
</tnodes>
</leo_file>
