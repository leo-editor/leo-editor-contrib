<?xml version="1.0" encoding="UTF-8"?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="97" clone_windows="0"/>
<globals body_outline_ratio="0.5">
	<global_window_position top="10" left="10" height="25" width="60"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences allow_rich_text="0">
</preferences>
<find_panel_settings>
	<find_string></find_string>
	<change_string></change_string>
</find_panel_settings>
<vnodes>
<v t="T1" a="V"><vh>Read me</vh></v>
<v t="T2" a="EM"><vh>ceval.c (main interpreter)</vh>
<v t="T3"><vh>&lt;&lt; ceval #includes &gt;&gt;</vh></v>
<v t="T4"><vh>&lt;&lt; ceval declarations &gt;&gt;</vh>
<v t="T5"><vh>&lt;&lt; declare static functions &gt;&gt;</vh></v>
<v t="T6"><vh>&lt;&lt; define error messages &gt;&gt;</vh></v>
</v>
<v t="T7" a="M"><vh>eval_frame (main interp)</vh>
<v t="T8"><vh>&lt;&lt; define vars &gt;&gt;</vh></v>
<v t="T9"><vh>&lt;&lt; define macros &gt;&gt;</vh></v>
<v t="T10"><vh>&lt;&lt; initialize &gt;&gt;</vh>
<v t="T11"><vh>&lt;&lt; initialize tracing &gt;&gt;</vh></v>
</v>
<v t="T12"><vh>&lt;&lt; start loop &gt;&gt;</vh>
<v t="T13"><vh>&lt;&lt; handle periodic things &gt;&gt;</vh></v>
<v t="T14"><vh>&lt;&lt; set f-&gt;f_lasti if debugging or tracing &gt;&gt;</vh></v>
<v t="T15"><vh>&lt;&lt; handle tracing and profiling &gt;&gt;</vh></v>
</v>
<v t="T16"><vh>&lt;&lt; opcode cases &gt;&gt;</vh>
<v t="T17"><vh>&lt;&lt; arithmetic cases &gt;&gt;</vh></v>
<v t="T18" a="M"><vh>&lt;&lt; build, const, unpack cases &gt;&gt;</vh></v>
<v t="T19"><vh>&lt;&lt; call cases &gt;&gt;</vh></v>
<v t="T20"><vh>&lt;&lt; compare cases &gt;&gt;</vh></v>
<v t="T21"><vh>&lt;&lt; default case &gt;&gt;</vh></v>
<v t="T22"><vh>&lt;&lt; delete cases &gt;&gt;</vh></v>
<v t="T23"><vh>&lt;&lt; extended arg case &gt;&gt;</vh></v>
<v t="T24"><vh>&lt;&lt; flow-of-control cases &gt;&gt;</vh></v>
<v t="T25"><vh>&lt;&lt; import cases &gt;&gt;</vh></v>
<v t="T26"><vh>&lt;&lt; jump case &gt;&gt;</vh></v>
<v t="T27"><vh>&lt;&lt; load cases &gt;&gt;</vh></v>
<v t="T28"><vh>&lt;&lt; make cases &gt;&gt;</vh></v>
<v t="T29"><vh>&lt;&lt; print cases &gt;&gt;</vh></v>
<v t="T30"><vh>&lt;&lt; set_lineno case &gt;&gt;</vh></v>
<v t="T31"><vh>&lt;&lt; stack cases &gt;&gt;</vh></v>
<v t="T32"><vh>&lt;&lt; store cases &gt;&gt;</vh></v>
<v t="T33"><vh>&lt;&lt; string cases &gt;&gt;</vh></v>
<v t="T34"><vh>&lt;&lt; subscript cases &gt;&gt;</vh></v>
</v>
<v t="T35"><vh>&lt;&lt; end loop &gt;&gt;</vh></v>
<v t="T36"><vh>&lt;&lt; finalize &gt;&gt;</vh></v>
</v>
<v><vh>PyEval... Helpers that may be called externally</vh>
<v t="T37"><vh>Asynchronous callbacks</vh>
<v t="T38"><vh>Py_AddPendingCall</vh></v>
<v t="T39"><vh>Py_MakePendingCalls</vh></v>
</v>
<v t="T40"><vh>PyEval_CallObjectWithKeywords</vh></v>
<v t="T41"><vh>PyEval_CallObject (ceval)</vh></v>
<v t="T42"><vh>PyEval_EvalCode &amp; why_code</vh></v>
<v t="T43"><vh>PyEval_EvalCodeEx</vh></v>
<v><vh>PyEval... Getters &amp; Setters &amp; Py_Get/SetRecursionLimit</vh>
<v t="T44"><vh>Py_GetRecursionLimit</vh></v>
<v t="T45"><vh>Py_SetRecursionLimit</vh></v>
<v t="T46"><vh>PyEval_GetBuiltins</vh></v>
<v t="T47"><vh>PyEval_GetFrame</vh></v>
<v t="T48"><vh>PyEval_GetFuncDesc</vh></v>
<v t="T49"><vh>PyEval_GetFuncName</vh></v>
<v t="T50"><vh>PyEval_GetGlobals</vh></v>
<v t="T51"><vh>PyEval_GetLocals</vh></v>
<v t="T52"><vh>PyEval_GetRestricted</vh></v>
<v t="T53"><vh>PyEval_SetProfile</vh></v>
<v t="T54"><vh>PyEval_SetTrace</vh></v>
</v>
<v t="T55"><vh>PyEval_MergeCompilerFlags</vh></v>
<v><vh>PyEval...Threads...</vh>
<v t="T56"><vh>PyEval_InitThreads</vh></v>
<v t="T57"><vh>PyEval_AcquireLock</vh></v>
<v t="T58"><vh>PyEval_ReleaseLock</vh></v>
<v t="T59"><vh>PyEval_AcquireThread</vh></v>
<v t="T60"><vh>PyEval_ReleaseThread</vh></v>
<v t="T61"><vh>PyEval_ReInitThreads</vh></v>
<v t="T62"><vh>PyEval_SaveThread</vh></v>
<v t="T63"><vh>PyEval_RestoreThread</vh></v>
</v>
</v>
<v><vh>static methods</vh>
<v t="T64"><vh>_Py_GetDXProfile</vh></v>
<v t="T65"><vh>build_class</vh></v>
<v t="T66"><vh>cmp_outcome</vh></v>
<v><vh>exceptions &amp; errors...</vh>
<v t="T67"><vh>do_raise</vh></v>
<v t="T68"><vh>format_exc_check_arg</vh></v>
<v t="T69"><vh>reset_exc_info</vh></v>
<v t="T70"><vh>set_exc_info</vh></v>
</v>
<v t="T71"><vh>exec_statement</vh></v>
<v a="M"><vh>function calls...</vh>
<v t="T72"><vh>fast_cfunction</vh></v>
<v t="T73"><vh>fast_function</vh></v>
<v t="T74"><vh>update_keyword_args</vh></v>
<v t="T75"><vh>update_star_args</vh></v>
<v t="T76"><vh>load_args (calls PyTuple_SET_ITEM)</vh></v>
<v t="T77"><vh>do_call (calls PyObject_Call)</vh></v>
<v t="T78"><vh>ext_do_call (expensive)</vh></v>
</v>
<v><vh>gen_ ... (generators and iterators)</vh>
<v t="T79"><vh>gen_new</vh></v>
<v t="T80"><vh>gen_traverse</vh></v>
<v t="T81"><vh>gen_dealloc</vh></v>
<v t="T82"><vh>gen_iternext</vh></v>
<v t="T83"><vh>gen_next</vh></v>
<v t="T84"><vh>gen_getiter</vh></v>
</v>
<v t="T85"><vh>getarray</vh></v>
<v><vh>import...</vh>
<v t="T86"><vh>import_from</vh></v>
<v t="T87"><vh>import_all_from</vh></v>
</v>
<v t="T88"><vh>loop_subscript</vh></v>
<v><vh>slices...</vh>
<v t="T89"><vh>_PyEval_SliceIndex</vh></v>
<v t="T90"><vh>apply_slice</vh></v>
<v t="T91"><vh>assign_slice</vh></v>
</v>
<v><vh>tracing...</vh>
<v t="T92"><vh>prtrace</vh></v>
<v t="T93"><vh>call_exc_trace</vh></v>
<v t="T94"><vh>call_trace_protected</vh></v>
<v t="T95"><vh>call_trace</vh></v>
<v t="T96"><vh>Py_FlushLine</vh></v>
</v>
<v t="T97"><vh>unpack_iterable</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="T1">This file shows how to use Leo to make complex code more clear.</t>
<t tx="T2">@ignore
@language c

/* Execute compiled code */

/* XXX TO DO:
   XXX speed up searching for keywords by using a dictionary
   XXX document it!
   */

&lt;&lt; ceval #includes &gt;&gt;
&lt;&lt; ceval declarations &gt;&gt;

@others</t>
<t tx="T3">#include "Python.h"

#include "compile.h"
#include "frameobject.h"
#include "eval.h"
#include "opcode.h"
#include "structmember.h"

#ifdef macintosh
#include "macglue.h"
#endif

#include &lt;ctype.h&gt;</t>
<t tx="T4">/* Turn this on if your compiler chokes on the big switch: */
/* #define CASE_TOO_BIG 1 */

#ifdef Py_DEBUG
	/* For debugging the interpreter: */
	#define LLTRACE  1	/* Low-level trace feature */
	#define CHECKEXC 1	/* Double-check exception checking */
#endif

typedef PyObject *(*callproc)(PyObject *, PyObject *, PyObject *);

&lt;&lt; declare static functions &gt;&gt;
&lt;&lt; define error messages &gt;&gt;

/* Dynamic execution profile */
#ifdef DYNAMIC_EXECUTION_PROFILE
	#ifdef DXPAIRS
		static long dxpairs[257][256];
		#define dxp dxpairs[256]
	#else
		static long dxp[256];
	#endif
#endif

staticforward PyTypeObject gentype;

typedef struct {
	PyObject_HEAD
	/* The gi_ prefix is intended to remind of generator-iterator. */
	PyFrameObject *gi_frame;
	/* True if generator is being executed. */ 
	int gi_running;
} genobject;</t>
<t tx="T5">/* Forward declarations */ // of private methods.
static PyObject *eval_frame(PyFrameObject *);
static PyObject *fast_function(PyObject *, PyObject ***, int, int, int);
static PyObject *fast_cfunction(PyObject *, PyObject ***, int);
static PyObject *do_call(PyObject *, PyObject ***, int, int);
static PyObject *ext_do_call(PyObject *, PyObject ***, int, int, int);
static PyObject *update_keyword_args(PyObject *, int, PyObject ***,PyObject *);
static PyObject *update_star_args(int, int, PyObject *, PyObject ***);
static PyObject *load_args(PyObject ***, int);
#define CALL_FLAG_VAR 1
#define CALL_FLAG_KW 2

#ifdef LLTRACE
	static int prtrace(PyObject *, char *);
#endif

static int call_trace(Py_tracefunc, PyObject *, PyFrameObject *,
		      int, PyObject *);
static void call_trace_protected(Py_tracefunc, PyObject *,
				 PyFrameObject *, int);
static void call_exc_trace(Py_tracefunc, PyObject *, PyFrameObject *);
static PyObject *loop_subscript(PyObject *, PyObject *);
static PyObject *apply_slice(PyObject *, PyObject *, PyObject *);
static int assign_slice(PyObject *, PyObject *,
			PyObject *, PyObject *);
static PyObject *cmp_outcome(int, PyObject *, PyObject *);
static PyObject *import_from(PyObject *, PyObject *);
static int import_all_from(PyObject *, PyObject *);
static PyObject *build_class(PyObject *, PyObject *, PyObject *);
static int exec_statement(PyFrameObject *,
			  PyObject *, PyObject *, PyObject *);
static void set_exc_info(PyThreadState *, PyObject *, PyObject *, PyObject *);
static void reset_exc_info(PyThreadState *);
static void format_exc_check_arg(PyObject *, char *, PyObject *);</t>
<t tx="T6">#define NAME_ERROR_MSG \
	"name '%.200s' is not defined"
#define GLOBAL_NAME_ERROR_MSG \
	"global name '%.200s' is not defined"
#define UNBOUNDLOCAL_ERROR_MSG \
	"local variable '%.200s' referenced before assignment"
#define UNBOUNDFREE_ERROR_MSG \
	"free variable '%.200s' referenced before assignment" \
        " in enclosing scope"</t>
<t tx="T7">/* Interpreter main loop */

static PyObject *
eval_frame(PyFrameObject *f)
{
	&lt;&lt; define vars &gt;&gt;
	&lt;&lt; define macros &gt;&gt;
	&lt;&lt; initialize &gt;&gt;
	why = WHY_NOT; err = 0;
	w = NULL; x = Py_None;	/* Not a reference, just anything non-NULL */
	for (;;) {
		&lt;&lt; start loop &gt;&gt;
		switch (opcode) {
		&lt;&lt; opcode cases &gt;&gt;
		}
		&lt;&lt; end loop &gt;&gt;
	}
	&lt;&lt; finalize &gt;&gt;
	return retval;
}</t>
<t tx="T8">#ifdef DXPAIRS
int lastopcode = 0;
#endif

PyObject **stack_pointer; /* Next free slot in value stack */

register unsigned char *next_instr;
register int opcode=0;	/* Current opcode */
register int oparg=0;	/* Current opcode argument, if any */
register enum why_code why; /* Reason for block stack unwind */
register int err;	/* Error status -- nonzero if error */

register PyObject *x;	/* Result object -- NULL if error */
register PyObject *v;	/* Temporary objects popped off stack */
register PyObject *w;
register PyObject *u;
register PyObject *t;

register PyObject *stream = NULL;    /* for PRINT opcodes */
register PyObject **fastlocals, **freevars;
PyObject *retval = NULL;	/* Return value */
PyThreadState *tstate = PyThreadState_GET();
PyCodeObject *co;
unsigned char *first_instr;

#ifdef LLTRACE
	int lltrace;
#endif

#if defined(Py_DEBUG) || defined(LLTRACE)
	/* Make it easier to find out where we are with a debugger */
	char *filename;
#endif</t>
<t tx="T9">// EKR: from object.h

#define Py_INCREF(op) ((op)-&gt;ob_refcnt++)
#define Py_DECREF(op) { if (--op-&gt;ob_refcnt == 0) _Py_Dealloc(op) }

// EKR: from frameobject.h

#define GETITEM(v, i)     PyTuple_GET_ITEM((PyTupleObject *)(v), (i))
#define GETITEMNAME(v, i) PyString_AS_STRING( (PyStringObject *) GETITEM((v),(i)) )

#define Getconst(f, i)	(GETITEM(     (f)-&gt;f_code-&gt;co_consts, (i) ))
#define Getname(f, i)	 (GETITEMNAME( (f)-&gt;f_code-&gt;co_names,  (i) ))
#define Getnamev(f, i)	(GETITEM(     (f)-&gt;f_code-&gt;co_names,  (i) ))

// EKR: from tupleobject.h

#define PyTuple_GET_ITEM(op, i)    (((PyTupleObject *)(op))-&gt;ob_item[i])
#define PyTuple_GET_SIZE(op)       (((PyTupleObject *)(op))-&gt;ob_size)
#define PyTuple_SET_ITEM(op, i, v) (((PyTupleObject *)(op))-&gt;ob_item[i] = v)

/* Code access macros */

#define GETCONST(i)	Getconst(f, i)
#define GETNAME(i)	 Getname (f, i)
#define GETNAMEV(i)	Getnamev(f, i)
#define INSTR_OFFSET()	(next_instr - first_instr)
#define NEXTOP()	(*next_instr++)
#define NEXTARG()	(next_instr += 2, (next_instr[-1]&lt;&lt;8) + next_instr[-2])
#define JUMPTO(x)	(next_instr = first_instr + (x))
#define JUMPBY(x)	(next_instr += (x))

/* Stack manipulation macros */

#define STACK_LEVEL()	(stack_pointer - f-&gt;f_valuestack)
#define EMPTY()		(STACK_LEVEL() == 0)
#define TOP()		(stack_pointer[-1])

#define BASIC_PUSH(v)	(*stack_pointer++ = (v))
#define BASIC_POP()	  (*--stack_pointer)

#ifdef LLTRACE
	#define PUSH(v)		{ (void)(BASIC_PUSH(v), \
						   lltrace &amp;&amp; prtrace(TOP(), "push")); \
						   assert(STACK_LEVEL() &lt;= f-&gt;f_stacksize); }
	#define POP()		((void)(lltrace &amp;&amp; prtrace(TOP(), "pop")), BASIC_POP())
#else
	#define PUSH(v)		BASIC_PUSH(v)
	#define POP()		BASIC_POP()
#endif

/* Local variable macros */

#define GETLOCAL(i)	(fastlocals[i])
#define SETLOCAL(i, value)	\
	do { Py_XDECREF(GETLOCAL(i)); \
		GETLOCAL(i) = value;\
	} while (0)</t>
<t tx="T10">/* Start of code */
if (f == NULL)
	return NULL;

#ifdef USE_STACKCHECK
	if (tstate-&gt;recursion_depth%10 == 0 &amp;&amp; PyOS_CheckStack()) {
		PyErr_SetString(PyExc_MemoryError, "Stack overflow");
		return NULL;
	}
#endif

/* push frame */
if (++tstate-&gt;recursion_depth &gt; recursion_limit) {
	--tstate-&gt;recursion_depth;
	PyErr_SetString(PyExc_RuntimeError,
			"maximum recursion depth exceeded");
	tstate-&gt;frame = f-&gt;f_back;
	return NULL;
}

tstate-&gt;frame = f;
co = f-&gt;f_code;
fastlocals = f-&gt;f_localsplus;
freevars = f-&gt;f_localsplus + f-&gt;f_nlocals;
_PyCode_GETCODEPTR(co, &amp;first_instr);
next_instr = first_instr + f-&gt;f_lasti;

// EKR: Get the stack pointer from the frame.
stack_pointer = f-&gt;f_stacktop;
assert(stack_pointer != NULL);
f-&gt;f_stacktop = NULL;	/* remains NULL unless yield suspends frame */

if (tstate-&gt;use_tracing) {
	&lt;&lt; initialize tracing &gt;&gt;
}

#ifdef LLTRACE
	lltrace = PyDict_GetItemString(f-&gt;f_globals,"__lltrace__") != NULL;
#endif

#if defined(Py_DEBUG) || defined(LLTRACE)
	filename = PyString_AsString(co-&gt;co_filename);
#endif</t>
<t tx="T11">@ tstate-&gt;c_tracefunc, if defined, is a function that will be called on *every* entry to a code block.  Its return value, if not None, is a function that will be called at the start of each executed line of code. (Actually, the function must return itself in order to continue tracing.)
	   
The trace functions are called with three arguments: a pointer to the current frame, a string indicating why the function is called, and an argument which depends on the situation. The global trace function is also called whenever an exception is detected.
@c

if (tstate-&gt;c_tracefunc != NULL) {
	if (call_trace(tstate-&gt;c_tracefunc, tstate-&gt;c_traceobj,
			   f, PyTrace_CALL, Py_None)) {
		/* Trace function raised an error */
		return NULL;
	}
}

@ Similar for c_profilefunc, except it needn't return itself and isn't called for "line" events.
@c

if (tstate-&gt;c_profilefunc != NULL) {
	if (call_trace(tstate-&gt;c_profilefunc,
			   tstate-&gt;c_profileobj,
			   f, PyTrace_CALL, Py_None)) {
		/* Profile function raised an error */
		return NULL;
	}
}</t>
<t tx="T12">assert(stack_pointer &gt;= f-&gt;f_valuestack);	/* else underflow */
assert(STACK_LEVEL() &lt;= f-&gt;f_stacksize);	/* else overflow */

if (things_to_do || --tstate-&gt;ticker &lt; 0) {
	&lt;&lt; handle periodic things &gt;&gt;
}

&lt;&lt; set f-&gt;f_lasti if debugging or tracing &gt;&gt;

opcode = NEXTOP();

if (HAS_ARG(opcode))
	oparg = NEXTARG();

dispatch_opcode:

&lt;&lt; handle tracing and profiling &gt;&gt;</t>
<t tx="T13">@ Doing this every time through the loop would add too much overhead, so we do it only every Nth instruction.  We also do it if ``things_to_do'' is set, i.e. when an asynchronous event needs attention (e.g. a signal handler or async I/O handler); see Py_AddPendingCall() and Py_MakePendingCalls() above.
@c

tstate-&gt;ticker = tstate-&gt;interp-&gt;checkinterval;
if (things_to_do) {
	if (Py_MakePendingCalls() &lt; 0) {
		why = WHY_EXCEPTION;
		goto on_error;
	}
}
#if !defined(HAVE_SIGNAL_H) || defined(macintosh)
	/* If we have true signals, the signal handler
	   will call Py_AddPendingCall() so we don't
	   have to call sigcheck().  On the Mac and
	   DOS, alas, we have to call it. */
	if (PyErr_CheckSignals()) {
		why = WHY_EXCEPTION;
		goto on_error;
	}
#endif

#ifdef WITH_THREAD
	if (interpreter_lock) {
		/* Give another thread a chance */

		if (PyThreadState_Swap(NULL) != tstate)
			Py_FatalError("ceval: tstate mix-up");
		PyThread_release_lock(interpreter_lock);

		/* Other threads may run now */

		PyThread_acquire_lock(interpreter_lock, 1);
		if (PyThreadState_Swap(tstate) != NULL)
			Py_FatalError("ceval: orphan tstate");
	}
#endif</t>
<t tx="T14">#if defined(Py_DEBUG) || defined(LLTRACE)
	f-&gt;f_lasti = INSTR_OFFSET();
#endif</t>
<t tx="T15">#ifdef DYNAMIC_EXECUTION_PROFILE
	#ifdef DXPAIRS
		dxpairs[lastopcode][opcode]++;
		lastopcode = opcode;
	#endif
		dxp[opcode]++;
#endif

#ifdef LLTRACE
	/* Instruction tracing */
	if (lltrace) {
		if (HAS_ARG(opcode)) {
			printf("%d: %d, %d\n",
				(int) (INSTR_OFFSET() - 3), opcode, oparg);
		}
		else {
			printf("%d: %d\n",
				(int) (INSTR_OFFSET() - 1), opcode);
		}
	}
#endif</t>
<t tx="T16">@ BEWARE! It is essential that any operation that fails sets either, x to NULL, err to nonzero, or why to anything but WHY_NOT, and that no operation that succeeds does this!

EKR: i.e., any one of the folowing denotes failure:
1. setting x to NULL,
2. setting err to nonzero,
3. setting why to anything but WHY_NOT.
@c

/* case STOP_CODE: this is an error! */

&lt;&lt; arithmetic cases &gt;&gt;
&lt;&lt; print cases &gt;&gt;
&lt;&lt; stack cases &gt;&gt;
&lt;&lt; string cases &gt;&gt;
&lt;&lt; subscript cases &gt;&gt;

#ifdef CASE_TOO_BIG
default: switch (opcode) {
#endif

&lt;&lt; build, const, unpack cases &gt;&gt;
&lt;&lt; call cases &gt;&gt;
&lt;&lt; compare cases &gt;&gt;
&lt;&lt; delete cases &gt;&gt;
&lt;&lt; extended arg case &gt;&gt;
&lt;&lt; flow-of-control cases &gt;&gt;
&lt;&lt; import cases &gt;&gt;
&lt;&lt; jump case &gt;&gt;
&lt;&lt; load cases &gt;&gt;
&lt;&lt; make cases &gt;&gt;
&lt;&lt; set_lineno case &gt;&gt;
&lt;&lt; store cases &gt;&gt;
default:
	&lt;&lt; default case &gt;&gt;

#ifdef CASE_TOO_BIG
}
#endif</t>
<t tx="T17">case UNARY_POSITIVE:
	v = POP();
	x = PyNumber_Positive(v);
	Py_DECREF(v);
	PUSH(x);
	if (x != NULL) continue;
	break;

case UNARY_NEGATIVE:
	v = POP();
	x = PyNumber_Negative(v);
	Py_DECREF(v);
	PUSH(x);
	if (x != NULL) continue;
	break;

case UNARY_NOT:
	v = POP();
	err = PyObject_IsTrue(v);
	Py_DECREF(v);
	if (err == 0) {
		Py_INCREF(Py_True);
		PUSH(Py_True);
		continue;
	}
	else if (err &gt; 0) {
		Py_INCREF(Py_False);
		PUSH(Py_False);
		err = 0;
		continue;
	}
	break;

case UNARY_CONVERT:
	v = POP();
	x = PyObject_Repr(v);
	Py_DECREF(v);
	PUSH(x);
	if (x != NULL) continue;
	break;

case UNARY_INVERT:
	v = POP();
	x = PyNumber_Invert(v);
	Py_DECREF(v);
	PUSH(x);
	if (x != NULL) continue;
	break;

case BINARY_POWER:
	w = POP();
	v = POP();
	x = PyNumber_Power(v, w, Py_None);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case BINARY_MULTIPLY:
	w = POP();
	v = POP();
	x = PyNumber_Multiply(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case BINARY_DIVIDE:
	if (!_Py_QnewFlag) {
		w = POP();
		v = POP();
		x = PyNumber_Divide(v, w);
		Py_DECREF(v);
		Py_DECREF(w);
		PUSH(x);
		if (x != NULL) continue;
		break;
	}
	/* -Qnew is in effect:  fall through to
	   BINARY_TRUE_DIVIDE */
case BINARY_TRUE_DIVIDE:
	w = POP();
	v = POP();
	x = PyNumber_TrueDivide(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case BINARY_FLOOR_DIVIDE:
	w = POP();
	v = POP();
	x = PyNumber_FloorDivide(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case BINARY_MODULO:
	w = POP();
	v = POP();
	x = PyNumber_Remainder(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case BINARY_ADD:
	w = POP();
	v = POP();
	if (PyInt_CheckExact(v) &amp;&amp; PyInt_CheckExact(w)) {
		/* INLINE: int + int */
		register long a, b, i;
		a = PyInt_AS_LONG(v);
		b = PyInt_AS_LONG(w);
		i = a + b;
		if ((i^a) &lt; 0 &amp;&amp; (i^b) &lt; 0)
			goto slow_add;
		x = PyInt_FromLong(i);
	}
	else {
	  slow_add:
		x = PyNumber_Add(v, w);
	}
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case BINARY_SUBTRACT:
	w = POP();
	v = POP();
	if (PyInt_CheckExact(v) &amp;&amp; PyInt_CheckExact(w)) {
		/* INLINE: int - int */
		register long a, b, i;
		a = PyInt_AS_LONG(v);
		b = PyInt_AS_LONG(w);
		i = a - b;
		if ((i^a) &lt; 0 &amp;&amp; (i^~b) &lt; 0)
			goto slow_sub;
		x = PyInt_FromLong(i);
	}
	else {
	  slow_sub:
		x = PyNumber_Subtract(v, w);
	}
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case BINARY_SUBSCR:
	w = POP();
	v = POP();
	if (PyList_CheckExact(v) &amp;&amp; PyInt_CheckExact(w)) {
		/* INLINE: list[int] */
		long i = PyInt_AsLong(w);
		if (i &lt; 0)
			i += PyList_GET_SIZE(v);
		if (i &lt; 0 ||
		    i &gt;= PyList_GET_SIZE(v)) {
			PyErr_SetString(PyExc_IndexError,
				"list index out of range");
			x = NULL;
		}
		else {
			x = PyList_GET_ITEM(v, i);
			Py_INCREF(x);
		}
	}
	else
		x = PyObject_GetItem(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case BINARY_LSHIFT:
	w = POP();
	v = POP();
	x = PyNumber_Lshift(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case BINARY_RSHIFT:
	w = POP();
	v = POP();
	x = PyNumber_Rshift(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case BINARY_AND:
	w = POP();
	v = POP();
	x = PyNumber_And(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case BINARY_XOR:
	w = POP();
	v = POP();
	x = PyNumber_Xor(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case BINARY_OR:
	w = POP();
	v = POP();
	x = PyNumber_Or(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case INPLACE_POWER:
	w = POP();
	v = POP();
	x = PyNumber_InPlacePower(v, w, Py_None);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case INPLACE_MULTIPLY:
	w = POP();
	v = POP();
	x = PyNumber_InPlaceMultiply(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case INPLACE_DIVIDE:
	w = POP();
	v = POP();
	x = PyNumber_InPlaceDivide(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case INPLACE_FLOOR_DIVIDE:
	w = POP();
	v = POP();
	x = PyNumber_InPlaceFloorDivide(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case INPLACE_TRUE_DIVIDE:
	w = POP();
	v = POP();
	x = PyNumber_InPlaceTrueDivide(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case INPLACE_MODULO:
	w = POP();
	v = POP();
	x = PyNumber_InPlaceRemainder(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case INPLACE_ADD:
	w = POP();
	v = POP();
	if (PyInt_CheckExact(v) &amp;&amp; PyInt_CheckExact(w)) {
		/* INLINE: int + int */
		register long a, b, i;
		a = PyInt_AS_LONG(v);
		b = PyInt_AS_LONG(w);
		i = a + b;
		if ((i^a) &lt; 0 &amp;&amp; (i^b) &lt; 0)
			goto slow_iadd;
		x = PyInt_FromLong(i);
	}
	else {
	  slow_iadd:
		x = PyNumber_InPlaceAdd(v, w);
	}
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case INPLACE_SUBTRACT:
	w = POP();
	v = POP();
	if (PyInt_CheckExact(v) &amp;&amp; PyInt_CheckExact(w)) {
		/* INLINE: int - int */
		register long a, b, i;
		a = PyInt_AS_LONG(v);
		b = PyInt_AS_LONG(w);
		i = a - b;
		if ((i^a) &lt; 0 &amp;&amp; (i^~b) &lt; 0)
			goto slow_isub;
		x = PyInt_FromLong(i);
	}
	else {
	  slow_isub:
		x = PyNumber_InPlaceSubtract(v, w);
	}
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case INPLACE_LSHIFT:
	w = POP();
	v = POP();
	x = PyNumber_InPlaceLshift(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case INPLACE_RSHIFT:
	w = POP();
	v = POP();
	x = PyNumber_InPlaceRshift(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case INPLACE_AND:
	w = POP();
	v = POP();
	x = PyNumber_InPlaceAnd(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case INPLACE_XOR:
	w = POP();
	v = POP();
	x = PyNumber_InPlaceXor(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case INPLACE_OR:
	w = POP();
	v = POP();
	x = PyNumber_InPlaceOr(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;</t>
<t tx="T18">case BUILD_CLASS:
	u = POP();
	v = POP();
	w = POP();
	x = build_class(u, v, w);
	PUSH(x);
	Py_DECREF(u);
	Py_DECREF(v);
	Py_DECREF(w);
	break;
	
case BUILD_LIST:
	x = PyList_New(oparg);
	if (x != NULL) {
		for (; --oparg &gt;= 0;) {
			w = POP();
			PyList_SET_ITEM(x, oparg, w);
		}
		PUSH(x);
		continue;
	}
	break;

case BUILD_MAP:
	x = PyDict_New();
	PUSH(x);
	if (x != NULL) continue;
	break;
	
case BUILD_SLICE:
	if (oparg == 3)
		w = POP();
	else
		w = NULL;
	v = POP();
	u = POP();
	x = PySlice_New(u, v, w);
	Py_DECREF(u);
	Py_DECREF(v);
	Py_XDECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;
	
case BUILD_TUPLE:
	x = PyTuple_New(oparg);
	if (x != NULL) {
		for (; --oparg &gt;= 0;) {
			w = POP();
			PyTuple_SET_ITEM(x, oparg, w);
		}
		PUSH(x);
		continue;
	}
	break;
	
case UNPACK_SEQUENCE:
	v = POP();
	if (PyTuple_Check(v)) {
		if (PyTuple_Size(v) != oparg) {
			PyErr_SetString(PyExc_ValueError,
				 "unpack tuple of wrong size");
			why = WHY_EXCEPTION;
		}
		else {
			for (; --oparg &gt;= 0; ) {
				w = PyTuple_GET_ITEM(v, oparg);
				Py_INCREF(w);
				PUSH(w);
			}
		}
	}
	else if (PyList_Check(v)) {
		if (PyList_Size(v) != oparg) {
			PyErr_SetString(PyExc_ValueError,
				  "unpack list of wrong size");
			why = WHY_EXCEPTION;
		}
		else {
			for (; --oparg &gt;= 0; ) {
				w = PyList_GET_ITEM(v, oparg);
				Py_INCREF(w);
				PUSH(w);
			}
		}
	}
	else if (unpack_iterable(v, oparg,
				 stack_pointer + oparg))
		stack_pointer += oparg;
	else {
		if (PyErr_ExceptionMatches(PyExc_TypeError))
			PyErr_SetString(PyExc_TypeError,
				"unpack non-sequence");
		why = WHY_EXCEPTION;
	}
	Py_DECREF(v);
	break;</t>
<t tx="T19">case CALL_FUNCTION:
{
    int na = oparg &amp; 0xff;
    int nk = (oparg&gt;&gt;8) &amp; 0xff;
    int n = na + 2 * nk;
    PyObject **pfunc = stack_pointer - n - 1;
    PyObject *func = *pfunc;
    f-&gt;f_lasti = INSTR_OFFSET() - 3; /* For tracing */

    /* Always dispatch PyCFunction first, because
       these are presumed to be the most frequent
       callable object.
    */
    if (PyCFunction_Check(func)) {
	    int flags = PyCFunction_GET_FLAGS(func);
	    if (nk != 0 || (flags &amp; METH_KEYWORDS))
		    x = do_call(func, &amp;stack_pointer,
				na, nk);
	    else if (flags == METH_VARARGS) {
		    PyObject *callargs;
		    callargs = load_args(&amp;stack_pointer, na);
		    x = PyCFunction_Call(func, callargs, NULL);
		    Py_XDECREF(callargs); 
	    } else
		    x = fast_cfunction(func,
				       &amp;stack_pointer, na);
    } else {
	    if (PyMethod_Check(func)
		&amp;&amp; PyMethod_GET_SELF(func) != NULL) {
		    /* optimize access to bound methods */
		    PyObject *self = PyMethod_GET_SELF(func);
		    Py_INCREF(self);
		    func = PyMethod_GET_FUNCTION(func);
		    Py_INCREF(func);
		    Py_DECREF(*pfunc);
		    *pfunc = self;
		    na++;
		    n++;
	    } else
		    Py_INCREF(func);
	    if (PyFunction_Check(func)) {
		    x = fast_function(func, &amp;stack_pointer,
				      n, na, nk);
	    } else {
		    x = do_call(func, &amp;stack_pointer,
				na, nk);
	    }
	    Py_DECREF(func);
    }

    while (stack_pointer &gt; pfunc) {
	    w = POP();
	    Py_DECREF(w);
    }
    PUSH(x);
    if (x != NULL)
	    continue;
    break;
}

case CALL_FUNCTION_VAR:
case CALL_FUNCTION_KW:
case CALL_FUNCTION_VAR_KW:
{
    int na = oparg &amp; 0xff;
    int nk = (oparg&gt;&gt;8) &amp; 0xff;
    int flags = (opcode - CALL_FUNCTION) &amp; 3;
    int n = na + 2 * nk;
    PyObject **pfunc, *func;
    if (flags &amp; CALL_FLAG_VAR)
	    n++;
    if (flags &amp; CALL_FLAG_KW)
	    n++;
    pfunc = stack_pointer - n - 1;
    func = *pfunc;
    f-&gt;f_lasti = INSTR_OFFSET() - 3; /* For tracing */

    if (PyMethod_Check(func)
	&amp;&amp; PyMethod_GET_SELF(func) != NULL) {
	    PyObject *self = PyMethod_GET_SELF(func);
	    Py_INCREF(self);
	    func = PyMethod_GET_FUNCTION(func);
	    Py_INCREF(func);
	    Py_DECREF(*pfunc);
	    *pfunc = self;
	    na++;
	    n++;
    } else
	    Py_INCREF(func);
    x = ext_do_call(func, &amp;stack_pointer, flags, na, nk);
    Py_DECREF(func);

    while (stack_pointer &gt; pfunc) {
	    w = POP();
	    Py_DECREF(w);
    }
    PUSH(x);
    if (x != NULL)
	    continue;
    break;
}</t>
<t tx="T20">case COMPARE_OP:
	w = POP();
	v = POP();
	if (PyInt_CheckExact(v) &amp;&amp; PyInt_CheckExact(w)) {
		/* INLINE: cmp(int, int) */
		register long a, b;
		register int res;
		a = PyInt_AS_LONG(v);
		b = PyInt_AS_LONG(w);
		switch (oparg) {
		case LT: res = a &lt;  b; break;
		case LE: res = a &lt;= b; break;
		case EQ: res = a == b; break;
		case NE: res = a != b; break;
		case GT: res = a &gt;  b; break;
		case GE: res = a &gt;= b; break;
		case IS: res = v == w; break;
		case IS_NOT: res = v != w; break;
		default: goto slow_compare;
		}
		x = res ? Py_True : Py_False;
		Py_INCREF(x);
	}
	else {
	  slow_compare:
		x = cmp_outcome(oparg, v, w);
	}
	Py_DECREF(v);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;</t>
<t tx="T21">fprintf(stderr,
	"XXX lineno: %d, opcode: %d\n",
	f-&gt;f_lineno, opcode);

PyErr_SetString(PyExc_SystemError, "unknown opcode");
why = WHY_EXCEPTION;
break;</t>
<t tx="T22">case DELETE_ATTR:
	w = GETNAMEV(oparg);
	v = POP();
	err = PyObject_SetAttr(v, w, (PyObject *)NULL);
					/* del v.w */
	Py_DECREF(v);
	break;
	
case DELETE_FAST:
	x = GETLOCAL(oparg);
	if (x == NULL) {
		format_exc_check_arg(
			PyExc_UnboundLocalError,
			UNBOUNDLOCAL_ERROR_MSG,
			PyTuple_GetItem(co-&gt;co_varnames, oparg)
			);
		break;
	}
	SETLOCAL(oparg, NULL);
	continue;
	
case DELETE_GLOBAL:
	w = GETNAMEV(oparg);
	if ((err = PyDict_DelItem(f-&gt;f_globals, w)) != 0)
		format_exc_check_arg(
		    PyExc_NameError, GLOBAL_NAME_ERROR_MSG, w);
	break;

case DELETE_NAME:
	w = GETNAMEV(oparg);
	if ((x = f-&gt;f_locals) == NULL) {
		PyErr_Format(PyExc_SystemError,
			     "no locals when deleting %s",
			     PyObject_REPR(w));
		break;
	}
	if ((err = PyDict_DelItem(x, w)) != 0)
		format_exc_check_arg(PyExc_NameError,
					NAME_ERROR_MSG ,w);
	break;</t>
<t tx="T23">case EXTENDED_ARG:
	opcode = NEXTOP();
	oparg = oparg&lt;&lt;16 | NEXTARG();
	goto dispatch_opcode;</t>
<t tx="T24">case BREAK_LOOP:
	why = WHY_BREAK;
	break;

case CONTINUE_LOOP:
	retval = PyInt_FromLong(oparg);
	why = WHY_CONTINUE;
	break;
	
case EXEC_STMT:
	w = POP();
	v = POP();
	u = POP();
	err = exec_statement(f, u, v, w);
	Py_DECREF(u);
	Py_DECREF(v);
	Py_DECREF(w);
	break;

case FOR_ITER:
	/* before: [iter]; after: [iter, iter()] *or* [] */
	v = TOP();
	x = PyIter_Next(v);
	if (x != NULL) {
		PUSH(x);
		continue;
	}
	if (!PyErr_Occurred()) {
		/* iterator ended normally */
		x = v = POP();
		Py_DECREF(v);
		JUMPBY(oparg);
		continue;
	}
	break;

case FOR_LOOP:
	/* for v in s: ...
	   On entry: stack contains s, i.
	   On exit: stack contains s, i+1, s[i];
	   but if loop exhausted:
	   	s, i are popped, and we jump */
	w = POP(); /* Loop index */
	v = POP(); /* Sequence object */
	u = loop_subscript(v, w);
	if (u != NULL) {
		PUSH(v);
		x = PyInt_FromLong(PyInt_AsLong(w)+1);
		PUSH(x);
		Py_DECREF(w);
		PUSH(u);
		if (x != NULL) continue;
	}
	else {
		Py_DECREF(v);
		Py_DECREF(w);
		/* A NULL can mean "s exhausted"
		   but also an error: */
		if (PyErr_Occurred())
			why = WHY_EXCEPTION;
		else {
			JUMPBY(oparg);
			continue;
		}
	}
	break;
	
case GET_ITER:
	/* before: [obj]; after [getiter(obj)] */
	v = POP();
	x = PyObject_GetIter(v);
	Py_DECREF(v);
	if (x != NULL) {
		PUSH(x);
		continue;
	}
	break;

case RAISE_VARARGS:
	u = v = w = NULL;
	switch (oparg) {
	case 3:
		u = POP(); /* traceback */
		/* Fallthrough */
	case 2:
		v = POP(); /* value */
		/* Fallthrough */
	case 1:
		w = POP(); /* exc */
	case 0: /* Fallthrough */
		why = do_raise(w, v, u);
		break;
	default:
		PyErr_SetString(PyExc_SystemError,
			   "bad RAISE_VARARGS oparg");
		why = WHY_EXCEPTION;
		break;
	}
	break;
	
case SETUP_LOOP:
case SETUP_EXCEPT:
case SETUP_FINALLY:
	PyFrame_BlockSetup(f, opcode, INSTR_OFFSET() + oparg,
			   STACK_LEVEL());
	continue;
	
case POP_BLOCK:
	{
		PyTryBlock *b = PyFrame_BlockPop(f);
		while (STACK_LEVEL() &gt; b-&gt;b_level) {
			v = POP();
			Py_DECREF(v);
		}
	}
	break;

case END_FINALLY:
	v = POP();
	if (PyInt_Check(v)) {
		why = (enum why_code) PyInt_AsLong(v);
		if (why == WHY_RETURN ||
		    why == WHY_YIELD ||
		    why == CONTINUE_LOOP)
			retval = POP();
	}
	else if (PyString_Check(v) || PyClass_Check(v)) {
		w = POP();
		u = POP();
		PyErr_Restore(v, w, u);
		why = WHY_RERAISE;
		break;
	}
	else if (v != Py_None) {
		PyErr_SetString(PyExc_SystemError,
			"'finally' pops bad exception");
		why = WHY_EXCEPTION;
	}
	Py_DECREF(v);
	break;
	
case RETURN_VALUE:
	retval = POP();
	why = WHY_RETURN;
	break;

case YIELD_VALUE:
	retval = POP();
	f-&gt;f_stacktop = stack_pointer;
	f-&gt;f_lasti = INSTR_OFFSET();
	why = WHY_YIELD;
	break;</t>
<t tx="T25">case IMPORT_NAME:
	w = GETNAMEV(oparg);
	x = PyDict_GetItemString(f-&gt;f_builtins, "__import__");
	if (x == NULL) {
		PyErr_SetString(PyExc_ImportError,
				"__import__ not found");
		break;
	}
	u = POP();
	w = Py_BuildValue("(OOOO)",
		    w,
		    f-&gt;f_globals,
		    f-&gt;f_locals == NULL ?
			  Py_None : f-&gt;f_locals,
		    u);
	Py_DECREF(u);
	if (w == NULL) {
		x = NULL;
		break;
	}
	x = PyEval_CallObject(x, w);
	Py_DECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case IMPORT_STAR:
	v = POP();
	PyFrame_FastToLocals(f);
	if ((x = f-&gt;f_locals) == NULL) {
		PyErr_SetString(PyExc_SystemError,
			"no locals found during 'import *'");
		break;
	}
	err = import_all_from(x, v);
	PyFrame_LocalsToFast(f, 0);
	Py_DECREF(v);
	if (err == 0) continue;
	break;

case IMPORT_FROM:
	w = GETNAMEV(oparg);
	v = TOP();
	x = import_from(v, w);
	PUSH(x);
	if (x != NULL) continue;
	break;</t>
<t tx="T26">case JUMP_FORWARD:
	JUMPBY(oparg);
	continue;

case JUMP_IF_FALSE:
	err = PyObject_IsTrue(TOP());
	if (err &gt; 0)
		err = 0;
	else if (err == 0)
		JUMPBY(oparg);
	else
		break;
	continue;

case JUMP_IF_TRUE:
	err = PyObject_IsTrue(TOP());
	if (err &gt; 0) {
		err = 0;
		JUMPBY(oparg);
	}
	else if (err == 0)
		;
	else
		break;
	continue;

case JUMP_ABSOLUTE:
	JUMPTO(oparg);
	continue;</t>
<t tx="T27">case LOAD_ATTR:
	w = GETNAMEV(oparg);
	v = POP();  
	x = PyObject_GetAttr(v, w);  // Expensive?
	Py_DECREF(v);  // if (--op-&gt;ob_refcnt == 0) _Py_Dealloc(op)
	PUSH(x);  // *stack_pointer++ = x
	if (x != NULL) continue;
	break;

case LOAD_CLOSURE:
	x = freevars[oparg];
	Py_INCREF(x);  // x-&gt;ob_refcnt++
	PUSH(x); // *stack_pointer++ = x
	break;

case LOAD_CONST:
	x = GETCONST(oparg);
	Py_INCREF(x);
	PUSH(x);
	break;
	
case LOAD_DEREF:
	x = freevars[oparg];
	w = PyCell_Get(x);
	if (w == NULL) {
		if (oparg &lt; f-&gt;f_ncells) {
			v = PyTuple_GetItem(co-&gt;co_cellvars,
					       oparg);
		       format_exc_check_arg(
			       PyExc_UnboundLocalError,
			       UNBOUNDLOCAL_ERROR_MSG,
			       v);
		} else {
		       v = PyTuple_GetItem(
				      co-&gt;co_freevars,
				      oparg - f-&gt;f_ncells);
		       format_exc_check_arg(
			       PyExc_NameError,
			       UNBOUNDFREE_ERROR_MSG,
			       v);
		}
		err = -1;
		break;
	}
	PUSH(w);
	break;
	
case LOAD_LOCALS:
	if ((x = f-&gt;f_locals) == NULL) {
		PyErr_SetString(PyExc_SystemError,
				"no locals");
		break;
	}
	Py_INCREF(x);
	PUSH(x);
	break;
	
case LOAD_FAST:
	x = GETLOCAL(oparg);
	if (x == NULL) {
		format_exc_check_arg(
			PyExc_UnboundLocalError,
			UNBOUNDLOCAL_ERROR_MSG,
			PyTuple_GetItem(co-&gt;co_varnames, oparg)
			);
		break;
	}
	Py_INCREF(x);
	PUSH(x);
	if (x != NULL) continue;
	break;
	
case LOAD_GLOBAL:
	w = GETNAMEV(oparg);
	x = PyDict_GetItem(f-&gt;f_globals, w);
	if (x == NULL) {
		x = PyDict_GetItem(f-&gt;f_builtins, w);
		if (x == NULL) {
			format_exc_check_arg(
				    PyExc_NameError,
				    GLOBAL_NAME_ERROR_MSG ,w);
			break;
		}
	}
	Py_INCREF(x);
	PUSH(x);
	break;

case LOAD_NAME:
	w = GETNAMEV(oparg);
	if ((x = f-&gt;f_locals) == NULL) {
		PyErr_Format(PyExc_SystemError,
			     "no locals when loading %s",
			     PyObject_REPR(w));
		break;
	}
	x = PyDict_GetItem(x, w);
	if (x == NULL) {
		x = PyDict_GetItem(f-&gt;f_globals, w);
		if (x == NULL) {
			x = PyDict_GetItem(f-&gt;f_builtins, w);
			if (x == NULL) {
				format_exc_check_arg(
					    PyExc_NameError,
					    NAME_ERROR_MSG ,w);
				break;
			}
		}
	}
	Py_INCREF(x);
	PUSH(x);
	break;</t>
<t tx="T28">case MAKE_FUNCTION:
	v = POP(); /* code object */
	x = PyFunction_New(v, f-&gt;f_globals);
	Py_DECREF(v);
	/* XXX Maybe this should be a separate opcode? */
	if (x != NULL &amp;&amp; oparg &gt; 0) {
		v = PyTuple_New(oparg);
		if (v == NULL) {
			Py_DECREF(x);
			x = NULL;
			break;
		}
		while (--oparg &gt;= 0) {
			w = POP();
			PyTuple_SET_ITEM(v, oparg, w);
		}
		err = PyFunction_SetDefaults(x, v);
		Py_DECREF(v);
	}
	PUSH(x);
	break;

case MAKE_CLOSURE:
{
	int nfree;
	v = POP(); /* code object */
	x = PyFunction_New(v, f-&gt;f_globals);
	nfree = PyCode_GetNumFree((PyCodeObject *)v);
	Py_DECREF(v);
	/* XXX Maybe this should be a separate opcode? */
	if (x != NULL &amp;&amp; nfree &gt; 0) {
		v = PyTuple_New(nfree);
		if (v == NULL) {
			Py_DECREF(x);
			x = NULL;
			break;
		}
		while (--nfree &gt;= 0) {
			w = POP();
			PyTuple_SET_ITEM(v, nfree, w);
		}
		err = PyFunction_SetClosure(x, v);
		Py_DECREF(v);
	}
	if (x != NULL &amp;&amp; oparg &gt; 0) {
		v = PyTuple_New(oparg);
		if (v == NULL) {
			Py_DECREF(x);
			x = NULL;
			break;
		}
		while (--oparg &gt;= 0) {
			w = POP();
			PyTuple_SET_ITEM(v, oparg, w);
		}
		err = PyFunction_SetDefaults(x, v);
		Py_DECREF(v);
	}
	PUSH(x);
	break;
}</t>
<t tx="T29">case PRINT_EXPR:
	v = POP();
	w = PySys_GetObject("displayhook");
	if (w == NULL) {
		PyErr_SetString(PyExc_RuntimeError,
				"lost sys.displayhook");
		err = -1;
		x = NULL;
	}
	if (err == 0) {
		x = Py_BuildValue("(O)", v);
		if (x == NULL)
			err = -1;
	}
	if (err == 0) {
		w = PyEval_CallObject(w, x);
		Py_XDECREF(w);
		if (w == NULL)
			err = -1;
	}
	Py_DECREF(v);
	Py_XDECREF(x);
	break;

case PRINT_ITEM_TO:
	w = stream = POP();
	/* fall through to PRINT_ITEM */

case PRINT_ITEM:
	v = POP();
	if (stream == NULL || stream == Py_None) {
		w = PySys_GetObject("stdout");
		if (w == NULL) {
			PyErr_SetString(PyExc_RuntimeError,
					"lost sys.stdout");
			err = -1;
		}
	}
	if (w != NULL &amp;&amp; PyFile_SoftSpace(w, 1))
		err = PyFile_WriteString(" ", w);
	if (err == 0)
		err = PyFile_WriteObject(v, w, Py_PRINT_RAW);
	if (err == 0) {
		/* XXX move into writeobject() ? */
	    if (PyString_Check(v)) {
		char *s = PyString_AS_STRING(v);
		int len = PyString_GET_SIZE(v);
		if (len &gt; 0 &amp;&amp;
		    isspace(Py_CHARMASK(s[len-1])) &amp;&amp;
		    s[len-1] != ' ')
			PyFile_SoftSpace(w, 0);
	    } 
#ifdef Py_USING_UNICODE
	    else if (PyUnicode_Check(v)) {
		Py_UNICODE *s = PyUnicode_AS_UNICODE(v);
		int len = PyUnicode_GET_SIZE(v);
		if (len &gt; 0 &amp;&amp;
		    Py_UNICODE_ISSPACE(s[len-1]) &amp;&amp;
		    s[len-1] != ' ')
		    PyFile_SoftSpace(w, 0);
	    }
#endif
	}
	Py_DECREF(v);
	Py_XDECREF(stream);
	stream = NULL;
	if (err == 0)
		continue;
	break;

case PRINT_NEWLINE_TO:
	w = stream = POP();
	/* fall through to PRINT_NEWLINE */

case PRINT_NEWLINE:
	if (stream == NULL || stream == Py_None) {
		w = PySys_GetObject("stdout");
		if (w == NULL)
			PyErr_SetString(PyExc_RuntimeError,
					"lost sys.stdout");
	}
	if (w != NULL) {
		err = PyFile_WriteString("\n", w);
		if (err == 0)
			PyFile_SoftSpace(w, 0);
	}
	Py_XDECREF(stream);
	stream = NULL;
	break;</t>
<t tx="T30">case SET_LINENO:
#ifdef LLTRACE
	if (lltrace)
		printf("--- %s:%d \n", filename, oparg);
#endif
	f-&gt;f_lineno = oparg;
	if (tstate-&gt;c_tracefunc == NULL || tstate-&gt;tracing)
		continue;
	/* Trace each line of code reached */
	f-&gt;f_lasti = INSTR_OFFSET();
	/* Inline call_trace() for performance: */
	tstate-&gt;tracing++;
	tstate-&gt;use_tracing = 0;
	err = (tstate-&gt;c_tracefunc)(tstate-&gt;c_traceobj, f,
				    PyTrace_LINE, Py_None);
	tstate-&gt;use_tracing = (tstate-&gt;c_tracefunc
			       || tstate-&gt;c_profilefunc);
	tstate-&gt;tracing--;
	break;</t>
<t tx="T31">case POP_TOP:
	v = POP();
	Py_DECREF(v);
	continue;

case ROT_TWO:
	v = POP();
	w = POP();
	PUSH(v);
	PUSH(w);
	continue;

case ROT_THREE:
	v = POP();
	w = POP();
	x = POP();
	PUSH(v);
	PUSH(x);
	PUSH(w);
	continue;

case ROT_FOUR:
	u = POP();
	v = POP();
	w = POP();
	x = POP();
	PUSH(u);
	PUSH(x);
	PUSH(w);
	PUSH(v);
	continue;

case DUP_TOP:
	v = TOP();
	Py_INCREF(v);
	PUSH(v);
	continue;

case DUP_TOPX:
	switch (oparg) {
	case 1:
		x = TOP();
		Py_INCREF(x);
		PUSH(x);
		continue;
	case 2:
		x = POP();
		Py_INCREF(x);
		w = TOP();
		Py_INCREF(w);
		PUSH(x);
		PUSH(w);
		PUSH(x);
		continue;
	case 3:
		x = POP();
		Py_INCREF(x);
		w = POP();
		Py_INCREF(w);
		v = TOP();
		Py_INCREF(v);
		PUSH(w);
		PUSH(x);
		PUSH(v);
		PUSH(w);
		PUSH(x);
		continue;
	case 4:
		x = POP();
		Py_INCREF(x);
		w = POP();
		Py_INCREF(w);
		v = POP();
		Py_INCREF(v);
		u = TOP();
		Py_INCREF(u);
		PUSH(v);
		PUSH(w);
		PUSH(x);
		PUSH(u);
		PUSH(v);
		PUSH(w);
		PUSH(x);
		continue;
	case 5:
		x = POP();
		Py_INCREF(x);
		w = POP();
		Py_INCREF(w);
		v = POP();
		Py_INCREF(v);
		u = POP();
		Py_INCREF(u);
		t = TOP();
		Py_INCREF(t);
		PUSH(u);
		PUSH(v);
		PUSH(w);
		PUSH(x);
		PUSH(t);
		PUSH(u);
		PUSH(v);
		PUSH(w);
		PUSH(x);
		continue;
	default:
		Py_FatalError("invalid argument to DUP_TOPX"
			      " (bytecode corruption?)");
	}
	break;</t>
<t tx="T32">case STORE_DEREF:
	w = POP();
	x = freevars[oparg];
	PyCell_Set(x, w);
	Py_DECREF(w);
	continue;

case STORE_FAST:
	v = POP();
	SETLOCAL(oparg, v);
	continue;

case STORE_GLOBAL:
	w = GETNAMEV(oparg);
	v = POP();
	err = PyDict_SetItem(f-&gt;f_globals, w, v);
	Py_DECREF(v);
	break;

case STORE_NAME:
	w = GETNAMEV(oparg);
	v = POP();
	if ((x = f-&gt;f_locals) == NULL) {
		PyErr_Format(PyExc_SystemError,
			     "no locals found when storing %s",
			     PyObject_REPR(w));
		break;
	}
	err = PyDict_SetItem(x, w, v);
	Py_DECREF(v);
	break;</t>
<t tx="T33">case SLICE+0:
case SLICE+1:
case SLICE+2:
case SLICE+3:
	if ((opcode-SLICE) &amp; 2)
		w = POP();
	else
		w = NULL;
	if ((opcode-SLICE) &amp; 1)
		v = POP();
	else
		v = NULL;
	u = POP();
	x = apply_slice(u, v, w);
	Py_DECREF(u);
	Py_XDECREF(v);
	Py_XDECREF(w);
	PUSH(x);
	if (x != NULL) continue;
	break;

case STORE_SLICE+0:
case STORE_SLICE+1:
case STORE_SLICE+2:
case STORE_SLICE+3:
	if ((opcode-STORE_SLICE) &amp; 2)
		w = POP();
	else
		w = NULL;
	if ((opcode-STORE_SLICE) &amp; 1)
		v = POP();
	else
		v = NULL;
	u = POP();
	t = POP();
	err = assign_slice(u, v, w, t); /* u[v:w] = t */
	Py_DECREF(t);
	Py_DECREF(u);
	Py_XDECREF(v);
	Py_XDECREF(w);
	if (err == 0) continue;
	break;

case DELETE_SLICE+0:
case DELETE_SLICE+1:
case DELETE_SLICE+2:
case DELETE_SLICE+3:
	if ((opcode-DELETE_SLICE) &amp; 2)
		w = POP();
	else
		w = NULL;
	if ((opcode-DELETE_SLICE) &amp; 1)
		v = POP();
	else
		v = NULL;
	u = POP();
	err = assign_slice(u, v, w, (PyObject *)NULL);
					/* del u[v:w] */
	Py_DECREF(u);
	Py_XDECREF(v);
	Py_XDECREF(w);
	if (err == 0) continue;
	break;</t>
<t tx="T34">case STORE_SUBSCR:
	w = POP();
	v = POP();
	u = POP();
	/* v[w] = u */
	err = PyObject_SetItem(v, w, u);
	Py_DECREF(u);
	Py_DECREF(v);
	Py_DECREF(w);
	if (err == 0) continue;
	break;

case DELETE_SUBSCR:
	w = POP();
	v = POP();
	/* del v[w] */
	err = PyObject_DelItem(v, w);
	Py_DECREF(v);
	Py_DECREF(w);
	if (err == 0) continue;
	break;</t>
<t tx="T35">on_error:

/* Quickly continue if no error occurred */

if (why == WHY_NOT) {
	if (err == 0 &amp;&amp; x != NULL) {
#ifdef CHECKEXC
		/* This check is expensive! */
		if (PyErr_Occurred())
			fprintf(stderr,
				"XXX undetected error\n");
		else
#endif
			continue; /* Normal, fast path */
	}
	why = WHY_EXCEPTION;
	x = Py_None;
	err = 0;
}

/* Double-check exception status */

if (why == WHY_EXCEPTION || why == WHY_RERAISE) {
	if (!PyErr_Occurred()) {
		PyErr_SetString(PyExc_SystemError,
			"error return without exception set");
		why = WHY_EXCEPTION;
	}
}
#ifdef CHECKEXC
else {
	/* This check is expensive! */
	if (PyErr_Occurred()) {
		fprintf(stderr,
			"XXX undetected error (why=%d)\n",
			why);
		why = WHY_EXCEPTION;
	}
}
#endif

/* Log traceback info if this is a real exception */

if (why == WHY_EXCEPTION) {
	f-&gt;f_lasti = INSTR_OFFSET() - 1;
	if (HAS_ARG(opcode))
		f-&gt;f_lasti -= 2;
	PyTraceBack_Here(f);

	if (tstate-&gt;c_tracefunc != NULL)
		call_exc_trace(tstate-&gt;c_tracefunc,
			       tstate-&gt;c_traceobj, f);
}

/* For the rest, treat WHY_RERAISE as WHY_EXCEPTION */

if (why == WHY_RERAISE)
	why = WHY_EXCEPTION;

/* Unwind stacks if a (pseudo) exception occurred */

while (why != WHY_NOT &amp;&amp; why != WHY_YIELD &amp;&amp; f-&gt;f_iblock &gt; 0) {
	PyTryBlock *b = PyFrame_BlockPop(f);

	if (b-&gt;b_type == SETUP_LOOP &amp;&amp; why == WHY_CONTINUE) {
		/* For a continue inside a try block,
		   don't pop the block for the loop. */
		PyFrame_BlockSetup(f, b-&gt;b_type, b-&gt;b_handler,
				   b-&gt;b_level);
		why = WHY_NOT;
		JUMPTO(PyInt_AS_LONG(retval));
		Py_DECREF(retval);
		break;
	}

	while (STACK_LEVEL() &gt; b-&gt;b_level) {
		v = POP();
		Py_XDECREF(v);
	}
	if (b-&gt;b_type == SETUP_LOOP &amp;&amp; why == WHY_BREAK) {
		why = WHY_NOT;
		JUMPTO(b-&gt;b_handler);
		break;
	}
	if (b-&gt;b_type == SETUP_FINALLY ||
	    (b-&gt;b_type == SETUP_EXCEPT &amp;&amp;
	     why == WHY_EXCEPTION)) {
		if (why == WHY_EXCEPTION) {
			PyObject *exc, *val, *tb;
			PyErr_Fetch(&amp;exc, &amp;val, &amp;tb);
			if (val == NULL) {
				val = Py_None;
				Py_INCREF(val);
			}
			/* Make the raw exception data
			   available to the handler,
			   so a program can emulate the
			   Python main loop.  Don't do
			   this for 'finally'. */
			if (b-&gt;b_type == SETUP_EXCEPT) {
				PyErr_NormalizeException(
					&amp;exc, &amp;val, &amp;tb);
				set_exc_info(tstate,
					     exc, val, tb);
			}
			if (tb == NULL) {
				Py_INCREF(Py_None);
				PUSH(Py_None);
			} else
				PUSH(tb);
			PUSH(val);
			PUSH(exc);
		}
		else {
			if (why == WHY_RETURN ||
			    why == CONTINUE_LOOP)
				PUSH(retval);
			v = PyInt_FromLong((long)why);
			PUSH(v);
		}
		why = WHY_NOT;
		JUMPTO(b-&gt;b_handler);
		break;
	}
} /* unwind stack */

/* End the loop if we still have an error (or return) */

if (why != WHY_NOT)
	break;</t>
<t tx="T36">if (why != WHY_YIELD) {
	/* Pop remaining stack entries -- but when yielding */
	while (!EMPTY()) {
		v = POP();
		Py_XDECREF(v);
	}
}

if (why != WHY_RETURN &amp;&amp; why != WHY_YIELD)
	retval = NULL;

if (tstate-&gt;use_tracing) {
	if (tstate-&gt;c_tracefunc
	    &amp;&amp; (why == WHY_RETURN || why == WHY_YIELD)) {
		if (call_trace(tstate-&gt;c_tracefunc,
			       tstate-&gt;c_traceobj, f,
			       PyTrace_RETURN, retval)) {
			Py_XDECREF(retval);
			retval = NULL;
			why = WHY_EXCEPTION;
		}
	}
	if (tstate-&gt;c_profilefunc) {
		if (why == WHY_EXCEPTION)
			call_trace_protected(tstate-&gt;c_profilefunc,
					     tstate-&gt;c_profileobj, f,
					     PyTrace_RETURN);
		else if (call_trace(tstate-&gt;c_profilefunc,
				    tstate-&gt;c_profileobj, f,
				    PyTrace_RETURN, retval)) {
			Py_XDECREF(retval);
			retval = NULL;
			why = WHY_EXCEPTION;
		}
	}
}

reset_exc_info(tstate);

/* pop frame */
--tstate-&gt;recursion_depth;
tstate-&gt;frame = f-&gt;f_back;</t>
<t tx="T37">@ Mechanism whereby asynchronously executing callbacks (e.g. UNIX signal handlers or Mac I/O completion routines) can schedule calls to a function to be called synchronously.

The synchronous function is called with one void* argument. It should return 0 for success or -1 for failure -- failure should be accompanied by an exception. If registry succeeds, the registry function returns 0; if it fails (e.g. due to too many pending calls) it returns -1 (without setting an exception condition).

Note that because registry may occur from within signal handlers, or other asynchronous events, calling malloc() is unsafe! #ifdef WITH_THREAD Any thread can schedule pending calls, but only the main thread will execute them. #endif

XXX WARNING! ASYNCHRONOUSLY EXECUTING CODE! There are two possible race conditions:
(1) nested asynchronous registry calls;
(2) registry calls made while pending calls are being processed.

While (1) is very unlikely, (2) is a real possibility. The current code is safe against (2), but not against (1). The safety against (2) is derived from the fact that only one thread (the main thread) ever takes things out of the queue.

XXX Darn! With the advent of thread state, we should have an array of pending calls per thread in the thread state! Later...</t>
<t tx="T38">#define NPENDINGCALLS 32

static struct {
	int (*func)(void *);
	void *arg;
} pendingcalls[NPENDINGCALLS];

static volatile int pendingfirst = 0;
static volatile int pendinglast = 0;
static volatile int things_to_do = 0;

int
Py_AddPendingCall(int (*func)(void *), void *arg)
{
	static int busy = 0;
	int i, j;
	/* XXX Begin critical section */
	/* XXX If you want this to be safe against nested
	   XXX asynchronous calls, you'll have to work harder! */
	if (busy)
		return -1;
	busy = 1;
	i = pendinglast;
	j = (i + 1) % NPENDINGCALLS;
	if (j == pendingfirst)
		return -1; /* Queue full */
	pendingcalls[i].func = func;
	pendingcalls[i].arg = arg;
	pendinglast = j;
	things_to_do = 1; /* Signal main loop */
	busy = 0;
	/* XXX End critical section */
	return 0;
}</t>
<t tx="T39">int
Py_MakePendingCalls(void)
{
	static int busy = 0;
#ifdef WITH_THREAD
	if (main_thread &amp;&amp; PyThread_get_thread_ident() != main_thread)
		return 0;
#endif
	if (busy)
		return 0;
	busy = 1;
	things_to_do = 0;
	for (;;) {
		int i;
		int (*func)(void *);
		void *arg;
		i = pendingfirst;
		if (i == pendinglast)
			break; /* Queue empty */
		func = pendingcalls[i].func;
		arg = pendingcalls[i].arg;
		pendingfirst = (i + 1) % NPENDINGCALLS;
		if (func(arg) &lt; 0) {
			busy = 0;
			things_to_do = 1; /* We're not done yet */
			return -1;
		}
	}
	busy = 0;
	return 0;
}
</t>
<t tx="T40">#define PyEval_CallObject(func,arg) \
    PyEval_CallObjectWithKeywords(func, arg, (PyObject *)NULL)

PyObject *
PyEval_CallObjectWithKeywords(PyObject *func, PyObject *arg, PyObject *kw)
{
	PyObject *result;

	if (arg == NULL)
		arg = PyTuple_New(0);
	else if (!PyTuple_Check(arg)) {
		PyErr_SetString(PyExc_TypeError,
				"argument list must be a tuple");
		return NULL;
	}
	else
		Py_INCREF(arg);

	if (kw != NULL &amp;&amp; !PyDict_Check(kw)) {
		PyErr_SetString(PyExc_TypeError,
				"keyword list must be a dictionary");
		Py_DECREF(arg);
		return NULL;
	}

	result = PyObject_Call(func, arg, kw);
	Py_DECREF(arg);
	return result;
}
</t>
<t tx="T41">@ External interface to call any callable object. The arg must be a tuple or NULL. */
@c

#undef PyEval_CallObject
/* for backward compatibility: export this interface */

PyObject *
PyEval_CallObject(PyObject *func, PyObject *arg)
{
	return PyEval_CallObjectWithKeywords(func, arg, (PyObject *)NULL);
}
</t>
<t tx="T42">@ Status code for main loop (reason for stack unwind) */
@c

enum why_code {
		WHY_NOT,	/* No error */
		WHY_EXCEPTION,	/* Exception occurred */
		WHY_RERAISE,	/* Exception re-raised by 'finally' */
		WHY_RETURN,	/* 'return' statement */
		WHY_BREAK,	/* 'break' statement */
		WHY_CONTINUE,	/* 'continue' statement */
		WHY_YIELD	/* 'yield' operator */
};

static enum why_code do_raise(PyObject *, PyObject *, PyObject *);
static int unpack_iterable(PyObject *, int, PyObject **);


PyObject *
PyEval_EvalCode(PyCodeObject *co, PyObject *globals, PyObject *locals)
{
	return PyEval_EvalCodeEx(co,
			  globals, locals,
			  (PyObject **)NULL, 0,
			  (PyObject **)NULL, 0,
			  (PyObject **)NULL, 0,
			  NULL);
}
</t>
<t tx="T43">PyObject *
PyEval_EvalCodeEx(PyCodeObject *co, PyObject *globals, PyObject *locals,
	   PyObject **args, int argcount, PyObject **kws, int kwcount,
	   PyObject **defs, int defcount, PyObject *closure)
{
	register PyFrameObject *f;
	register PyObject *retval = NULL;
	register PyObject **fastlocals, **freevars;
	PyThreadState *tstate = PyThreadState_GET();
	PyObject *x, *u;

	if (globals == NULL) {
		PyErr_SetString(PyExc_SystemError, 
				"PyEval_EvalCodeEx: NULL globals");
		return NULL;
	}

	f = PyFrame_New(tstate,			/*back*/
			co,			/*code*/
			globals, locals);
	if (f == NULL)
		return NULL;

	fastlocals = f-&gt;f_localsplus;
	freevars = f-&gt;f_localsplus + f-&gt;f_nlocals;

	if (co-&gt;co_argcount &gt; 0 ||
	    co-&gt;co_flags &amp; (CO_VARARGS | CO_VARKEYWORDS)) {
		int i;
		int n = argcount;
		PyObject *kwdict = NULL;
		if (co-&gt;co_flags &amp; CO_VARKEYWORDS) {
			kwdict = PyDict_New();
			if (kwdict == NULL)
				goto fail;
			i = co-&gt;co_argcount;
			if (co-&gt;co_flags &amp; CO_VARARGS)
				i++;
			SETLOCAL(i, kwdict);
		}
		if (argcount &gt; co-&gt;co_argcount) {
			if (!(co-&gt;co_flags &amp; CO_VARARGS)) {
				PyErr_Format(PyExc_TypeError,
				    "%.200s() takes %s %d "
				    "%sargument%s (%d given)",
				    PyString_AsString(co-&gt;co_name),
				    defcount ? "at most" : "exactly",
				    co-&gt;co_argcount,
				    kwcount ? "non-keyword " : "",
				    co-&gt;co_argcount == 1 ? "" : "s",
				    argcount);
				goto fail;
			}
			n = co-&gt;co_argcount;
		}
		for (i = 0; i &lt; n; i++) {
			x = args[i];
			Py_INCREF(x);
			SETLOCAL(i, x);
		}
		if (co-&gt;co_flags &amp; CO_VARARGS) {
			u = PyTuple_New(argcount - n);
			if (u == NULL)
				goto fail;
			SETLOCAL(co-&gt;co_argcount, u);
			for (i = n; i &lt; argcount; i++) {
				x = args[i];
				Py_INCREF(x);
				PyTuple_SET_ITEM(u, i-n, x);
			}
		}
		for (i = 0; i &lt; kwcount; i++) {
			PyObject *keyword = kws[2*i];
			PyObject *value = kws[2*i + 1];
			int j;
			if (keyword == NULL || !PyString_Check(keyword)) {
				PyErr_Format(PyExc_TypeError,
				    "%.200s() keywords must be strings",
				    PyString_AsString(co-&gt;co_name));
				goto fail;
			}
			/* XXX slow -- speed up using dictionary? */
			for (j = 0; j &lt; co-&gt;co_argcount; j++) {
				PyObject *nm = PyTuple_GET_ITEM(
					co-&gt;co_varnames, j);
				int cmp = PyObject_RichCompareBool(
					keyword, nm, Py_EQ);
				if (cmp &gt; 0)
					break;
				else if (cmp &lt; 0)
					goto fail;
			}
			/* Check errors from Compare */
			if (PyErr_Occurred())
				goto fail;
			if (j &gt;= co-&gt;co_argcount) {
				if (kwdict == NULL) {
					PyErr_Format(PyExc_TypeError,
					    "%.200s() got an unexpected "
					    "keyword argument '%.400s'",
					    PyString_AsString(co-&gt;co_name),
					    PyString_AsString(keyword));
					goto fail;
				}
				PyDict_SetItem(kwdict, keyword, value);
			}
			else {
				if (GETLOCAL(j) != NULL) {
					PyErr_Format(PyExc_TypeError,
					     "%.200s() got multiple "
					     "values for keyword "
					     "argument '%.400s'",
					     PyString_AsString(co-&gt;co_name),
					     PyString_AsString(keyword));
					goto fail;
				}
				Py_INCREF(value);
				SETLOCAL(j, value);
			}
		}
		if (argcount &lt; co-&gt;co_argcount) {
			int m = co-&gt;co_argcount - defcount;
			for (i = argcount; i &lt; m; i++) {
				if (GETLOCAL(i) == NULL) {
					PyErr_Format(PyExc_TypeError,
					    "%.200s() takes %s %d "
					    "%sargument%s (%d given)",
					    PyString_AsString(co-&gt;co_name),
					    ((co-&gt;co_flags &amp; CO_VARARGS) ||
					     defcount) ? "at least"
						       : "exactly",
					    m, kwcount ? "non-keyword " : "",
					    m == 1 ? "" : "s", i);
					goto fail;
				}
			}
			if (n &gt; m)
				i = n - m;
			else
				i = 0;
			for (; i &lt; defcount; i++) {
				if (GETLOCAL(m+i) == NULL) {
					PyObject *def = defs[i];
					Py_INCREF(def);
					SETLOCAL(m+i, def);
				}
			}
		}
	}
	else {
		if (argcount &gt; 0 || kwcount &gt; 0) {
			PyErr_Format(PyExc_TypeError,
				     "%.200s() takes no arguments (%d given)",
				     PyString_AsString(co-&gt;co_name),
				     argcount + kwcount);
			goto fail;
		}
	}
	/* Allocate and initialize storage for cell vars, and copy free
	   vars into frame.  This isn't too efficient right now. */
	if (f-&gt;f_ncells) {
		int i = 0, j = 0, nargs, found;
		char *cellname, *argname;
		PyObject *c;

		nargs = co-&gt;co_argcount;
		if (co-&gt;co_flags &amp; CO_VARARGS)
			nargs++;
		if (co-&gt;co_flags &amp; CO_VARKEYWORDS)
			nargs++;

		/* Check for cells that shadow args */
		for (i = 0; i &lt; f-&gt;f_ncells &amp;&amp; j &lt; nargs; ++i) {
			cellname = PyString_AS_STRING(
				PyTuple_GET_ITEM(co-&gt;co_cellvars, i));
			found = 0;
			while (j &lt; nargs) {
				argname = PyString_AS_STRING(
					PyTuple_GET_ITEM(co-&gt;co_varnames, j));
				if (strcmp(cellname, argname) == 0) {
					c = PyCell_New(GETLOCAL(j));
					if (c == NULL)
						goto fail;
					GETLOCAL(f-&gt;f_nlocals + i) = c;
					found = 1;
					break;
				}
				j++;
			}
			if (found == 0) {
				c = PyCell_New(NULL);
				if (c == NULL)
					goto fail;
				SETLOCAL(f-&gt;f_nlocals + i, c);
			}
		}
		/* Initialize any that are left */
		while (i &lt; f-&gt;f_ncells) {
			c = PyCell_New(NULL);
			if (c == NULL)
				goto fail;
			SETLOCAL(f-&gt;f_nlocals + i, c);
			i++;
		}
	}
	if (f-&gt;f_nfreevars) {
		int i;
		for (i = 0; i &lt; f-&gt;f_nfreevars; ++i) {
			PyObject *o = PyTuple_GET_ITEM(closure, i);
			Py_INCREF(o);
			freevars[f-&gt;f_ncells + i] = o;
		}
	}

	if (co-&gt;co_flags &amp; CO_GENERATOR) {
		/* Don't need to keep the reference to f_back, it will be set
		 * when the generator is resumed. */
		Py_XDECREF(f-&gt;f_back);
		f-&gt;f_back = NULL;

		/* Create a new generator that owns the ready to run frame
		 * and return that as the value. */
		return gen_new(f);
	}

        retval = eval_frame(f);

  fail: /* Jump here from prelude on failure */

	/* decref'ing the frame can cause __del__ methods to get invoked,
	   which can call back into Python.  While we're done with the
	   current Python frame (f), the associated C stack is still in use,
	   so recursion_depth must be boosted for the duration.
	*/
	assert(tstate != NULL);
	++tstate-&gt;recursion_depth;
        Py_DECREF(f);
	--tstate-&gt;recursion_depth;
	return retval;
}
</t>
<t tx="T44">@ The interpreter's recursion limit */
@c

static int recursion_limit = 1000;

int
Py_GetRecursionLimit(void)
{
	return recursion_limit;
}
</t>
<t tx="T45">void
Py_SetRecursionLimit(int new_limit)
{
	recursion_limit = new_limit;
}
</t>
<t tx="T46">PyObject *
PyEval_GetBuiltins(void)
{
	PyThreadState *tstate = PyThreadState_Get();
	PyFrameObject *current_frame = tstate-&gt;frame;
	if (current_frame == NULL)
		return tstate-&gt;interp-&gt;builtins;
	else
		return current_frame-&gt;f_builtins;
}
</t>
<t tx="T47">PyObject *
PyEval_GetFrame(void)
{
	PyFrameObject *current_frame = PyThreadState_Get()-&gt;frame;
	return (PyObject *)current_frame;
}
</t>
<t tx="T48">char *
PyEval_GetFuncDesc(PyObject *func)
{
	if (PyMethod_Check(func))
		return "()";
	else if (PyFunction_Check(func))
		return "()";
	else if (PyCFunction_Check(func))
		return "()";
	else if (PyClass_Check(func))
		return " constructor";
	else if (PyInstance_Check(func)) {
		return " instance";
	} else {
		return " object";
	}
}
</t>
<t tx="T49">char *
PyEval_GetFuncName(PyObject *func)
{
	if (PyMethod_Check(func))
		return PyEval_GetFuncName(PyMethod_GET_FUNCTION(func));
	else if (PyFunction_Check(func))
		return PyString_AsString(((PyFunctionObject*)func)-&gt;func_name);
	else if (PyCFunction_Check(func))
		return ((PyCFunctionObject*)func)-&gt;m_ml-&gt;ml_name;
	else if (PyClass_Check(func))
		return PyString_AsString(((PyClassObject*)func)-&gt;cl_name);
	else if (PyInstance_Check(func)) {
		return PyString_AsString(
			((PyInstanceObject*)func)-&gt;in_class-&gt;cl_name);
	} else {
		return func-&gt;ob_type-&gt;tp_name;
	}
}
</t>
<t tx="T50">PyObject *
PyEval_GetGlobals(void)
{
	PyFrameObject *current_frame = PyThreadState_Get()-&gt;frame;
	if (current_frame == NULL)
		return NULL;
	else
		return current_frame-&gt;f_globals;
}
</t>
<t tx="T51">PyObject *
PyEval_GetLocals(void)
{
	PyFrameObject *current_frame = PyThreadState_Get()-&gt;frame;
	if (current_frame == NULL)
		return NULL;
	PyFrame_FastToLocals(current_frame);
	return current_frame-&gt;f_locals;
}
</t>
<t tx="T52">int
PyEval_GetRestricted(void)
{
	PyFrameObject *current_frame = PyThreadState_Get()-&gt;frame;
	return current_frame == NULL ? 0 : current_frame-&gt;f_restricted;
}
</t>
<t tx="T53">void
PyEval_SetProfile(Py_tracefunc func, PyObject *arg)
{
	PyThreadState *tstate = PyThreadState_Get();
	PyObject *temp = tstate-&gt;c_profileobj;
	Py_XINCREF(arg);
	tstate-&gt;c_profilefunc = NULL;
	tstate-&gt;c_profileobj = NULL;
	tstate-&gt;use_tracing = tstate-&gt;c_tracefunc != NULL;
	Py_XDECREF(temp);
	tstate-&gt;c_profilefunc = func;
	tstate-&gt;c_profileobj = arg;
	tstate-&gt;use_tracing = (func != NULL) || (tstate-&gt;c_tracefunc != NULL);
}
</t>
<t tx="T54">void
PyEval_SetTrace(Py_tracefunc func, PyObject *arg)
{
	PyThreadState *tstate = PyThreadState_Get();
	PyObject *temp = tstate-&gt;c_traceobj;
	Py_XINCREF(arg);
	tstate-&gt;c_tracefunc = NULL;
	tstate-&gt;c_traceobj = NULL;
	tstate-&gt;use_tracing = tstate-&gt;c_profilefunc != NULL;
	Py_XDECREF(temp);
	tstate-&gt;c_tracefunc = func;
	tstate-&gt;c_traceobj = arg;
	tstate-&gt;use_tracing = ((func != NULL)
			       || (tstate-&gt;c_profilefunc != NULL));
}
</t>
<t tx="T55">int
PyEval_MergeCompilerFlags(PyCompilerFlags *cf)
{
	PyFrameObject *current_frame = PyThreadState_Get()-&gt;frame;
	int result = 0;

	if (current_frame != NULL) {
		const int codeflags = current_frame-&gt;f_code-&gt;co_flags;
		const int compilerflags = codeflags &amp; PyCF_MASK;
		if (compilerflags) {
			result = 1;
			cf-&gt;cf_flags |= compilerflags;
		}
	}
	return result;
}
</t>
<t tx="T56">static struct PyMethodDef gen_methods[] = {
	{"next",     (PyCFunction)gen_next, METH_NOARGS,
	 	"next() -- get the next value, or raise StopIteration"},
	{NULL,          NULL}   /* Sentinel */
};

static PyMemberDef gen_memberlist[] = {
	{"gi_frame",	T_OBJECT, offsetof(genobject, gi_frame),	RO},
	{"gi_running",	T_INT,    offsetof(genobject, gi_running),	RO},
	{NULL}	/* Sentinel */
};

statichere PyTypeObject gentype = {
	PyObject_HEAD_INIT(&amp;PyType_Type)
	0,					/* ob_size */
	"generator",				/* tp_name */
	sizeof(genobject) + PyGC_HEAD_SIZE,	/* tp_basicsize */
	0,					/* tp_itemsize */
	/* methods */
	(destructor)gen_dealloc, 		/* tp_dealloc */
	0,					/* tp_print */
	0, 					/* tp_getattr */
	0,					/* tp_setattr */
	0,					/* tp_compare */
	0,					/* tp_repr */
	0,					/* tp_as_number */
	0,					/* tp_as_sequence */
	0,					/* tp_as_mapping */
	0,					/* tp_hash */
	0,					/* tp_call */
	0,					/* tp_str */
	PyObject_GenericGetAttr,		/* tp_getattro */
	0,					/* tp_setattro */
	0,					/* tp_as_buffer */
	Py_TPFLAGS_DEFAULT | Py_TPFLAGS_GC,	/* tp_flags */
 	0,					/* tp_doc */
 	(traverseproc)gen_traverse,		/* tp_traverse */
 	0,					/* tp_clear */
	0,					/* tp_richcompare */
	0,					/* tp_weaklistoffset */
	(getiterfunc)gen_getiter,		/* tp_iter */
	(iternextfunc)gen_iternext,		/* tp_iternext */
	gen_methods,				/* tp_methods */
	gen_memberlist,				/* tp_members */
	0,					/* tp_getset */
	0,					/* tp_base */
	0,					/* tp_dict */
};


#ifdef WITH_THREAD

#ifndef DONT_HAVE_ERRNO_H
#include &lt;errno.h&gt;
#endif
#include "pythread.h"

extern int _PyThread_Started; /* Flag for Py_Exit */

static PyThread_type_lock interpreter_lock = 0;
static long main_thread = 0;

void
PyEval_InitThreads(void)
{
	if (interpreter_lock)
		return;
	_PyThread_Started = 1;
	interpreter_lock = PyThread_allocate_lock();
	PyThread_acquire_lock(interpreter_lock, 1);
	main_thread = PyThread_get_thread_ident();
}
</t>
<t tx="T57">void
PyEval_AcquireLock(void)
{
	PyThread_acquire_lock(interpreter_lock, 1);
}
</t>
<t tx="T58">void
PyEval_ReleaseLock(void)
{
	PyThread_release_lock(interpreter_lock);
}
</t>
<t tx="T59">void
PyEval_AcquireThread(PyThreadState *tstate)
{
	if (tstate == NULL)
		Py_FatalError("PyEval_AcquireThread: NULL new thread state");
	PyThread_acquire_lock(interpreter_lock, 1);
	if (PyThreadState_Swap(tstate) != NULL)
		Py_FatalError(
			"PyEval_AcquireThread: non-NULL old thread state");
}
</t>
<t tx="T60">void
PyEval_ReleaseThread(PyThreadState *tstate)
{
	if (tstate == NULL)
		Py_FatalError("PyEval_ReleaseThread: NULL thread state");
	if (PyThreadState_Swap(NULL) != tstate)
		Py_FatalError("PyEval_ReleaseThread: wrong thread state");
	PyThread_release_lock(interpreter_lock);
}
</t>
<t tx="T61">@ This function is called from PyOS_AfterFork to ensure that newly created child processes don't hold locks referring to threads which are not running in the child process. (This could also be done using pthread_atfork mechanism, at least for the pthreads implementation.) */
@c

void
PyEval_ReInitThreads(void)
{
	if (!interpreter_lock)
		return;
	/*XXX Can't use PyThread_free_lock here because it does too
	  much error-checking.  Doing this cleanly would require
	  adding a new function to each thread_*.h.  Instead, just
	  create a new lock and waste a little bit of memory */
	interpreter_lock = PyThread_allocate_lock();
	PyThread_acquire_lock(interpreter_lock, 1);
	main_thread = PyThread_get_thread_ident();
}
</t>
<t tx="T62">#endif

/* Functions save_thread and restore_thread are always defined so
   dynamically loaded modules needn't be compiled separately for use
   with and without threads: */

PyThreadState *
PyEval_SaveThread(void)
{
	PyThreadState *tstate = PyThreadState_Swap(NULL);
	if (tstate == NULL)
		Py_FatalError("PyEval_SaveThread: NULL tstate");
#ifdef WITH_THREAD
	if (interpreter_lock)
		PyThread_release_lock(interpreter_lock);
#endif
	return tstate;
}
</t>
<t tx="T63">void
PyEval_RestoreThread(PyThreadState *tstate)
{
	if (tstate == NULL)
		Py_FatalError("PyEval_RestoreThread: NULL tstate");
#ifdef WITH_THREAD
	if (interpreter_lock) {
		int err = errno;
		PyThread_acquire_lock(interpreter_lock, 1);
		errno = err;
	}
#endif
	PyThreadState_Swap(tstate);
}
</t>
<t tx="T64">PyObject *
_Py_GetDXProfile(PyObject *self, PyObject *args)
{
	#ifndef DXPAIRS
		return getarray(dxp);
	#else
		int i;
		PyObject *l = PyList_New(257);
		if (l == NULL) return NULL;
		for (i = 0; i &lt; 257; i++) {
			PyObject *x = getarray(dxpairs[i]);
			if (x == NULL) {
				Py_DECREF(l);
				return NULL;
			}
			PyList_SetItem(l, i, x);
		}
		return l;
	#endif
}</t>
<t tx="T65">static PyObject *
build_class(PyObject *methods, PyObject *bases, PyObject *name)
{
	PyObject *metaclass = NULL, *result, *base;

	if (PyDict_Check(methods))
		metaclass = PyDict_GetItemString(methods, "__metaclass__");
	if (metaclass != NULL)
		Py_INCREF(metaclass);
	else if (PyTuple_Check(bases) &amp;&amp; PyTuple_GET_SIZE(bases) &gt; 0) {
		base = PyTuple_GET_ITEM(bases, 0);
		metaclass = PyObject_GetAttrString(base, "__class__");
		if (metaclass == NULL) {
			PyErr_Clear();
			metaclass = (PyObject *)base-&gt;ob_type;
			Py_INCREF(metaclass);
		}
	}
	else {
		PyObject *g = PyEval_GetGlobals();
		if (g != NULL &amp;&amp; PyDict_Check(g))
			metaclass = PyDict_GetItemString(g, "__metaclass__");
		if (metaclass == NULL)
			metaclass = (PyObject *) &amp;PyClass_Type;
		Py_INCREF(metaclass);
	}
	result = PyObject_CallFunction(metaclass, "OOO", name, bases, methods);
	Py_DECREF(metaclass);
	return result;
}
</t>
<t tx="T66">static PyObject *
cmp_outcome(int op, register PyObject *v, register PyObject *w)
{
	int res = 0;
	switch (op) {
	case IS:
	case IS_NOT:
		res = (v == w);
		if (op == (int) IS_NOT)
			res = !res;
		break;
	case IN:
	case NOT_IN:
		res = PySequence_Contains(w, v);
		if (res &lt; 0)
			return NULL;
		if (op == (int) NOT_IN)
			res = !res;
		break;
	case EXC_MATCH:
		res = PyErr_GivenExceptionMatches(v, w);
		break;
	default:
		return PyObject_RichCompare(v, w, op);
	}
	v = res ? Py_True : Py_False;
	Py_INCREF(v);
	return v;
}
</t>
<t tx="T67">@ Logic for the raise statement (too complicated for inlining). This *consumes* a reference count to each of its arguments. */
@c

static enum why_code
do_raise(PyObject *type, PyObject *value, PyObject *tb)
{
	if (type == NULL) {
		/* Reraise */
		PyThreadState *tstate = PyThreadState_Get();
		type = tstate-&gt;exc_type == NULL ? Py_None : tstate-&gt;exc_type;
		value = tstate-&gt;exc_value;
		tb = tstate-&gt;exc_traceback;
		Py_XINCREF(type);
		Py_XINCREF(value);
		Py_XINCREF(tb);
	}

	/* We support the following forms of raise:
	   raise &lt;class&gt;, &lt;classinstance&gt;
	   raise &lt;class&gt;, &lt;argument tuple&gt;
	   raise &lt;class&gt;, None
	   raise &lt;class&gt;, &lt;argument&gt;
	   raise &lt;classinstance&gt;, None
	   raise &lt;string&gt;, &lt;object&gt;
	   raise &lt;string&gt;, None

	   An omitted second argument is the same as None.

	   In addition, raise &lt;tuple&gt;, &lt;anything&gt; is the same as
	   raising the tuple's first item (and it better have one!);
	   this rule is applied recursively.

	   Finally, an optional third argument can be supplied, which
	   gives the traceback to be substituted (useful when
	   re-raising an exception after examining it).  */

	/* First, check the traceback argument, replacing None with
	   NULL. */
	if (tb == Py_None) {
		Py_DECREF(tb);
		tb = NULL;
	}
	else if (tb != NULL &amp;&amp; !PyTraceBack_Check(tb)) {
		PyErr_SetString(PyExc_TypeError,
			   "raise: arg 3 must be a traceback or None");
		goto raise_error;
	}

	/* Next, replace a missing value with None */
	if (value == NULL) {
		value = Py_None;
		Py_INCREF(value);
	}

	/* Next, repeatedly, replace a tuple exception with its first item */
	while (PyTuple_Check(type) &amp;&amp; PyTuple_Size(type) &gt; 0) {
		PyObject *tmp = type;
		type = PyTuple_GET_ITEM(type, 0);
		Py_INCREF(type);
		Py_DECREF(tmp);
	}

	if (PyString_Check(type))
		;

	else if (PyClass_Check(type))
		PyErr_NormalizeException(&amp;type, &amp;value, &amp;tb);

	else if (PyInstance_Check(type)) {
		/* Raising an instance.  The value should be a dummy. */
		if (value != Py_None) {
			PyErr_SetString(PyExc_TypeError,
			  "instance exception may not have a separate value");
			goto raise_error;
		}
		else {
			/* Normalize to raise &lt;class&gt;, &lt;instance&gt; */
			Py_DECREF(value);
			value = type;
			type = (PyObject*) ((PyInstanceObject*)type)-&gt;in_class;
			Py_INCREF(type);
		}
	}
	else {
		/* Not something you can raise.  You get an exception
		   anyway, just not what you specified :-) */
		PyErr_Format(PyExc_TypeError,
			     "exceptions must be strings, classes, or "
			     "instances, not %s", type-&gt;ob_type-&gt;tp_name);
		goto raise_error;
	}
	PyErr_Restore(type, value, tb);
	if (tb == NULL)
		return WHY_EXCEPTION;
	else
		return WHY_RERAISE;
 raise_error:
	Py_XDECREF(value);
	Py_XDECREF(type);
	Py_XDECREF(tb);
	return WHY_EXCEPTION;
}
</t>
<t tx="T68">static void
format_exc_check_arg(PyObject *exc, char *format_str, PyObject *obj)
{
	char *obj_str;

	if (!obj)
		return;

	obj_str = PyString_AsString(obj);
	if (!obj_str)
		return;

	PyErr_Format(exc, format_str, obj_str);
}
</t>
<t tx="T69">static void
reset_exc_info(PyThreadState *tstate)
{
	PyFrameObject *frame;
	PyObject *tmp_type, *tmp_value, *tmp_tb;
	frame = tstate-&gt;frame;
	if (frame-&gt;f_exc_type != NULL) {
		/* This frame caught an exception */
		tmp_type = tstate-&gt;exc_type;
		tmp_value = tstate-&gt;exc_value;
		tmp_tb = tstate-&gt;exc_traceback;
		Py_XINCREF(frame-&gt;f_exc_type);
		Py_XINCREF(frame-&gt;f_exc_value);
		Py_XINCREF(frame-&gt;f_exc_traceback);
		tstate-&gt;exc_type = frame-&gt;f_exc_type;
		tstate-&gt;exc_value = frame-&gt;f_exc_value;
		tstate-&gt;exc_traceback = frame-&gt;f_exc_traceback;
		Py_XDECREF(tmp_type);
		Py_XDECREF(tmp_value);
		Py_XDECREF(tmp_tb);
		/* For b/w compatibility */
		PySys_SetObject("exc_type", frame-&gt;f_exc_type);
		PySys_SetObject("exc_value", frame-&gt;f_exc_value);
		PySys_SetObject("exc_traceback", frame-&gt;f_exc_traceback);
	}
	tmp_type = frame-&gt;f_exc_type;
	tmp_value = frame-&gt;f_exc_value;
	tmp_tb = frame-&gt;f_exc_traceback;
	frame-&gt;f_exc_type = NULL;
	frame-&gt;f_exc_value = NULL;
	frame-&gt;f_exc_traceback = NULL;
	Py_XDECREF(tmp_type);
	Py_XDECREF(tmp_value);
	Py_XDECREF(tmp_tb);
}
</t>
<t tx="T70">static void
set_exc_info(PyThreadState *tstate,
	     PyObject *type, PyObject *value, PyObject *tb)
{
	PyFrameObject *frame;
	PyObject *tmp_type, *tmp_value, *tmp_tb;

	frame = tstate-&gt;frame;
	if (frame-&gt;f_exc_type == NULL) {
		/* This frame didn't catch an exception before */
		/* Save previous exception of this thread in this frame */
		if (tstate-&gt;exc_type == NULL) {
			Py_INCREF(Py_None);
			tstate-&gt;exc_type = Py_None;
		}
		tmp_type = frame-&gt;f_exc_type;
		tmp_value = frame-&gt;f_exc_value;
		tmp_tb = frame-&gt;f_exc_traceback;
		Py_XINCREF(tstate-&gt;exc_type);
		Py_XINCREF(tstate-&gt;exc_value);
		Py_XINCREF(tstate-&gt;exc_traceback);
		frame-&gt;f_exc_type = tstate-&gt;exc_type;
		frame-&gt;f_exc_value = tstate-&gt;exc_value;
		frame-&gt;f_exc_traceback = tstate-&gt;exc_traceback;
		Py_XDECREF(tmp_type);
		Py_XDECREF(tmp_value);
		Py_XDECREF(tmp_tb);
	}
	/* Set new exception for this thread */
	tmp_type = tstate-&gt;exc_type;
	tmp_value = tstate-&gt;exc_value;
	tmp_tb = tstate-&gt;exc_traceback;
	Py_XINCREF(type);
	Py_XINCREF(value);
	Py_XINCREF(tb);
	tstate-&gt;exc_type = type;
	tstate-&gt;exc_value = value;
	tstate-&gt;exc_traceback = tb;
	Py_XDECREF(tmp_type);
	Py_XDECREF(tmp_value);
	Py_XDECREF(tmp_tb);
	/* For b/w compatibility */
	PySys_SetObject("exc_type", type);
	PySys_SetObject("exc_value", value);
	PySys_SetObject("exc_traceback", tb);
}
</t>
<t tx="T71">static int
exec_statement(PyFrameObject *f, PyObject *prog, PyObject *globals,
	       PyObject *locals)
{
	int n;
	PyObject *v;
	int plain = 0;

	if (PyTuple_Check(prog) &amp;&amp; globals == Py_None &amp;&amp; locals == Py_None &amp;&amp;
	    ((n = PyTuple_Size(prog)) == 2 || n == 3)) {
		/* Backward compatibility hack */
		globals = PyTuple_GetItem(prog, 1);
		if (n == 3)
			locals = PyTuple_GetItem(prog, 2);
		prog = PyTuple_GetItem(prog, 0);
	}
	if (globals == Py_None) {
		globals = PyEval_GetGlobals();
		if (locals == Py_None) {
			locals = PyEval_GetLocals();
			plain = 1;
		}
	}
	else if (locals == Py_None)
		locals = globals;
	if (!PyString_Check(prog) &amp;&amp;
	    !PyUnicode_Check(prog) &amp;&amp;
	    !PyCode_Check(prog) &amp;&amp;
	    !PyFile_Check(prog)) {
		PyErr_SetString(PyExc_TypeError,
			"exec: arg 1 must be a string, file, or code object");
		return -1;
	}
	if (!PyDict_Check(globals)) {
		PyErr_SetString(PyExc_TypeError,
		    "exec: arg 2 must be a dictionary or None");
		return -1;
	}
	if (!PyDict_Check(locals)) {
		PyErr_SetString(PyExc_TypeError,
		    "exec: arg 3 must be a dictionary or None");
		return -1;
	}
	if (PyDict_GetItemString(globals, "__builtins__") == NULL)
		PyDict_SetItemString(globals, "__builtins__", f-&gt;f_builtins);
	if (PyCode_Check(prog)) {
		if (PyCode_GetNumFree((PyCodeObject *)prog) &gt; 0) {
			PyErr_SetString(PyExc_TypeError,
		"code object passed to exec may not contain free variables");
			return -1;
		}
		v = PyEval_EvalCode((PyCodeObject *) prog, globals, locals);
	}
	else if (PyFile_Check(prog)) {
		FILE *fp = PyFile_AsFile(prog);
		char *name = PyString_AsString(PyFile_Name(prog));
		PyCompilerFlags cf;
		cf.cf_flags = 0;
		if (PyEval_MergeCompilerFlags(&amp;cf))
			v = PyRun_FileFlags(fp, name, Py_file_input, globals,
					    locals, &amp;cf); 
		else
			v = PyRun_File(fp, name, Py_file_input, globals,
				       locals); 
	}
	else {
		char *str;
		PyCompilerFlags cf;
		if (PyString_AsStringAndSize(prog, &amp;str, NULL))
			return -1;
		cf.cf_flags = 0;
		if (PyEval_MergeCompilerFlags(&amp;cf))
			v = PyRun_StringFlags(str, Py_file_input, globals, 
					      locals, &amp;cf);
		else
			v = PyRun_String(str, Py_file_input, globals, locals);
	}
	if (plain)
		PyFrame_LocalsToFast(f, 0);
	if (v == NULL)
		return -1;
	Py_DECREF(v);
	return 0;
}
</t>
<t tx="T72">@ The two fast_xxx() functions optimize calls for which no argument tuple is necessary; the objects are passed directly from the stack.

fast_cfunction() is called for METH_OLDARGS functions.
fast_function()  is for functions with no special argument handling.
@c

#define EXT_POP(STACK_POINTER) (*--(STACK_POINTER))

static PyObject *
fast_cfunction(PyObject *func, PyObject ***pp_stack, int na)
{
	PyCFunction meth = PyCFunction_GET_FUNCTION(func);
	PyObject *self = PyCFunction_GET_SELF(func);
	int flags = PyCFunction_GET_FLAGS(func);

	switch (flags) {
	case METH_OLDARGS:
		if (na == 0)
			return (*meth)(self, NULL);
		else if (na == 1) {
			PyObject *arg = EXT_POP(*pp_stack);
			PyObject *result =  (*meth)(self, arg);
			Py_DECREF(arg);
			return result;
		} else {
			PyObject *args = load_args(pp_stack, na);
			PyObject *result = (*meth)(self, args);
			Py_DECREF(args);
			return result;
		}
	case METH_NOARGS:
		if (na == 0)
			return (*meth)(self, NULL);
		PyErr_Format(PyExc_TypeError,
			     "%.200s() takes no arguments (%d given)",
			     ((PyCFunctionObject*)func)-&gt;m_ml-&gt;ml_name, na);
		return NULL;
	case METH_O:
		if (na == 1) {
			PyObject *arg = EXT_POP(*pp_stack);
			PyObject *result = (*meth)(self, arg);
			Py_DECREF(arg);
			return result;
		}
		PyErr_Format(PyExc_TypeError,
			     "%.200s() takes exactly one argument (%d given)",
			     ((PyCFunctionObject*)func)-&gt;m_ml-&gt;ml_name, na);
		return NULL;
	default:
		fprintf(stderr, "%.200s() flags = %d\n", 
			((PyCFunctionObject*)func)-&gt;m_ml-&gt;ml_name, flags);
		PyErr_BadInternalCall();
		return NULL;
	}		
}
</t>
<t tx="T73">static PyObject *
fast_function(PyObject *func, PyObject ***pp_stack, int n, int na, int nk)
{
	PyObject *co = PyFunction_GET_CODE(func);
	PyObject *globals = PyFunction_GET_GLOBALS(func);
	PyObject *argdefs = PyFunction_GET_DEFAULTS(func);
	PyObject *closure = PyFunction_GET_CLOSURE(func);
	PyObject **d = NULL;
	int nd = 0;

	if (argdefs != NULL) {
		d = &amp;PyTuple_GET_ITEM(argdefs, 0);
		nd = ((PyTupleObject *)argdefs)-&gt;ob_size;
	}
	return PyEval_EvalCodeEx((PyCodeObject *)co, globals,
			  (PyObject *)NULL, (*pp_stack)-n, na,
			  (*pp_stack)-2*nk, nk, d, nd,
			  closure);
}
</t>
<t tx="T74">static PyObject *
update_keyword_args(PyObject *orig_kwdict, int nk, PyObject ***pp_stack,
                    PyObject *func)
{
	PyObject *kwdict = NULL;
	if (orig_kwdict == NULL)
		kwdict = PyDict_New();
	else {
		kwdict = PyDict_Copy(orig_kwdict);
		Py_DECREF(orig_kwdict);
	}
	if (kwdict == NULL)
		return NULL;
	while (--nk &gt;= 0) {
		int err;
		PyObject *value = EXT_POP(*pp_stack);
		PyObject *key = EXT_POP(*pp_stack);
		if (PyDict_GetItem(kwdict, key) != NULL) {
                        PyErr_Format(PyExc_TypeError,
                                     "%.200s%s got multiple values "
                                     "for keyword argument '%.200s'",
				     PyEval_GetFuncName(func),
				     PyEval_GetFuncDesc(func),
				     PyString_AsString(key));
			Py_DECREF(key);
			Py_DECREF(value);
			Py_DECREF(kwdict);
			return NULL;
		}
		err = PyDict_SetItem(kwdict, key, value);
		Py_DECREF(key);
		Py_DECREF(value);
		if (err) {
			Py_DECREF(kwdict);
			return NULL;
		}
	}
	return kwdict;
}
</t>
<t tx="T75">static PyObject *
update_star_args(int nstack, int nstar, PyObject *stararg,
		 PyObject ***pp_stack)
{
	PyObject *callargs, *w;

	callargs = PyTuple_New(nstack + nstar);
	if (callargs == NULL) {
		return NULL;
	}
	if (nstar) {
		int i;
		for (i = 0; i &lt; nstar; i++) {
			PyObject *a = PyTuple_GET_ITEM(stararg, i);
			Py_INCREF(a);
			PyTuple_SET_ITEM(callargs, nstack + i, a);
		}
	}
	while (--nstack &gt;= 0) {
		w = EXT_POP(*pp_stack);
		PyTuple_SET_ITEM(callargs, nstack, w);
	}
	return callargs;
}
</t>
<t tx="T76">static PyObject *
load_args(PyObject ***pp_stack, int na)
{
	PyObject *args = PyTuple_New(na);
	PyObject *w;

	if (args == NULL)
		return NULL;
	while (--na &gt;= 0) {
		w = EXT_POP(*pp_stack);
		PyTuple_SET_ITEM(args, na, w);
	}
	return args;
}
</t>
<t tx="T77">static PyObject *
do_call(PyObject *func, PyObject ***pp_stack, int na, int nk)
{
	PyObject *callargs = NULL;
	PyObject *kwdict = NULL;
	PyObject *result = NULL;

	if (nk &gt; 0) {
		kwdict = update_keyword_args(NULL, nk, pp_stack, func);
		if (kwdict == NULL)
			goto call_fail;
	}
	callargs = load_args(pp_stack, na);
	if (callargs == NULL)
		goto call_fail;
	result = PyObject_Call(func, callargs, kwdict);
 call_fail:
	Py_XDECREF(callargs);
	Py_XDECREF(kwdict);
	return result;
}
</t>
<t tx="T78">static PyObject *
ext_do_call(PyObject *func, PyObject ***pp_stack, int flags, int na, int nk)
{
	int nstar = 0;
	PyObject *callargs = NULL;
	PyObject *stararg = NULL;
	PyObject *kwdict = NULL;
	PyObject *result = NULL;

	if (flags &amp; CALL_FLAG_KW) {
		kwdict = EXT_POP(*pp_stack);
		if (!(kwdict &amp;&amp; PyDict_Check(kwdict))) {
			PyErr_Format(PyExc_TypeError,
				     "%s%s argument after ** "
				     "must be a dictionary",
				     PyEval_GetFuncName(func),
				     PyEval_GetFuncDesc(func));
			goto ext_call_fail;
		}
	}
	if (flags &amp; CALL_FLAG_VAR) {
		stararg = EXT_POP(*pp_stack);
		if (!PyTuple_Check(stararg)) {
			PyObject *t = NULL;
			t = PySequence_Tuple(stararg);
			if (t == NULL) {
				if (PyErr_ExceptionMatches(PyExc_TypeError)) {
					PyErr_Format(PyExc_TypeError,
						     "%s%s argument after * "
						     "must be a sequence",
						     PyEval_GetFuncName(func),
						     PyEval_GetFuncDesc(func));
				}
				goto ext_call_fail;
			}
			Py_DECREF(stararg);
			stararg = t;
		}
		nstar = PyTuple_GET_SIZE(stararg);
	}
	if (nk &gt; 0) {
		kwdict = update_keyword_args(kwdict, nk, pp_stack, func);
		if (kwdict == NULL)
			goto ext_call_fail;
	}
	callargs = update_star_args(na, nstar, stararg, pp_stack);
	if (callargs == NULL)
		goto ext_call_fail;
	result = PyObject_Call(func, callargs, kwdict);
      ext_call_fail:
	Py_XDECREF(callargs);
	Py_XDECREF(kwdict);
	Py_XDECREF(stararg);
	return result;
}
</t>
<t tx="T79">static PyObject *
gen_new(PyFrameObject *f)
{
	genobject *gen = PyObject_New(genobject, &amp;gentype);
	if (gen == NULL) {
		Py_DECREF(f);
		return NULL;
	}
	gen-&gt;gi_frame = f;
	gen-&gt;gi_running = 0;
	PyObject_GC_Init(gen);
	return (PyObject *)gen;
}
</t>
<t tx="T80">static int
gen_traverse(genobject *gen, visitproc visit, void *arg)
{
	return visit((PyObject *)gen-&gt;gi_frame, arg);
}
</t>
<t tx="T81">static void
gen_dealloc(genobject *gen)
{
	PyObject_GC_Fini(gen);
	Py_DECREF(gen-&gt;gi_frame);
	PyObject_Del(gen);
}
</t>
<t tx="T82">static PyObject *
gen_iternext(genobject *gen)
{
	PyThreadState *tstate = PyThreadState_GET();
	PyFrameObject *f = gen-&gt;gi_frame;
	PyObject *result;

	if (gen-&gt;gi_running) {
		PyErr_SetString(PyExc_ValueError,
				"generator already executing");
		return NULL;
	}
	if (f-&gt;f_stacktop == NULL)
		return NULL;

	/* Generators always return to their most recent caller, not
	 * necessarily their creator. */
	Py_XINCREF(tstate-&gt;frame);
	assert(f-&gt;f_back == NULL);
	f-&gt;f_back = tstate-&gt;frame;

	gen-&gt;gi_running = 1;
	result = eval_frame(f);
	gen-&gt;gi_running = 0;

	/* Don't keep the reference to f_back any longer than necessary.  It
	 * may keep a chain of frames alive or it could create a reference
	 * cycle. */
	Py_XDECREF(f-&gt;f_back);
	f-&gt;f_back = NULL;

	/* If the generator just returned (as opposed to yielding), signal
	 * that the generator is exhausted. */
	if (result == Py_None &amp;&amp; f-&gt;f_stacktop == NULL) {
		Py_DECREF(result);
		result = NULL;
	}

	return result;
}
</t>
<t tx="T83">static PyObject *
gen_next(genobject *gen)
{
	PyObject *result;

	result = gen_iternext(gen);

	if (result == NULL &amp;&amp; !PyErr_Occurred()) {
		PyErr_SetObject(PyExc_StopIteration, Py_None);
		return NULL;
	}

	return result;
}
</t>
<t tx="T84">static PyObject *
gen_getiter(PyObject *gen)
{
	Py_INCREF(gen);
	return gen;
}
</t>
<t tx="T85">#ifdef DYNAMIC_EXECUTION_PROFILE

static PyObject *
getarray(long a[256])
{
	int i;
	PyObject *l = PyList_New(256);
	if (l == NULL) return NULL;
	for (i = 0; i &lt; 256; i++) {
		PyObject *x = PyInt_FromLong(a[i]);
		if (x == NULL) {
			Py_DECREF(l);
			return NULL;
		}
		PyList_SetItem(l, i, x);
	}
	for (i = 0; i &lt; 256; i++)
		a[i] = 0;
	return l;
}
</t>
<t tx="T86">static PyObject *
import_from(PyObject *v, PyObject *name)
{
	PyObject *x;

	x = PyObject_GetAttr(v, name);
	if (x == NULL &amp;&amp; PyErr_ExceptionMatches(PyExc_AttributeError)) {
		PyErr_Format(PyExc_ImportError,
			     "cannot import name %.230s",
			     PyString_AsString(name));
	}
	return x;
}
</t>
<t tx="T87">static int
import_all_from(PyObject *locals, PyObject *v)
{
	PyObject *all = PyObject_GetAttrString(v, "__all__");
	PyObject *dict, *name, *value;
	int skip_leading_underscores = 0;
	int pos, err;

	if (all == NULL) {
		if (!PyErr_ExceptionMatches(PyExc_AttributeError))
			return -1; /* Unexpected error */
		PyErr_Clear();
		dict = PyObject_GetAttrString(v, "__dict__");
		if (dict == NULL) {
			if (!PyErr_ExceptionMatches(PyExc_AttributeError))
				return -1;
			PyErr_SetString(PyExc_ImportError,
			"from-import-* object has no __dict__ and no __all__");
			return -1;
		}
		all = PyMapping_Keys(dict);
		Py_DECREF(dict);
		if (all == NULL)
			return -1;
		skip_leading_underscores = 1;
	}

	for (pos = 0, err = 0; ; pos++) {
		name = PySequence_GetItem(all, pos);
		if (name == NULL) {
			if (!PyErr_ExceptionMatches(PyExc_IndexError))
				err = -1;
			else
				PyErr_Clear();
			break;
		}
		if (skip_leading_underscores &amp;&amp;
		    PyString_Check(name) &amp;&amp;
		    PyString_AS_STRING(name)[0] == '_')
		{
			Py_DECREF(name);
			continue;
		}
		value = PyObject_GetAttr(v, name);
		if (value == NULL)
			err = -1;
		else
			err = PyDict_SetItem(locals, name, value);
		Py_DECREF(name);
		Py_XDECREF(value);
		if (err != 0)
			break;
	}
	Py_DECREF(all);
	return err;
}
</t>
<t tx="T88">#define SLICE_ERROR_MSG \
	"standard sequence type does not support step size other than one"

static PyObject *
loop_subscript(PyObject *v, PyObject *w)
{
	PySequenceMethods *sq = v-&gt;ob_type-&gt;tp_as_sequence;
	int i;
	if (sq == NULL || sq-&gt;sq_item == NULL) {
		PyErr_SetString(PyExc_TypeError, "loop over non-sequence");
		return NULL;
	}
	i = PyInt_AsLong(w);
	v = (*sq-&gt;sq_item)(v, i);
	if (v)
		return v;
	if (PyErr_ExceptionMatches(PyExc_IndexError))
		PyErr_Clear();
	return NULL;
}
</t>
<t tx="T89">@ Extract a slice index from a PyInt or PyLong, and store in *pi.

Silently reduce values larger than INT_MAX to INT_MAX, and silently boost values less than -INT_MAX to 0. Return 0 on error, 1 on success.

Note: If v is NULL, return success without storing into *pi. This is because_PyEval_SliceIndex() is called by apply_slice(), which can be called by the SLICE opcode with v and/or w equal to NULL.
@c

int
_PyEval_SliceIndex(PyObject *v, int *pi)
{
	if (v != NULL) {
		long x;
		if (PyInt_Check(v)) {
			x = PyInt_AsLong(v);
		} else if (PyLong_Check(v)) {
			x = PyLong_AsLong(v);
			if (x==-1 &amp;&amp; PyErr_Occurred()) {
				PyObject *long_zero;
				int cmp;

				if (!PyErr_ExceptionMatches(
					PyExc_OverflowError)) {
					/* It's not an overflow error, so just
					   signal an error */
					return 0;
				}

				/* Clear the OverflowError */
				PyErr_Clear();

				/* It's an overflow error, so we need to
				   check the sign of the long integer,
				   set the value to INT_MAX or 0, and clear
				   the error. */

				/* Create a long integer with a value of 0 */
				long_zero = PyLong_FromLong(0L);
				if (long_zero == NULL)
					return 0;

				/* Check sign */
				cmp = PyObject_RichCompareBool(v, long_zero,
							       Py_GT);
				Py_DECREF(long_zero);
				if (cmp &lt; 0)
					return 0;
				else if (cmp &gt; 0)
					x = INT_MAX;
				else
					x = 0;
			}
		} else {
			PyErr_SetString(PyExc_TypeError,
					"slice indices must be integers");
			return 0;
		}
		/* Truncate -- very long indices are truncated anyway */
		if (x &gt; INT_MAX)
			x = INT_MAX;
		else if (x &lt; -INT_MAX)
			x = 0;
		*pi = x;
	}
	return 1;
}</t>
<t tx="T90">#undef ISINT
#define ISINT(x) ((x) == NULL || PyInt_Check(x) || PyLong_Check(x))

static PyObject *
apply_slice(PyObject *u, PyObject *v, PyObject *w) /* return u[v:w] */
{
	PyTypeObject *tp = u-&gt;ob_type;
	PySequenceMethods *sq = tp-&gt;tp_as_sequence;

	if (sq &amp;&amp; sq-&gt;sq_slice &amp;&amp; ISINT(v) &amp;&amp; ISINT(w)) {
		int ilow = 0, ihigh = INT_MAX;
		if (!_PyEval_SliceIndex(v, &amp;ilow))
			return NULL;
		if (!_PyEval_SliceIndex(w, &amp;ihigh))
			return NULL;
		return PySequence_GetSlice(u, ilow, ihigh);
	}
	else {
		PyObject *slice = PySlice_New(v, w, NULL);
		if (slice != NULL) {
			PyObject *res = PyObject_GetItem(u, slice);
			Py_DECREF(slice);
			return res;
		}
		else
			return NULL;
	}
}
</t>
<t tx="T91">static int
assign_slice(PyObject *u, PyObject *v, PyObject *w, PyObject *x)
	/* u[v:w] = x */
{
	PyTypeObject *tp = u-&gt;ob_type;
	PySequenceMethods *sq = tp-&gt;tp_as_sequence;

	if (sq &amp;&amp; sq-&gt;sq_slice &amp;&amp; ISINT(v) &amp;&amp; ISINT(w)) {
		int ilow = 0, ihigh = INT_MAX;
		if (!_PyEval_SliceIndex(v, &amp;ilow))
			return -1;
		if (!_PyEval_SliceIndex(w, &amp;ihigh))
			return -1;
		if (x == NULL)
			return PySequence_DelSlice(u, ilow, ihigh);
		else
			return PySequence_SetSlice(u, ilow, ihigh, x);
	}
	else {
		PyObject *slice = PySlice_New(v, w, NULL);
		if (slice != NULL) {
			int res;
			if (x != NULL)
				res = PyObject_SetItem(u, slice, x);
			else
				res = PyObject_DelItem(u, slice);
			Py_DECREF(slice);
			return res;
		}
		else
			return -1;
	}
}
</t>
<t tx="T92">#ifdef LLTRACE
	static int
	prtrace(PyObject *v, char *str)
	{
		printf("%s ", str);
		if (PyObject_Print(v, stdout, 0) != 0)
			PyErr_Clear(); /* Don't know what else to do */
		printf("\n");
		return 1;
	}
#endif</t>
<t tx="T93">static void
call_exc_trace(Py_tracefunc func, PyObject *self, PyFrameObject *f)
{
	PyObject *type, *value, *traceback, *arg;
	int err;
	PyErr_Fetch(&amp;type, &amp;value, &amp;traceback);
	if (value == NULL) {
		value = Py_None;
		Py_INCREF(value);
	}
	arg = Py_BuildValue("(OOO)", type, value, traceback);
	if (arg == NULL) {
		PyErr_Restore(type, value, traceback);
		return;
	}
	err = call_trace(func, self, f, PyTrace_EXCEPTION, arg);
	Py_DECREF(arg);
	if (err == 0)
		PyErr_Restore(type, value, traceback);
	else {
		Py_XDECREF(type);
		Py_XDECREF(value);
		Py_XDECREF(traceback);
	}
}
</t>
<t tx="T94">static void
call_trace_protected(Py_tracefunc func, PyObject *obj, PyFrameObject *frame,
		     int what)
{
	PyObject *type, *value, *traceback;
	int err;
	PyErr_Fetch(&amp;type, &amp;value, &amp;traceback);
	err = call_trace(func, obj, frame, what, NULL);
	if (err == 0)
		PyErr_Restore(type, value, traceback);
	else {
		Py_XDECREF(type);
		Py_XDECREF(value);
		Py_XDECREF(traceback);
	}
}
</t>
<t tx="T95">static int
call_trace(Py_tracefunc func, PyObject *obj, PyFrameObject *frame,
	   int what, PyObject *arg)
{
	register PyThreadState *tstate = frame-&gt;f_tstate;
	int result;
	if (tstate-&gt;tracing)
		return 0;
	tstate-&gt;tracing++;
	tstate-&gt;use_tracing = 0;
	result = func(obj, frame, what, arg);
	tstate-&gt;use_tracing = ((tstate-&gt;c_tracefunc != NULL)
			       || (tstate-&gt;c_profilefunc != NULL));
	tstate-&gt;tracing--;
	return result;
}
</t>
<t tx="T96">int
Py_FlushLine(void)
{
	PyObject *f = PySys_GetObject("stdout");
	if (f == NULL)
		return 0;
	if (!PyFile_SoftSpace(f, 0))
		return 0;
	return PyFile_WriteString("\n", f);
}
</t>
<t tx="T97">@ Iterate v argcnt times and store the results on the stack (via decreasing sp). Return 1 for success, 0 if error. */
@c

static int
unpack_iterable(PyObject *v, int argcnt, PyObject **sp)
{
	int i = 0;
	PyObject *it;  /* iter(v) */
	PyObject *w;

	assert(v != NULL);

	it = PyObject_GetIter(v);
	if (it == NULL)
		goto Error;

	for (; i &lt; argcnt; i++) {
		w = PyIter_Next(it);
		if (w == NULL) {
			/* Iterator done, via error or exhaustion. */
			if (!PyErr_Occurred()) {
				PyErr_Format(PyExc_ValueError,
					"need more than %d value%s to unpack",
					i, i == 1 ? "" : "s");
			}
			goto Error;
		}
		*--sp = w;
	}

	/* We better have exhausted the iterator now. */
	w = PyIter_Next(it);
	if (w == NULL) {
		if (PyErr_Occurred())
			goto Error;
		Py_DECREF(it);
		return 1;
	}
	Py_DECREF(w);
	PyErr_SetString(PyExc_ValueError, "too many values to unpack");
	/* fall through */
Error:
	for (; i &gt; 0; i--, sp++)
		Py_DECREF(*sp);
	Py_XDECREF(it);
	return 0;
}
</t>
</tnodes>
</leo_file>
