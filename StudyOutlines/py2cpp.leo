<?xml version="1.0" encoding="utf-8"?>
<?xml-stylesheet ekr_test?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.450916936354">
	<global_window_position top="12" left="473" height="927" width="783"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20061203113554"><vh>Docs</vh>
<v t="ekr.20061204080441"><vh>Posting1: py2cpp</vh>
<v t="ekr.20061203114036"><vh>Intro</vh></v>
<v t="ekr.20061203114036.1"><vh>Separating translated code</vh></v>
<v t="ekr.20061203114036.2"><vh>Type annotations</vh></v>
<v t="ekr.20061203114036.3"><vh>Lifetimes</vh></v>
<v t="ekr.20061203114036.4"><vh>py2cpp assertions</vh></v>
<v t="ekr.20061203114036.5"><vh>Exceptions</vh></v>
<v t="ekr.20061203114036.6"><vh>Conclusions</vh></v>
</v>
<v t="ekr.20061204080441.1"><vh>ShedSkin speedup</vh></v>
<v t="ekr.20061204080441.2"><vh>Posting 2: Inside the bubble</vh></v>
<v t="ekr.20061204150444"><vh>Minimal overhead to cross the bubble</vh></v>
<v t="ekr.20061204151040"><vh>@url http://docs.python.org/ext/intro.html  (start of discussion about extending)</vh></v>
<v t="ekr.20061204163347"><vh>@url http://docs.python.org/ext/refcounts.html</vh></v>
<v t="ekr.20061204163347.1"><vh>Allocating objects dynamically</vh></v>
<v t="ekr.20061204163347.2"><vh>Minimal type</vh></v>
</v>
<v t="ekr.20061205153740"><vh>Scripts</vh>
<v t="ekr.20061204183908"><vh>Recursive import script</vh>
<v t="ekr.20061204183908.1"><vh>importFiles</vh></v>
<v t="ekr.20061204183908.2"><vh>importDir</vh></v>
<v t="ekr.20061204183908.3"><vh>createLastChildOf</vh></v>
</v>
<v t="ekr.20061205062741"><vh>insert nodes</vh>
<v t="ekr.20061205064845"><vh>&lt;&lt; define s &gt;&gt;</vh></v>
<v t="ekr.20061205064845.1"><vh>mungeBody</vh></v>
</v>
</v>
<v t="ekr.20061204195153" a="E"><vh>@button py2cpp</vh>
<v t="ekr.20061205163522"><vh>To do</vh></v>
<v t="ekr.20061204195419" a="E"><vh>class ASTVisitor</vh>
<v t="ekr.20061204195419.2"><vh>__init__</vh></v>
<v t="ekr.20061205140652.6"><vh>Classes, methods &amp; functions</vh>
<v t="ekr.20061204205628.8"><vh>visitClass</vh></v>
<v t="ekr.20061204203241.1"><vh>visitFunction</vh></v>
<v t="ekr.20061205065240.9"><vh>visitLambda</vh></v>
<v t="ekr.20061204214019.1"><vh>visitDecorators</vh></v>
</v>
<v t="ekr.20061205163522.1"><vh>Complex (later, or never)</vh>
<v t="ekr.20061205140652.4"><vh>Generators</vh>
<v t="ekr.20061204213730.3"><vh>visitGenExpr</vh></v>
<v t="ekr.20061204213730.4"><vh>visitGenExprFor</vh></v>
<v t="ekr.20061204213730"><vh>visitGenExprIf</vh></v>
<v t="ekr.20061204213730.1"><vh>visitGenExprInner</vh></v>
</v>
<v t="ekr.20061205140652.7"><vh>List comprehensions</vh>
<v t="ekr.20061205065240.12"><vh>visitListComp</vh></v>
<v t="ekr.20061205065240.13"><vh>visitListCompFor</vh></v>
<v t="ekr.20061205065240.14"><vh>visitListCompIf</vh></v>
</v>
<v t="ekr.20061204205000.3"><vh>visitAssList</vh></v>
<v t="ekr.20061204205628"><vh>visitAssTuple</vh></v>
<v t="ekr.20061205062426"><vh>visitDict</vh></v>
<v t="ekr.20061205065240.1"><vh>visitEllipsis</vh></v>
<v t="ekr.20061205065240.4"><vh>visitFrom</vh></v>
<v t="ekr.20061205065240.6"><vh>visitImport</vh></v>
<v t="ekr.20061205065240.11"><vh>visitList</vh></v>
<v t="ekr.20061205065240.25"><vh>visitRaise (todo)</vh></v>
<v t="ekr.20061205065240.27"><vh>visitSlice</vh></v>
<v t="ekr.20061205065240.28"><vh>visitSliceobj</vh></v>
<v t="ekr.20061205065240.31"><vh>visitSubscript</vh></v>
<v t="ekr.20061205065240.32"><vh>visitTryExcept</vh></v>
<v t="ekr.20061205065240.33"><vh>visitTryFinally</vh></v>
<v t="ekr.20061205065240.34"><vh>visitTuple</vh></v>
</v>
<v t="ekr.20061205141200" a="TV"><vh>Imports &amp; scope (1 to do)</vh>
<v t="ekr.20061205065240.5"><vh>visitGlobal (to do)</vh></v>
<v t="ekr.20061205065240.16"><vh>visitModule</vh></v>
</v>
<v t="ekr.20061205140652.2"><vh>Operators (done)</vh>
<v t="ekr.20061205143033" a="E"><vh>Binary ops</vh></v>
<v t="ekr.20061205142616"><vh>N-ary ops &amp; compare</vh></v>
<v t="ekr.20061205143033.1" a="E"><vh>Unary ops</vh></v>
<v t="ekr.20061204205628.9"><vh>visitCompare</vh></v>
</v>
<v t="ekr.20061205140652"><vh>Primaries &amp; expressions (done)</vh>
<v t="ekr.20061204205628.7"><vh>visitCallFunc</vh></v>
<v t="ekr.20061204205628.10"><vh>visitConst</vh></v>
<v t="ekr.20061204211034"><vh>visitExpression</vh></v>
<v t="ekr.20061204213730.2"><vh>visitGetattr</vh></v>
<v t="ekr.20061205065240.8"><vh>visitKeyword</vh></v>
<v t="ekr.20061205065240.18"><vh>visitName</vh></v>
</v>
<v t="ekr.20061205140652.5"><vh>Statements (6 todo)</vh>
<v t="ekr.20061205140652.1"><vh>Assignments</vh>
<v t="ekr.20061204205000.2"><vh>visitAssAttr</vh></v>
<v t="ekr.20061204205628.2"><vh>visitAssign</vh></v>
<v t="ekr.20061204205000.4"><vh>visitAssName</vh></v>
<v t="ekr.20061204205628.3"><vh>visitAugAssign</vh></v>
</v>
<v t="ekr.20061204205628.1"><vh>visitAssert (todo)</vh></v>
<v t="ekr.20061204205628.4"><vh>visitBackquote (todo)</vh></v>
<v t="ekr.20061204205628.6"><vh>visitBreak/Continue</vh></v>
<v t="ekr.20061205062426.1"><vh>visitDiscard (del?)</vh></v>
<v t="ekr.20061205065240.2"><vh>visitExec</vh></v>
<v t="ekr.20061204211034.1"><vh>visitFor</vh></v>
<v t="ekr.20061204214019"><vh>visitIf</vh></v>
<v t="ekr.20061205065240.21"><vh>visitPass</vh></v>
<v t="ekr.20061205065240.23"><vh>visitPrint (todo)</vh></v>
<v t="ekr.20061205065240.24"><vh>visitPrintnl (todo)</vh></v>
<v t="ekr.20061204205000.5"><vh>visitReturn</vh></v>
<v t="ekr.20061204202104"><vh>visitStmt</vh></v>
<v t="ekr.20061205065240.37"><vh>visitWhile</vh></v>
<v t="ekr.20061205065240.38"><vh>visitWith (todo)</vh></v>
</v>
<v t="ekr.20061205162824"><vh>Utils..</vh>
<v t="ekr.20061205073149"><vh>push &amp; pop</vh></v>
<v t="ekr.20061204211633"><vh>trace</vh></v>
</v>
</v>
</v>
<v t="ekr.20061204214019"><vh>visitIf</vh></v>
<v t="ekr.20061205065240.37"><vh>visitWhile</vh></v>
</vnodes>
<tnodes>
<t tx="ekr.20061203113554">@nocolor
</t>
<t tx="ekr.20061203114036">My first python program was c2py, a program that did about 80% of the
transliteration drudgery in converting the C++ version of Leo to Python. This
program is in scripts.leo: Scripts--&gt;@file leoScripts.txt--&gt;Important--&gt;c2py
Convert C code to Python syntax

Following some pleasant off-line conversations with Michael Hudson of the pypy
project, I think it is time to do the reverse: create a program (py2cpp) that
will translate python code to C++. My thinking is this: The pypy project has
highly sophisticated tools (that take hours to run) that discover the types and
lifetimes of objects. But for the code *I* want to optimize, I already *know*
the types and lifetimes of all objects. Ever since lisp back in the early 60's,
garbage-collection languages have erected an impenetrable barrier between the
programmer and the allocator/garbage collector. In my case, I know a *lot* about
Leo's objects that I am *prohibited* from telling Python about. Thus, if I am
not mistaken (and I very well might be), the task of translating
(transliterating, really) from Python to C++ should be routine.

In Leo, the code to be translated are the node classes in leoNodes.py, the
read/write code in leoFileCommands.py and leoAtFile.py and the syntax coloring
code leoColor.py. Only parts of these modules would be translated, which makes
the job easier--hopefully *much* easier.

Please note, though, that *in general* the pypy way is the only way. For
example, Michael pointed me at:
http://webpages.charter.net/edreamleo/whitepapers.html#allocating-storage-using-lifetimes
This is a lovely paper. Very clear, and completely in alignment with my present
thinking. It shows, I think, the optimal way of discovering lifetimes in
general. But I know so much more about Leo that will *ever* be discovered by an
automatic tool!

I'm not willing to wait years for the pypy project to be completed. More
importantly, I do not want to run a tool that takes 2-3 hours to run every time
I change 'optimized' python code. Instead, I want a tool, written in Python of
course, that will translate my python code to C++ in a matter of seconds.
</t>
<t tx="ekr.20061203114036.1">By analogy with pypy's Restricted Python (RPython) language, py2cpp will
translate only a subset of Python. In particular, I definitely do not want to
translate import statements. We can enclose code to be transliterated in

if __py2cpp_compile: 
....&lt;&lt;define the python version of the code&gt;&gt;

py2cpp will create an *extension* module that will add the translated code
(including class defs?) back into the module from which they came. As I write
this, I see that this step could be tricky, but clearly it is doable.</t>
<t tx="ekr.20061203114036.2">To bypass pypy's type scanner (very expensive), some by-hand annotations will be
required. Maybe I'll call the resulting language: APython, for annotated Python.
The translator must know about Leo's coding conventions for c, p, g, w, d, etc.
Providing these coding conventions *once* (hard-coded in the py2cpp, or better,
in a config .leo file) eliminates the need for most annotations. One place where
annotations will be needed is in ctors. Something like:

def __init__ (self):
....self.x = 0 # type:i (integer)
....self.s = 'abc' # type:s (string)
....self.v = None # type:v (a vnode, as usual)

etc.  That is, the comments are the annotation.</t>
<t tx="ekr.20061203114036.3">We can't generate C++ code unless we can bypass Python's garbage collector (gc)
entirely. Fortunately, I know the lifetimes of all objects in the code I want to
translate. For vnodes and tnodes, the lifetime extends until the window
containing the outline closes. Call this the **window lifetime**. For the
colorizer, the lifetime is either permanent, the window lifetime, or
**temporary**, extending only until a (particular) method ends.

Again, Python provides no way for me to tell it about lifetimes. I'll probably
add __alloc__ and __dealloc__ methods (defined only if __py2cpp_compile is True)
that explicitly tell how to allocate and deallocate objects created by py2cpp.
That is, the __alloc__ tells how to allocate the 'self' object that is passed to
__init__. The __dealloc__ method (if it's really needed) will indicate the
**lifetime-point** (perhaps end-of-lifetime-point is a better term). This is the
place at which all methods having a particular lifetime will be reclaimed
en-mass. Since objects will be allocated in fixed-sized blocks, reclaiming can
be done extremely quickly. The actual deallocation will be done via a call (in
python) to a function in a py2cpp module. Or something like that. Anyway, the
essential idea is that the lifetime-point is indicated at a specific point in
the *Python* code.</t>
<t tx="ekr.20061203114036.4">The entire projects depends on the fact that I know (or think I know) what the
types and lifetimes of objects are. Clearly, hard crashes will happen if I am
wrong. Thus, a debugging mode (for the generated C++ code) is required to test
all relevant assertions implied by lifetimes and type allocations. I believe
that fixing the occasional failed assertions is *far* preferable to waiting for
pypy to verify the types 'from scratch' every time I add a Python statement :-)
Note that unit tests provide the obvious ways to test all important assertions.

The details of this part of the project are a bit fuzzy, but clearly vnodes and
tnodes are essentially immortal because of unlimited undo. That being so, we can
kill vnodes and tnodes *only* when their window closes. Conversely, when a
window closes, everything in it can go away, so we are safe. For other objects,
however, lifetime assertions may be harder to prove. If this becomes a big deal
(and it might) I think some kind of 'Gc viewer' tool might be good.
</t>
<t tx="ekr.20061203114036.5">C++ exception handling is not the same as Python exception handling. Don't know
exactly how I'll handle this, but some way will be found. Likely the pypy people
have already figured this out...
</t>
<t tx="ekr.20061203114036.6">My intuition is that **for sure** such a project is feasible.

py2cpp might be a useful test bed for pypy.

Now I know why I have always resisted hand-coding some of Leo's time-critical
code. It's hard to maintain two versions of code, but more importantly it's
wasted work (worse, misguided and error-producing work) if an automatic tool can
do the job instead.
</t>
<t tx="ekr.20061204080441"></t>
<t tx="ekr.20061204080441.1">"The run-time performance of the generated code for our benchmarks typically
outperforms Psycho...by a factor of 2-40. The average speedups over Psycho and
[CPython] are about 12 and 45, respectively."
</t>
<t tx="ekr.20061204080441.2">py2cpp last thoughts for now

The problem for me with compiler projects isn't just that they are hard, it's
that they tend to become all-consuming :-) In order to get on with Leo I shall
try to wrap up my present thoughts here.

If nothing else, the ShedSkin project shows that huge performance gains are
possible over psyco. This is an important result. The question is, are these
gains available when only part of the code is optimized? I believe the answer is
yes.

The Aha is to consider the boundary between optimized (C++) and python code. Let
us say that optimized code is **inside the bubble** and that regular Python code
is **outside the bubble**. The aha is this: **It is only at the bubble's
boundary that inefficiencies occur that are related to code inside the bubble.**
In other words, the more that executed code can stay inside the bubble, the more
efficient the code will be.

For example, all of Python's library code that implemented in C/C++ is inside a
bubble. This is a major reason why Python is so fast. We expect long-running
calls to Python's library to be very efficient, *provided* that the code in the
bubble doesn't make calls to code outside the bubble. For example, Python's xml
and dom libraries ought to give essentially optimal performance because all of
their code is (or could be, I don't know for sure) inside the bubble.

For py2cpp, keeping optimized code inside the bubble is absolutely crucial.
Consider, for example, the main read loop. This code **looks** like
transliterated C++ code, but appearances can be deceiving: it contains many
references to vnode and tnode ivars. If those references cross the bubble, most
performance gains will disappear. The problem is this: most of Leo's code that
references vnodes is *outside* the bubble (outside the code to be optimized). I
definitely will not consider any solution that moves a substantial part of Leo's
code inside the bubble: the bubble must contain only bottleneck code. So how can
we retain compatibility with code outside the bubble while making the code
inside the bubble fast?

At first I thought this was a show-stopper. Happily, I think the answer is
simple. The optimized code inside the bubble must provide two means of access:
the 'official' module-method table way (see
http://docs.python.org/ext/methodTable.html) for code outside the bubble, and a
**direct access** way for code inside the bubble. To make this work, all of the
code inside the bubble must be **in the same code space**, i.e., in a single
.cpp file. This eliminates all linking issues, though it does create some
namespace issues. These namespace issues are easily solved using prefixes
because all such prefixes are generated by code, i.e., by py2cpp.

So outside the bubble, an assignment like t = v.t results (as usual) in
something like 10-50 machine-language instructions in the interpreter and in
calls to __getattr__, and maybe even an indirection via the method table. Inside
the bubble, this should result in a single C statement, something like var_t =
var_v -&gt; vnode_ivar_t_offset. This assumes that leoNodes.py is inside the
bubble, which I think is essential.

So there it all is. py2cpp's code generators will emit dual-access code. They
will generate one or more module-method tables, that lead to 'official' module
code. They will also allow access (somehow) to equivalent, highly-optimized,
code for use only within the bubble. In this sense the 'bubble' becomes the unit
of global optimization, but in practice this optimization should be easy to do.
If ShedSkin can do it, py2cpp should be able to do it. py2cpp must generate
calls to Python's C-API as usual for all code outside the bubble. It will be up
to the programmer (me) to ensure that such calls do not exist inside
time-critical code. I believe this is feasible in the code I want to optimize.

In some ways all this is a hack. But a hack is all that is required for the code
that I want to optimize. Furthermore, the hack is made possible by Leo's coding
conventions, and I am willing to revise Leo's code as needed (mind you: only
within the optimized code) to follow those coding conventions. Naturally, pypy
has a much harder problem to solve, but that's their problem :-)

Edward

P.S. I forgot to mention that the only way to use lifetime-based storage
allocation is to move the vnode and tnode classes inside the bubble.

EKR
</t>
<t tx="ekr.20061204150444">@color
@language c

static PyObject *
spam_system(PyObject *self, PyObject *args)
{
    const char *command; int sts;
    if (!PyArg_ParseTuple(args, "s", &amp;command)) return NULL;
    sts = system(command);
    return Py_BuildValue("i", sts);
}

static PyMethodDef SpamMethods[] = {

    {"system",  spam_system, METH_VARARGS,"Execute a shell command."},
    {NULL, NULL, 0, NULL} // Sentinel
};

// Python calls initspam when importing module spam for the first time.
// The init function should be the only non-static item defined in the module file.
PyMODINIT_FUNC
initspam(void)
{
    (void) Py_InitModule("spam", SpamMethods);
}

@
The self argument is only used when the C function implements a built-in method,
not a function. In the example, self will always be a NULL pointer, since we are
defining a function, not a method. (This is done so that the interpreter doesn't
have to understand two different types of C functions.)

The args argument will be a pointer to a Python tuple object containing the
arguments. Each item of the tuple corresponds to an argument in the call's
argument list. The arguments are Python objects -- in order to do anything with
them in our C function we have to convert them to C values. The function
PyArg_ParseTuple() in the Python API checks the argument types and converts them
to C values. It uses a template string to determine the required types of the
arguments as well as the types of the C variables into which to store the
converted values. More about this later.

PyArg_ParseTuple() returns true (nonzero) if all arguments have the right type
and its components have been stored in the variables whose addresses are passed.
It returns false (zero) if an invalid argument list was passed. In the latter
case it also raises an appropriate exception so the calling function can return
NULL immediately (as we saw in the example).</t>
<t tx="ekr.20061204151040"></t>
<t tx="ekr.20061204163347"></t>
<t tx="ekr.20061204163347.1">@
Nobody ``owns'' an object; however, you can own a reference to an object. 

For lifetimes, we simple need to create a permanent reference to the object to ensure it is never deallocated.</t>
<t tx="ekr.20061204163347.2">@color
@language c

#include &lt;Python.h&gt;
#include "structmember.h"

typedef struct {
    PyObject_HEAD
    PyObject *first; /* first name */
    PyObject *last;  /* last name */
    int number;
} Noddy;

static void
Noddy_dealloc(Noddy* self)
{
    Py_XDECREF(self-&gt;first);
    Py_XDECREF(self-&gt;last);
    self-&gt;ob_type-&gt;tp_free((PyObject*)self);
}

static PyObject *
Noddy_new(PyTypeObject *type, PyObject *args, PyObject *kwds)
{
    Noddy *self;
    self = (Noddy *)type-&gt;tp_alloc(type, 0);
    if (self != NULL) {
        self-&gt;first = PyString_FromString("");
        if (self-&gt;first == NULL){ Py_DECREF(self); return NULL; }
        self-&gt;last = PyString_FromString("");
        if (self-&gt;last == NULL) { Py_DECREF(self); return NULL; }
        self-&gt;number = 0;
    }
    return (PyObject *)self;
}

static int
Noddy_init(Noddy *self, PyObject *args, PyObject *kwds)
{
    PyObject *first=NULL, *last=NULL, *tmp;
    static char *kwlist[] = {"first", "last", "number", NULL};
    if (! PyArg_ParseTupleAndKeywords(args, kwds, "|OOi", kwlist, &amp;first, &amp;last, &amp;self-&gt;number))
        return -1;
    if (first) {
        tmp = self-&gt;first;   Py_INCREF(first);
        self-&gt;first = first; Py_XDECREF(tmp);
    }
    if (last) {
        tmp = self-&gt;last;  Py_INCREF(last);
        self-&gt;last = last; Py_XDECREF(tmp);
    }
    return 0;
}

//// Make ivars visible.
// Could we use thunks here?  
static PyMemberDef Noddy_members[] = {
    {"first",  T_OBJECT_EX, offsetof(Noddy, first), 0,"first name"},
    {"last",   T_OBJECT_EX, offsetof(Noddy, last),  0,"last name"},
    {"number", T_INT, offsetof(Noddy, number),      0,"noddy number"},
    {NULL}  /* Sentinel */
};

static PyObject *
Noddy_name(Noddy* self)
{
    static PyObject *format = NULL;
    PyObject *args, *result;
    if (format == NULL) {
        format = PyString_FromString("%s %s");
        if (format == NULL) return NULL;}
    if (self-&gt;first == NULL) { PyErr_SetString(PyExc_AttributeError, "first"); return NULL;}
    if (self-&gt;last  == NULL) { PyErr_SetString(PyExc_AttributeError, "last");  return NULL;}
    args = Py_BuildValue("OO", self-&gt;first, self-&gt;last);
    if (args == NULL) return NULL;
    result = PyString_Format(format, args);
    Py_DECREF(args);
    return result;
}

static PyMethodDef Noddy_methods[] = {
    {"name", (PyCFunction)Noddy_name, METH_NOARGS,"Return the name"},
    {NULL}  /* Sentinel */
};

static PyTypeObject NoddyType = {
    PyObject_HEAD_INIT(NULL)
    0,                         /*ob_size: vestigial: should always be 0.*/
    "noddy.Noddy",             /*tp_name*/
    sizeof(Noddy),             /*tp_basicsize*/
    0,                         /*tp_itemsize*/
    (destructor)Noddy_dealloc, /*tp_dealloc*/
    0,                         /*tp_print*/
    0,                         /*tp_getattr*/
    0,                         /*tp_setattr*/
    0,                         /*tp_compare*/
    0,                         /*tp_repr*/
    0,                         /*tp_as_number*/
    0,                         /*tp_as_sequence*/
    0,                         /*tp_as_mapping*/
    0,                         /*tp_hash */
    0,                         /*tp_call*/
    0,                         /*tp_str*/
    0,                         /*tp_getattro*/
    0,                         /*tp_setattro*/
    0,                         /*tp_as_buffer*/
    Py_TPFLAGS_DEFAULT | Py_TPFLAGS_BASETYPE, /*tp_flags*/
    "Noddy objects",           /* tp_doc */
    0,		               /* tp_traverse */
    0,		               /* tp_clear */
    0,		               /* tp_richcompare */
    0,		               /* tp_weaklistoffset */
    0,		               /* tp_iter */
    0,		               /* tp_iternext */
    Noddy_methods,             /* tp_methods */
    Noddy_members,             /* tp_members */
    0,                         /* tp_getset */
    0,                         /* tp_base */
    0,                         /* tp_dict */
    0,                         /* tp_descr_get */
    0,                         /* tp_descr_set */
    0,                         /* tp_dictoffset */
    (initproc)Noddy_init,      /* tp_init */
    0,                         /* tp_alloc */
    Noddy_new,                 /* tp_new */
};

static PyMethodDef module_methods[] = {
    {NULL}  /* Sentinel */
};

#ifndef PyMODINIT_FUNC	/* declarations for DLL import/export */
#define PyMODINIT_FUNC void
#endif
PyMODINIT_FUNC
initnoddy2(void) 
{
    PyObject* m;
    if (PyType_Ready(&amp;NoddyType) &lt; 0) return;
    m = Py_InitModule3("noddy2", module_methods,"Example module that creates an extension type.");
    if (m == NULL) return;
    Py_INCREF(&amp;NoddyType);
    PyModule_AddObject(m, "Noddy", (PyObject *)&amp;NoddyType);
}
</t>
<t tx="ekr.20061204183908"># An example of running this script:

@others

types = (".py",) #,".c",".html",".txt")

dir = "c:/Zope-2.6.2-src/lib/python"
dir = "c:/Zope-2.6.2-src/lib/Components"

importFiles(dir,types,recursive=True)

g.es("done",color="blue")
</t>
<t tx="ekr.20061204183908.1">def importFiles (dir,type=None,kind="@file",recursive=False):
    
    v = c.currentVnode()

    # Check the params.
    if kind != "@file" and kind != "@root":
        g.es("kind must be @file or @root: " + kind)
        return

    if not g.os_path_exists(dir):
        g.es("directory does not exist: " + dir)
        return
    
    c.beginUpdate()
    try:
        root = createLastChildOf(v,"imported files")
        try:
            importDir (dir,type,kind,recursive,root)
            root.contract()
        except:
            g.es_exception()
    finally:
        c.endUpdate()</t>
<t tx="ekr.20061204183908.2">def importDir (dir,types,kind,recursive,root):

    g.es("dir: " + dir,color="blue")
    
    try:
        files = os.listdir(dir)
        files2 = [] ; dirs =[]
        for f in files:
            path = g.os_path_join(dir,f)
            if g.os_path_isfile(path):
                name, ext = g.os_path_splitext(f)
                if not types or ext in types:
                    files2.append(path)
            elif recursive:
                dirs.append(path)
        if len(files2) &gt; 0 or len(dirs) &gt; 0:
            child = createLastChildOf(root,dir)
            c.selectVnode(child)
        if len(files2) &gt; 0:
            c.importCommands.importFilesCommand(files2,kind)
        if len(dirs) &gt; 0:
            dirs.sort()
            for dir in dirs:
                importDir(dir,types,kind,recursive,child)
    except:
        g.es("exception in importFiles script")
        g.es_exception()
</t>
<t tx="ekr.20061204183908.3">def createLastChildOf (v,headline):
    
    child = v.insertAsLastChild()
    child.initHeadString(headline)
    return child
</t>
<t tx="ekr.20061204195153">@tabwidth -4
import compiler

@others

s = '''
class aClass:
    def spam(a):
        b = 2
        for i in xrange(0,2):
            a = 2+3
        return 'eggs' #comment
a = aClass()
b = a.spam(2)
while True:
    break
if b == 4:
    a.x = 1
elif 6 &lt; b2 &gt; 4:
    c += 5
else:
    pass
'''

print 'input','=' * 20
print s
print 'output','-' * 20
print

ast = compiler.parse(s)
visitor = ASTVisitor(verbose=3)
compiler.walk(ast,visitor,verbose=3) 
</t>
<t tx="ekr.20061204195419">class ASTVisitor:

	@others
</t>
<t tx="ekr.20061204195419.2">def __init__(self,verbose):

    self.node = None
    self.verbose = verbose
    self.classStack = []
    self.defStack = []
    self.stack = []
    self.indent = ''
</t>
<t tx="ekr.20061204202104">def visitStmt (self,node):

    result = []
    for z in node.nodes:
        s = self.visit(z)
        result.append(s)
    
    result = [z.rstrip()+'\n' for z in result ]
    theStmt = ''.join(result)

    if not self.classStack and not self.defStack and not self.stack:
        print theStmt # Emit the module-level statement.
    
    return theStmt</t>
<t tx="ekr.20061204203241.1">def visitFunction(self,node):
    
    # self.trace(node.name)
        # 'decorators',node.decorators,
        # 'name',node.name,
        # 'argnames',node.argnames,
        # 'defaults',node.defaults,
        # 'flags',node.flags,
        # 'doc',node.doc,
        # 'code',node.code,
        
    self.push()
    self.defStack.append(node.name)

    result = []
    for z in node.code:
        s = self.visit(z)
        result.append(s)

    name = self.defStack.pop()
    assert name == node.name,'visitFunction: expected %s, got %s' % (node.name,name)
    self.pop()
    
    result = [z for z in result if z is not None]
    result = ''.join(result)
    theFunc = '%sdef %s:\n%s' % (self.indent,node.name,result)
    if not self.classStack:
        print theFunc
    return theFunc</t>
<t tx="ekr.20061204205000.2">def visitAssAttr(self,node):  #attribute as target of assignment

    self.trace(node.flags) # OP_ASSIGN, 
    e = self.visit(node.expr) #expr: expression on the left-hand side of the dot
    
    return '%s-&gt;%s' % (node.attrname,e)
</t>
<t tx="ekr.20061204205000.3">def visitAssList(self,node):
    
    # self.trace()
    
    result = []
    for z in node.nodes:
        a = self.visit(z) or '&lt;None&gt;'
        result.append(a)
        
    return ''.join(result) or '&lt;assnList: None&gt;'
</t>
<t tx="ekr.20061204205000.4">def visitAssName(self,node):
    
    # name name being assigned to
    # self.trace(node.name,node.flags)
    
    return node.name
</t>
<t tx="ekr.20061204205000.5">def visitReturn (self,node):

    val = self.visit(node.value) or '&lt;ret:None&gt;'
    return '%sreturn %s ;' % (self.indent,val)</t>
<t tx="ekr.20061204205628">def visitAssTuple (self,node):
    
    self.trace()
    for z in node.nodes:
        self.visit(z)</t>
<t tx="ekr.20061204205628.1">def visitAssert (self,node):
    
    self.trace(node.test,node.fail)
        # test the expression to be tested 
        # fail the value of the AssertionError
</t>
<t tx="ekr.20061204205628.2">def visitAssign (self,node):
    
    # self.trace()
    assignments = []
    e = self.visit(node.expr)
    for z in node.nodes:
        a = self.visit(z)
        assignments.append(a)  
    result = []
    for z in assignments:
        s = '%s%s = %s ;\n' % (self.indent,a,e)
        result.append(s)
        
    return ''.join(result)
        
    # nodes a list of assignment targets, one per equal sign 
    # expr the value being assigned 
</t>
<t tx="ekr.20061204205628.3">def visitAugAssign (self,node):

    rt = self.visit(node.expr)
    lt = self.visit(node.node)
    return '%s %s %s' % (lt,node.op,rt)
</t>
<t tx="ekr.20061204205628.4">def visitBackquote (self,node):
    
    self.trace(node.expr)
</t>
<t tx="ekr.20061204205628.6">def visitBreak (self,node):
    
    return '%sbreak ;\n' % (self.indent)
    
def visitContinue (self,node):
    
    return '%scontinue ;\n' % (self.indent)

</t>
<t tx="ekr.20061204205628.7">def visitCallFunc (self,node):

    # self.trace('args',node.args,'*args',node.star_args,'**args',node.dstar_args)
        #node expression for the callee 
        #args a list of arguments 
        #star_args the extended *-arg value 
        #dstar_args the extended **-arg value
    
    # g.trace('node',node.node)
    
    args = []
    if node.args:
        for z in node.args:
            s = self.visit(z) or '&lt;arg:None&gt;'
            args.append(s)
    star_args = []
    if node.star_args:
        for z in node.star_args:
            s = self.visit(z) or '&lt;*arg:None&gt;'
            star_args.append(s)
    dstar_args = []
    if node.dstar_args:
        for z in node.dstar_args:
            s = self.visit(z) or '&lt;**arg:None&gt;'
            dstar_args.append(s)
    all_args = []
    for aList in (args,star_args,dstar_args):
        all_args.extend(aList)
    all_args = ','.join(all_args)
    name = self.visit(node.node) or '&lt;call:None&gt;'
    theCall = '%s(%s)' % (name,all_args)
    return theCall
</t>
<t tx="ekr.20061204205628.8">def visitClass (self,node):

    #doc doc string, a string or None 
    # self.trace(node.name,'bases',node.bases)

    self.push()
    self.classStack.append(node.name)
    
    if node.doc:
        self.visit(node.doc)
        
    result = []
    for z in node.code:
        s = self.visit(z)
        result.append(s)

    name = self.classStack.pop()
    assert name == node.name,'visitClass: expected %s, got %s' % (node.name,name)
    self.pop()
    
    result = ''.join(result) or '&lt;Class:None&gt;'
    theClass = '%sclass %s:\n%s' % (self.indent,node.name,result)
    return theClass
</t>
<t tx="ekr.20061204205628.9">def visitCompare (self,node):

    e = self.visit(node.expr) or '&lt;comp:expr:None&gt;'
    result = []
    for data in node.ops:
        op,val = data # Op is a string. val is a node.
        val = self.visit(val)
        if result: result.append(' &amp;&amp; ')
        result.append('(%s %s %s)' % (e,op,val))
        e = val
            
    result = ''.join(result)
    return result</t>
<t tx="ekr.20061204205628.10">def visitConst (self,node):
    
    #g.trace(repr(node.value))

    val = node.value
    if type(val) == type('abc'):
        return '"%s"' % val
    else:
        return str(val)
</t>
<t tx="ekr.20061204211034">def visitExpression (self,node):
    
    return self.visit(node.node)
</t>
<t tx="ekr.20061204211034.1">def visitFor (self,node):
    
    # self.trace()
    theAssn = self.visit(node.assign) or '&lt;for:assn:None&gt;'
    theList = self.visit(node.list) or '&lt;for:list:None&gt;'
    
    self.push()
    
    body = []
    for z in node.body:
        s = self.visit(z) or '&lt;for:None&gt;'
        body.append(s)
    body = ''.join(body).rstrip()+'\n'
    
    self.pop()
    
    theElse = node.else_ and self.visit(node.else_) or None
    theElseTrace = theElse or '&lt;for:else:None&gt;'
        
    # g.trace('assn',node.assign)
    # g.trace('list',node.list)
    # g.trace(body)
    # g.trace(theElse)

    theFor = '%sfor (%s in %s) {\n%s%s}' % (self.indent,theAssn,theList,body,self.indent)
    if theElse: theFor = theFor + '%selse {\n%s%s}' % (self.indent,theElse,self.indent)
    theFor = theFor + '\n'
    return theFor</t>
<t tx="ekr.20061204211633">def trace (self,*args,**keys):

    s = g.callers(3) + ':'
    print '%-15s' % s,
    for arg in args:
        print arg,
    print
</t>
<t tx="ekr.20061204213730">def visitGenExprIf (self,node):
    
    self.trace()
    self.visit(node.test)
</t>
<t tx="ekr.20061204213730.1">def visitGenExprInner (self,node):
    
    g.trace(node.quals)
    self.visit(node.expr)
</t>
<t tx="ekr.20061204213730.2">def visitGetattr (self,node):

    e = self.visit(node.expr)
    return '%s-&gt;%s' % (e,node.attrname)
</t>
<t tx="ekr.20061204213730.3">def visitGenExpr (self,node):

    g.trace()
    
    self.push()

    result = []
    for z in node.code:
        s = self.visit(z)
        result.append(s)
        
    self.pop()

    result = ''.join(result) or '&lt;Expr:None&gt;'
    return result</t>
<t tx="ekr.20061204213730.4">def visitGenExprFor (self,node):
    
    g.trace()

    self.visit(node.assign)
    if node.iter:
        self.visit(node.iter)
    if node.ifs:
        self.visit(node.ifs)
</t>
<t tx="ekr.20061204214019">def visitIf (self,node):
    
    code = []

    for test,block in node.tests:
        test = self.visit(test) or '&lt;if:test:None&gt;'
        self.push()
        theBlock = self.visit(block) or '&lt;if:block:None&gt;'
        self.pop()
        op = g.choose(len(code)&gt;0,'elif','if')
        s = '%s%s (%s) {\n%s%s}' % (self.indent,op,test,theBlock,self.indent)
        if code: s = '\n' + s
        code.append(s)
        
    if node.else_:
        self.push()
        theElse = self.visit(node.else_)
        self.pop()
        s = '\n%selse {\n%s%s}' % (self.indent,theElse,self.indent)
        code.append(s)
    
    theIf = ''.join(code)+'\n'
    return theIf
</t>
<t tx="ekr.20061204214019.1">def visitDecorators (self,node):
    
    for z in node.nodes:
        self.visit(z)
    
    # nodes List of function decorator expressions 

</t>
<t tx="ekr.20061205062426">def visitDict (self,node):
    
    g.trace()
    for z in node.items:
        self.visit(z)
</t>
<t tx="ekr.20061205062426.1">def visitDiscard (self,node):
    
    g.trace()
    e = self.visit(node.expr)
</t>
<t tx="ekr.20061205062741">&lt;&lt; define s &gt;&gt;

@others

p = g.findNodeAnywhere(c,'class ASTVisitor')
if p:
    print '-' * 40
    lines = g.splitlines(s)
    body = []
    for line in lines:
        if line.strip():
            body.append(line)
        elif body:
            head = body and body[0]
            i = head.find(' ')
            if i &gt; -1: head = head[:i]
            head = 'visit' + head
            print ('head',head)
            body = mungeBody(body)
            print('body',repr(body))
            if 0:
                p2 = p.insertAsLastChild()
                c.setHeadString(p2,head)
                c.setBodyString(p2,body)
            body = []</t>
<t tx="ekr.20061205064845">
s = '''
Div left  
 right  

Ellipsis   

Exec expr  
 locals  
 globals  

FloorDiv left  
 right  

From modname  
 names  

Global names  

Import names  

Invert expr  

Keyword name  
 expr  

Lambda argnames  
 defaults  
 flags  
 code  

LeftShift left  
 right  

List nodes  

ListComp expr  
 quals  

ListCompFor assign  
 list  
 ifs  

ListCompIf test  

Mod left  
 right  

Module doc doc string, a string or None 
 node body of the module, a Stmt 

Mul left  
 right  

Name name  

Not expr  

Or nodes  

Pass   

Power left  
 right  

Print nodes  
 dest  

Printnl nodes  
 dest  

Raise expr1  
 expr2  
 expr3   

RightShift left  
 right  

Slice expr  
 flags  
 lower  
 upper  

Sliceobj nodes list of statements 

Stmt nodes  

Sub left  
 right  

Subscript expr  
 flags  
 subs  

TryExcept body  
 handlers  
 else_  

TryFinally body  
 final  

Tuple nodes  

UnaryAdd expr  

UnarySub expr  

While test  
 body  
 else_  

With expr  
 vars  
 body  

Yield value
'''</t>
<t tx="ekr.20061205064845.1">def mungeBody (body):
    
    s = body[0]
    i = s.find(' ')
    if i &gt; -1:
        s = 'def visit' + s[:i] + ' (self,node):' + '# ' + s[i:]
    else:
        s = 'def visit' + s + ' (self,node):'
    body[0] = s + '\tg.trace()\n'
    
    for line in body:
        if line.find('nodes') &gt; -1:
            body.append('\tfor z in node.nodes:\n\t\tself.visit(z)\n')
            break
        elif line.find('body') &gt; -1:
            body.append('\tfor z in node.body:\n\t\tself.visit(z)\n')
            break
       
    return ''.join(body)
</t>
<t tx="ekr.20061205065240.1">def visitEllipsis (self,node):

	g.trace()
</t>
<t tx="ekr.20061205065240.2">def visitExec (self,node):
    
	g.trace(node.locals,node.globals)
    self.visit(node.expr)
</t>
<t tx="ekr.20061205065240.4">def visitFrom (self,node):

	g.trace(node.modname,node.names)
</t>
<t tx="ekr.20061205065240.5">def visitGlobal (self,node):

	g.trace(node.names)
</t>
<t tx="ekr.20061205065240.6">def visitImport (self,node):

	g.trace(node.names)
</t>
<t tx="ekr.20061205065240.8">def visitKeyword (self,node):

	g.trace(node.name)
    e = self.visit(node.expr)
    return e
</t>
<t tx="ekr.20061205065240.9">def visitLambda (self,node):

	g.trace(node.flags,node.argnames)
    for z in node.defaults:
        self.visit(z)
    for z in node.code:
        self.visit(z)
 </t>
<t tx="ekr.20061205065240.11">def visitList (self,node):

	g.trace()
	for z in node.nodes:
		self.visit(z)
</t>
<t tx="ekr.20061205065240.12">def visitListComp (self,node):
 
	g.trace()
    self.visit(node.expr)
    for z in node.quals:
        self.visit(z)
</t>
<t tx="ekr.20061205065240.13">def visitListCompFor (self,node):

	g.trace()
    self.visit(node.assign)
    for z in node.list:
        self.visit(z)
    for z in node.ifs:
        self.visit(z)
</t>
<t tx="ekr.20061205065240.14">def visitListCompIf (self,node):  
	
    g.trace()
    self.visit(node.test)
</t>
<t tx="ekr.20061205065240.16">def visitModule (self,node):
        
    # node.doc: docstring
	# node.node: The body of the module, a statement.
	self.visit(node.node)
</t>
<t tx="ekr.20061205065240.18">def visitName (self,node):

    if node.name:
        return str(node.name) or '&lt;Name:None&gt;'
    else:
        return '&lt;Name:None&gt;'
</t>
<t tx="ekr.20061205065240.21">def visitPass (self,node):
    
	return '%s;\n' % (self.indent)
</t>
<t tx="ekr.20061205065240.23">def visitPrint (self,node):

	g.trace()
    if node.dest:
        self.visit(node.dest)
	for z in node.nodes:
		self.visit(z)
</t>
<t tx="ekr.20061205065240.24">def visitPrintnl (self,node):

	g.trace()
    if node.dest:
        self.visit(node.dest)
	for z in node.nodes:
		self.visit(z)
</t>
<t tx="ekr.20061205065240.25">def visitRaise (self,node):  
	
    g.trace()
    self.visit(expr1)
    self.visit(expr2)
    self.visit(expr3)
</t>
<t tx="ekr.20061205065240.27">def visitSlice (self,node):
    
	g.trace(flags)
    self.visit(node.expr)
    if node.lower:
        self.visit(node.lower)
    if node.upper:
        self.visit(node.upper)
</t>
<t tx="ekr.20061205065240.28">def visitSliceobj (self,node):

	g.trace()
	for z in node.nodes:
		self.visit(z)
</t>
<t tx="ekr.20061205065240.31">def visitSubscript (self,node):
    
	g.trace(node.flags)
    self.visit(node.expr)
    for z in node.subs:
        self.visit(z)
</t>
<t tx="ekr.20061205065240.32">def visitTryExcept (self,node):

	g.trace()
	for z in node.body:
		self.visit(z)
    for z in node.handlers:
        self.visit(z)
    if node.else_:
        self.visit(node.else_)
</t>
<t tx="ekr.20061205065240.33">def visitTryFinally (self,node):

	g.trace()
	for z in node.body:
		self.visit(z)
    self.visit(node.final)
</t>
<t tx="ekr.20061205065240.34">def visitTuple (self,node):

	g.trace()

	for z in node.nodes:
		self.visit(z)
</t>
<t tx="ekr.20061205065240.37">def visitWhile (self,node):

    code = []
    
    e = self.visit(node.test)
    code.append('%swhile (%s) {\n' % (self.indent,e))
    
    # Handle the body.
    for z in node.body:
        self.push()
        s = self.visit(z)
        self.pop()
        code.append(s)
    code.append('%s}\n' % self.indent)
 
    if node.else_:
        self.push()
        theElse = self.visit(node.else_)
        self.pop()
        s = '\n%selse {\n%s%s}' % (self.indent,theElse,self.indent)
        code.append(s)
    
    theWhile = ''.join(code).rstrip() + '\n'
    return theWhile</t>
<t tx="ekr.20061205065240.38">def visitWith (self,node):

	g.trace()
    for z in node.vars:
        self.visit(z)
    self.visit(node.expr)
	for z in node.body:
		self.visit(z)
</t>
<t tx="ekr.20061205073149">def push (self):
    
    name = g.callers(3)
    # g.trace('begin',name)
    self.stack.append(name)
    self.indent = ' ' * (4 *len(self.stack))
    
def pop (self):
    
    if self.stack:
        name = self.stack.pop()
        # g.trace('end',name)
    else:
        g.trace('can not happen')
    
    self.indent = ' ' * (4 *len(self.stack))</t>
<t tx="ekr.20061205140652"></t>
<t tx="ekr.20061205140652.1"></t>
<t tx="ekr.20061205140652.2"></t>
<t tx="ekr.20061205140652.4"></t>
<t tx="ekr.20061205140652.5"></t>
<t tx="ekr.20061205140652.6"></t>
<t tx="ekr.20061205140652.7"></t>
<t tx="ekr.20061205141200"></t>
<t tx="ekr.20061205142616">def visitAnd (node):            return self.nary(node,'&amp;&amp;')
def visitBitand (self,node):    return self.nary(node,'&amp;')
def visitBitor (self,node):     return self.nary(node,'|')
def visitBitxor (self,node):    return self.nary(node,'^')
def visitOr (self,node):        return self.nary(node,'||')

def nary(self,node,op):
    result = ''
    for z in node.nodes:
        e = self.visit(z)
        if result:
            result = '(%s %s %s)' % (result,e,op)
        else:
            result = e
    return result


</t>
<t tx="ekr.20061205143033">def visitAdd (self,node):       return self.binary(node,'+')
def visitDiv (self,node):       return self.binary(node,'/')
def visitFloorDiv (self,node):  return self.binary(node,'//')
def visitLeftShift (self,node): return self.binary(node,'&gt;&gt;')
def visitMod (self,node):       return self.binary(node,'%')
def visitMul (self,node):       return self.binary(node,'*')
def visitPower (self,node):     return self.binary(node,'**')
def visitRightShift (self,node):return self.binary(node,'&lt;&lt;')
def visitSub (self,node):       return self.binary(node,'-')

def binary (self,node,op):
    
    rt = self.visit(node.right)
    lt = self.visit(node.left)
    return '(%s %s %s)' % (lt,op,rt)
</t>
<t tx="ekr.20061205143033.1">def visitInvert (self,node):    return self.unary(node,'!')
def visitNot (self,node):       return self.unary(node,'not')
def visitUnaryAdd (self,node):  return self.unary(node,'') # adds parens.
def visitUnarySub (self,node):  return self.unary(node,'-')

def unary (self,node,op):
    e = self.visit(node.expr)
    return '(%s %s)' % (op,e)
</t>
<t tx="ekr.20061205153740"></t>
<t tx="ekr.20061205162824"></t>
<t tx="ekr.20061205163522">@

Augmented assignments.
Symbol table ???</t>
<t tx="ekr.20061205163522.1"># These may be banned from RPython.</t>
</tnodes>
</leo_file>
