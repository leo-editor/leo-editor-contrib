<?xml version="1.0" encoding="UTF-8"?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="52" clone_windows="0"/>
<globals body_outline_ratio="0.43278301886792453">
	<global_window_position top="56" left="168" height="848" width="800"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences allow_rich_text="0">
</preferences>
<find_panel_settings>
	<find_string></find_string>
	<change_string></change_string>
</find_panel_settings>
<vnodes>
<v t="T1" a="E"><vh>gcmodule</vh>
<v t="T2"><vh>@url http://www.arctrix.com/nas/python/gc/</vh></v>
<v t="T3" a="E"><vh>@file gcmodule.c</vh>
<v t="T4" a="E"><vh>Code used only if WITH_CYCLE_GC is true</vh>
<v t="T5"><vh>&lt;&lt; gcmodule declarations &gt;&gt;</vh></v>
<v t="T6"><vh>List functions...</vh>
<v t="T7"><vh>gc_list_init</vh></v>
<v t="T8"><vh>gc_list_append</vh></v>
<v t="T9"><vh>gc_list_remove</vh></v>
<v t="T10"><vh>gc_list_move</vh></v>
<v t="T11"><vh>gc_list_merge</vh></v>
<v t="T12"><vh>gc_list_size</vh></v>
</v>
<v t="T13"><vh>The gc</vh>
<v t="T14" a="M"><vh>collect (documentation)</vh></v>
<v t="T15"><vh>collect_generations</vh></v>
<v t="T16"><vh>debug_cycle</vh></v>
<v t="T17"><vh>debug_instance</vh></v>
<v t="T18"><vh>delete_garbage</vh></v>
<v t="T19"><vh>handle_finalizers</vh></v>
<v t="T20"><vh>has_finalizer</vh></v>
<v t="T21"><vh>move_finalizer_reachable</vh></v>
<v t="T22"><vh>move_finalizers</vh></v>
<v t="T23"><vh>move_root_reachable</vh></v>
<v t="T24"><vh>move_roots</vh></v>
<v t="T25"><vh>subtract_refs</vh></v>
<v t="T26"><vh>update_refs</vh></v>
<v t="T27"><vh>visit_decref</vh></v>
<v t="T28"><vh>visit_move</vh></v>
</v>
<v t="T29"><vh>Interface routines &amp; the dispatch table</vh>
<v t="T30"><vh>gc_enable</vh></v>
<v t="T31"><vh>gc_disable</vh></v>
<v t="T32"><vh>gc_isenabled</vh></v>
<v t="T33"><vh>gc_collect</vh></v>
<v t="T34"><vh>gc_set_debug</vh></v>
<v t="T35"><vh>gc_get_debug</vh></v>
<v t="T36"><vh>gc_set_thresh</vh></v>
<v t="T37"><vh>gc_get_thresh</vh></v>
<v t="T38"><vh>referrersvisit</vh></v>
<v t="T39"><vh>gc_referrers_for</vh></v>
<v t="T40"><vh>gc_get_referrers</vh></v>
<v t="T41"><vh>append_objects</vh></v>
<v t="T42"><vh>gc_get_objects</vh></v>
<v t="T43"><vh>initgc (the dispatch table)</vh></v>
</v>
<v t="T44"><vh>_PyGC_Dump</vh></v>
</v>
<v t="T45" a="E"><vh>Code always available (Entry points for extension modules)</vh>
<v t="T46"><vh>_PyObject_GC_Track</vh></v>
<v t="T47"><vh>_PyObject_GC_UnTrack</vh></v>
<v t="T48"><vh>_PyObject_GC_Malloc</vh></v>
<v t="T49"><vh>_PyObject_GC_New</vh></v>
<v t="T50"><vh>_PyObject_GC_NewVar</vh></v>
<v t="T51"><vh>_PyObject_GC_Resize</vh></v>
<v t="T52" a="V"><vh>_PyObject_GC_Del</vh></v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="T1">@ This outline contains the Pyhton's code that does garbage collection.

This is a good example of how to use Leo to study complex code.

Double click on the icon to the left of the @url node to bring up excellent documentation for this code.
</t>
<t tx="T2"></t>
<t tx="T3">@ignore
@language c

/*

  Reference Cycle Garbage Collection
  ==================================

  Neil Schemenauer &lt;nas@arctrix.com&gt;

  Based on a post on the python-dev list.  Ideas from Guido van Rossum,
  Eric Tiedemann, and various others.

  http://www.arctrix.com/nas/python/gc/
  
  http://www.python.org/pipermail/python-dev/2000-March/003869.html
  http://www.python.org/pipermail/python-dev/2000-March/004010.html
  http://www.python.org/pipermail/python-dev/2000-March/004022.html

  For a highlevel view of the collection process, read the collect function.
*/

#include "Python.h"
&lt;&lt; gcmodule declarations &gt;&gt;
@others

</t>
<t tx="T4"></t>
<t tx="T5">#ifdef WITH_CYCLE_GC

/* Get an object's GC head */
#define AS_GC(o) ((PyGC_Head *)(o)-1)

/* Get the object given the GC head */
#define FROM_GC(g) ((PyObject *)(((PyGC_Head *)g)+1))

/*** Global GC state ***/

/* linked lists of container objects */
PyGC_Head _PyGC_generation0 = {{&amp;_PyGC_generation0, &amp;_PyGC_generation0, 0}};
static PyGC_Head generation1 = {{&amp;generation1, &amp;generation1, 0}};
static PyGC_Head generation2 = {{&amp;generation2, &amp;generation2, 0}};
static int generation = 0; /* current generation being collected */

/* collection frequencies, XXX tune these */
static int enabled = 1; /* automatic collection enabled? */
static int threshold0 = 700; /* net new containers before collection */
static int threshold1 = 10;  /* generation0 collections before collecting 1 */
static int threshold2 = 10;  /* generation1 collections before collecting 2 */

/* net new objects allocated since last collection */
static int allocated;

/* true if we are currently running the collector */
static int collecting;

/* set for debugging information */
#define DEBUG_STATS		       (1&lt;&lt;0) /* print collection statistics */
#define DEBUG_COLLECTABLE	  (1&lt;&lt;1) /* print collectable objects */
#define DEBUG_UNCOLLECTABLE	(1&lt;&lt;2) /* print uncollectable objects */
#define DEBUG_INSTANCES		   (1&lt;&lt;3) /* print instances */
#define DEBUG_OBJECTS		     (1&lt;&lt;4) /* print other objects */
#define DEBUG_SAVEALL		(     1&lt;&lt;5) /* save all garbage in gc.garbage */
#define DEBUG_LEAK		DEBUG_COLLECTABLE | \
				DEBUG_UNCOLLECTABLE | \
				DEBUG_INSTANCES | \
				DEBUG_OBJECTS | \
				DEBUG_SAVEALL
static int debug;

/* When a collection begins, gc_refs is set to ob_refcnt for, and only for,
 * the objects in the generation being collected, called the "young"
 * generation at that point.  As collection proceeds, when it's determined
 * that one of these can't be collected (e.g., because it's reachable from
 * outside, or has a __del__ method), the object is moved out of young, and
 * gc_refs is set to a negative value.  The latter is so we can distinguish
 * collection candidates from non-candidates just by looking at the object.
 */

/* Special gc_refs value, although any negative value means "moved". */
#define GC_MOVED  -123

/* True iff an object is still a candidate for collection. */
#define STILL_A_CANDIDATE(o) ((AS_GC(o))-&gt;gc.gc_refs &gt;= 0)

/* list of uncollectable objects */
static PyObject *garbage;

/* Python string to use if unhandled exception occurs */
static PyObject *gc_str;
</t>
<t tx="T6">// ** list functions **

</t>
<t tx="T7">static void
gc_list_init(PyGC_Head *list)
{
	list-&gt;gc.gc_prev = list;
	list-&gt;gc.gc_next = list;
}
</t>
<t tx="T8">
static void
gc_list_append(PyGC_Head *node, PyGC_Head *list)
{
	node-&gt;gc.gc_next = list;
	node-&gt;gc.gc_prev = list-&gt;gc.gc_prev;
	node-&gt;gc.gc_prev-&gt;gc.gc_next = node;
	list-&gt;gc.gc_prev = node;
}
</t>
<t tx="T9">
static void
gc_list_remove(PyGC_Head *node)
{
	node-&gt;gc.gc_prev-&gt;gc.gc_next = node-&gt;gc.gc_next;
	node-&gt;gc.gc_next-&gt;gc.gc_prev = node-&gt;gc.gc_prev;
	node-&gt;gc.gc_next = NULL; /* object is not currently tracked */
}
</t>
<t tx="T10">
static void
gc_list_move(PyGC_Head *from, PyGC_Head *to)
{
	if (from-&gt;gc.gc_next == from) {
		/* empty from list */
		gc_list_init(to);
	}
	else {
		to-&gt;gc.gc_next = from-&gt;gc.gc_next;
		to-&gt;gc.gc_next-&gt;gc.gc_prev = to;
		to-&gt;gc.gc_prev = from-&gt;gc.gc_prev;
		to-&gt;gc.gc_prev-&gt;gc.gc_next = to;
	}
	gc_list_init(from);
}
</t>
<t tx="T11">@ append a list onto another list, from becomes an empty list
@c

static void
gc_list_merge(PyGC_Head *from, PyGC_Head *to)
{
	PyGC_Head *tail;
	if (from-&gt;gc.gc_next != from) {
		tail = to-&gt;gc.gc_prev;
		tail-&gt;gc.gc_next = from-&gt;gc.gc_next;
		tail-&gt;gc.gc_next-&gt;gc.gc_prev = tail;
		to-&gt;gc.gc_prev = from-&gt;gc.gc_prev;
		to-&gt;gc.gc_prev-&gt;gc.gc_next = to;
	}
	gc_list_init(from);
}
</t>
<t tx="T12">static long
gc_list_size(PyGC_Head *list)
{
	PyGC_Head *gc;
	long n = 0;
	for (gc = list-&gt;gc.gc_next; gc != list; gc = gc-&gt;gc.gc_next) {
		n++;
	}
	return n;
}
</t>
<t tx="T13"></t>
<t tx="T14">// This is the main function. Read this to understand how the collection process works.

static long
collect(PyGC_Head *young, PyGC_Head *old)
{
	long n = 0;
	long m = 0;
	PyGC_Head reachable;
	PyGC_Head unreachable;
	PyGC_Head finalizers;
	PyGC_Head *gc;

	if (debug &amp; DEBUG_STATS) {
		PySys_WriteStderr(
			"gc: collecting generation %d...\n"
			"gc: objects in each generation: %ld %ld %ld\n",
			generation,
			gc_list_size(&amp;_PyGC_generation0),
			gc_list_size(&amp;generation1),
			gc_list_size(&amp;generation2));
	}

	/* Using ob_refcnt and gc_refs, calculate which objects in the
	 * container set are reachable from outside the set (ie. have a
	 * refcount greater than 0 when all the references within the
	 * set are taken into account */
	update_refs(young);
	subtract_refs(young);

	/* Move everything reachable from outside the set into the
	 * reachable set (ie. gc_refs &gt; 0).  Next, move everything
	 * reachable from objects in the reachable set. */
	gc_list_init(&amp;reachable);
	move_roots(young, &amp;reachable);
	move_root_reachable(&amp;reachable);

	/* move unreachable objects to a temporary list, new objects can be
	 * allocated after this point */
	gc_list_init(&amp;unreachable);
	gc_list_move(young, &amp;unreachable);

	/* move reachable objects to next generation */
	gc_list_merge(&amp;reachable, old);

	/* Move objects reachable from finalizers, we can't safely delete
	 * them.  Python programmers should take care not to create such
	 * things.  For Python finalizers means instance objects with
	 * __del__ methods. */
	gc_list_init(&amp;finalizers);
	move_finalizers(&amp;unreachable, &amp;finalizers);
	move_finalizer_reachable(&amp;finalizers);

	/* Collect statistics on collectable objects found and print
	 * debugging information. */
	for (gc = unreachable.gc.gc_next; gc != &amp;unreachable;
			gc = gc-&gt;gc.gc_next) {
		m++;
		if (debug &amp; DEBUG_COLLECTABLE) {
			debug_cycle("collectable", FROM_GC(gc));
		}
	}
	/* call tp_clear on objects in the collectable set.  This will cause
	 * the reference cycles to be broken. It may also cause some objects in
	 * finalizers to be freed */
	delete_garbage(&amp;unreachable, old);

	/* Collect statistics on uncollectable objects found and print
	 * debugging information. */
	for (gc = finalizers.gc.gc_next; gc != &amp;finalizers;
			gc = gc-&gt;gc.gc_next) {
		n++;
		if (debug &amp; DEBUG_UNCOLLECTABLE) {
			debug_cycle("uncollectable", FROM_GC(gc));
		}
	}
	if (debug &amp; DEBUG_STATS) {
		if (m == 0 &amp;&amp; n == 0) {
			PySys_WriteStderr("gc: done.\n");
		}
		else {
			PySys_WriteStderr(
			    "gc: done, %ld unreachable, %ld uncollectable.\n",
			    n+m, n);
		}
	}

	/* Append instances in the uncollectable set to a Python
	 * reachable list of garbage.  The programmer has to deal with
	 * this if they insist on creating this type of structure. */
	handle_finalizers(&amp;finalizers, old);

	if (PyErr_Occurred()) {
		if (gc_str == NULL) {
		    gc_str = PyString_FromString("garbage collection");
		}
		PyErr_WriteUnraisable(gc_str);
		Py_FatalError("unexpected exception during garbage collection");
	}
	allocated = 0;
	return n+m;
}
</t>
<t tx="T15">static long
collect_generations(void)
{
	static long collections0 = 0;
	static long collections1 = 0;
	long n = 0;


	if (collections1 &gt; threshold2) {
		generation = 2;
		gc_list_merge(&amp;_PyGC_generation0, &amp;generation2);
		gc_list_merge(&amp;generation1, &amp;generation2);
		if (generation2.gc.gc_next != &amp;generation2) {
			n = collect(&amp;generation2, &amp;generation2);
		}
		collections1 = 0;
	}
	else if (collections0 &gt; threshold1) {
		generation = 1;
		collections1++;
		gc_list_merge(&amp;_PyGC_generation0, &amp;generation1);
		if (generation1.gc.gc_next != &amp;generation1) {
			n = collect(&amp;generation1, &amp;generation2);
		}
		collections0 = 0;
	}
	else {
		generation = 0;
		collections0++;
		if (_PyGC_generation0.gc.gc_next != &amp;_PyGC_generation0) {
			n = collect(&amp;_PyGC_generation0, &amp;generation1);
		}
	}
	return n;
}
</t>
<t tx="T16">static void
debug_cycle(char *msg, PyObject *op)
{
	if ((debug &amp; DEBUG_INSTANCES) &amp;&amp; PyInstance_Check(op)) {
		debug_instance(msg, (PyInstanceObject *)op);
	}
	else if (debug &amp; DEBUG_OBJECTS) {
		PySys_WriteStderr("gc: %.100s &lt;%.100s %p&gt;\n",
				  msg, op-&gt;ob_type-&gt;tp_name, op);
	}
}
</t>
<t tx="T17">static void
debug_instance(char *msg, PyInstanceObject *inst)
{
	char *cname;
	/* simple version of instance_repr */
	PyObject *classname = inst-&gt;in_class-&gt;cl_name;
	if (classname != NULL &amp;&amp; PyString_Check(classname))
		cname = PyString_AsString(classname);
	else
		cname = "?";
	PySys_WriteStderr("gc: %.100s &lt;%.100s instance at %p&gt;\n",
			  msg, cname, inst);
}
</t>
<t tx="T18">@ Break reference cycles by clearing the containers involved. This is tricky business as the lists can be changing and we don't know which objects may be freed. It is possible I screwed something up here.
@c

static void
delete_garbage(PyGC_Head *unreachable, PyGC_Head *old)
{
	inquiry clear;

	while (unreachable-&gt;gc.gc_next != unreachable) {
		PyGC_Head *gc = unreachable-&gt;gc.gc_next;
		PyObject *op = FROM_GC(gc);

		assert(STILL_A_CANDIDATE(op));
		if (debug &amp; DEBUG_SAVEALL) {
			PyList_Append(garbage, op);
		}
		else {
			if ((clear = op-&gt;ob_type-&gt;tp_clear) != NULL) {
				Py_INCREF(op);
				clear((PyObject *)op);
				Py_DECREF(op);
			}
		}
		if (unreachable-&gt;gc.gc_next == gc) {
			/* object is still alive, move it, it may die later */
			gc_list_remove(gc);
			gc_list_append(gc, old);
			gc-&gt;gc.gc_refs = GC_MOVED;
		}
	}
}
</t>
<t tx="T19">// Handle uncollectable garbage (cycles with finalizers).

static void
handle_finalizers(PyGC_Head *finalizers, PyGC_Head *old)
{
	PyGC_Head *gc;
	if (garbage == NULL) {
		garbage = PyList_New(0);
	}
	for (gc = finalizers-&gt;gc.gc_next; gc != finalizers;
			gc = finalizers-&gt;gc.gc_next) {
		PyObject *op = FROM_GC(gc);
		if ((debug &amp; DEBUG_SAVEALL) || has_finalizer(op)) {
			/* If SAVEALL is not set then just append objects with
			 * finalizers to the list of garbage.  All objects in
			 * the finalizers list are reachable from those
			 * objects. */
			PyList_Append(garbage, op);
		}
		/* object is now reachable again */
		assert(!STILL_A_CANDIDATE(op));
		gc_list_remove(gc);
		gc_list_append(gc, old);
	}
}
</t>
<t tx="T20">// return true if object has a finalization method.

static int
has_finalizer(PyObject *op)
{
	static PyObject *delstr = NULL;
	if (delstr == NULL) {
		delstr = PyString_InternFromString("__del__");
		if (delstr == NULL)
			Py_FatalError("PyGC: can't initialize __del__ string");
	}
	return (PyInstance_Check(op) ||
	        PyType_HasFeature(op-&gt;ob_type, Py_TPFLAGS_HEAPTYPE))
	       &amp;&amp; PyObject_HasAttr(op, delstr);
}
</t>
<t tx="T21">// Move objects referenced from roots to roots.

static void
move_finalizer_reachable(PyGC_Head *finalizers)
{
	traverseproc traverse;
	PyGC_Head *gc = finalizers-&gt;gc.gc_next;
	for (; gc != finalizers; gc=gc-&gt;gc.gc_next) {
		/* careful, finalizers list is growing here */
		traverse = FROM_GC(gc)-&gt;ob_type-&gt;tp_traverse;
		(void) traverse(FROM_GC(gc),
			       (visitproc)visit_move,
			       (void *)finalizers);
	}
}
</t>
<t tx="T22">// Move all objects with finalizers (instances with __del__)

static void
move_finalizers(PyGC_Head *unreachable, PyGC_Head *finalizers)
{
	PyGC_Head *next;
	PyGC_Head *gc = unreachable-&gt;gc.gc_next;
	for (; gc != unreachable; gc=next) {
		PyObject *op = FROM_GC(gc);
		next = gc-&gt;gc.gc_next;
		if (has_finalizer(op)) {
			gc_list_remove(gc);
			gc_list_append(gc, finalizers);
			gc-&gt;gc.gc_refs = GC_MOVED;
		}
	}
}
</t>
<t tx="T23">// Move candidates referenced from reachable to reachable set (they're no longer candidates).

static void
move_root_reachable(PyGC_Head *reachable)
{
	traverseproc traverse;
	PyGC_Head *gc = reachable-&gt;gc.gc_next;
	for (; gc != reachable; gc=gc-&gt;gc.gc_next) {
		/* careful, reachable list is growing here */
		PyObject *op = FROM_GC(gc);
		traverse = op-&gt;ob_type-&gt;tp_traverse;
		(void) traverse(op,
			       (visitproc)visit_move,
			       (void *)reachable);
	}
}
</t>
<t tx="T24">// Move objects with gc_refs &gt; 0 to roots list. They can't be collected.

static void
move_roots(PyGC_Head *containers, PyGC_Head *roots)
{
	PyGC_Head *next;
	PyGC_Head *gc = containers-&gt;gc.gc_next;
	while (gc != containers) {
		next = gc-&gt;gc.gc_next;
		if (gc-&gt;gc.gc_refs &gt; 0) {
			gc_list_remove(gc);
			gc_list_append(gc, roots);
			gc-&gt;gc.gc_refs = GC_MOVED;
		}
		gc = next;
	}
}
</t>
<t tx="T25">// Subtract internal references from gc_refs

static void
subtract_refs(PyGC_Head *containers)
{
	traverseproc traverse;
	PyGC_Head *gc = containers-&gt;gc.gc_next;
	for (; gc != containers; gc=gc-&gt;gc.gc_next) {
		traverse = FROM_GC(gc)-&gt;ob_type-&gt;tp_traverse;
		(void) traverse(FROM_GC(gc),
			       (visitproc)visit_decref,
			       NULL);
	}
}
</t>
<t tx="T26">@ Set all gc_refs = ob_refcnt. After this, STILL_A_CANDIDATE(o) is true for all objects in containers, and false for all tracked gc objects not in containers (although see the comment in visit_decref).
@c

static void
update_refs(PyGC_Head *containers)
{
	PyGC_Head *gc = containers-&gt;gc.gc_next;
	for (; gc != containers; gc=gc-&gt;gc.gc_next) {
		gc-&gt;gc.gc_refs = FROM_GC(gc)-&gt;ob_refcnt;
	}
}
</t>
<t tx="T27">static int
visit_decref(PyObject *op, void *data)
{
	/* There's no point to decrementing gc_refs unless
	 * STILL_A_CANDIDATE(op) is true.  It would take extra cycles to
	 * check that, though.  If STILL_A_CANDIDATE(op) is false,
	 * decrementing gc_refs almost always makes it "even more negative",
	 * so doesn't change that STILL_A_CANDIDATE is false, and no harm is
	 * done.  However, it's possible that, after many collections, this
	 * could underflow gc_refs in a long-lived old object.  In that case,
	 * visit_move() may move the old object back to the generation
	 * getting collected.  That would be a waste of time, but wouldn't
	 * cause an error.
	 */
	if (op &amp;&amp; PyObject_IS_GC(op)) {
		PyGC_Head *gc = AS_GC(op);
		if (gc-&gt;gc.gc_next != NULL)
			AS_GC(op)-&gt;gc.gc_refs--;
	}
	return 0;
}</t>
<t tx="T28">static int
visit_move(PyObject *op, PyGC_Head *tolist)
{
	if (PyObject_IS_GC(op)) {
		PyGC_Head *gc = AS_GC(op);
		if (gc-&gt;gc.gc_next != NULL &amp;&amp; STILL_A_CANDIDATE(op)) {
			gc_list_remove(gc);
			gc_list_append(gc, tolist);
			gc-&gt;gc.gc_refs = GC_MOVED;
		}
	}
	return 0;
}
</t>
<t tx="T29"></t>
<t tx="T30">static char gc_enable__doc__[] =
"enable() -&gt; None\n"
"\n"
"Enable automatic garbage collection.\n"
;

static PyObject *
gc_enable(PyObject *self, PyObject *args)
{

	if (!PyArg_ParseTuple(args, ":enable"))	/* check no args */
		return NULL;

	enabled = 1;

	Py_INCREF(Py_None);
	return Py_None;
}
</t>
<t tx="T31">static char gc_disable__doc__[] =
"disable() -&gt; None\n"
"\n"
"Disable automatic garbage collection.\n"
;

static PyObject *
gc_disable(PyObject *self, PyObject *args)
{

	if (!PyArg_ParseTuple(args, ":disable"))	/* check no args */
		return NULL;

	enabled = 0;

	Py_INCREF(Py_None);
	return Py_None;
}
</t>
<t tx="T32">static char gc_isenabled__doc__[] =
"isenabled() -&gt; status\n"
"\n"
"Returns true if automatic garbage collection is enabled.\n"
;

static PyObject *
gc_isenabled(PyObject *self, PyObject *args)
{

	if (!PyArg_ParseTuple(args, ":isenabled"))	/* check no args */
		return NULL;

	return Py_BuildValue("i", enabled);
}
</t>
<t tx="T33">static char gc_collect__doc__[] =
"collect() -&gt; n\n"
"\n"
"Run a full collection.  The number of unreachable objects is returned.\n"
;

static PyObject *
gc_collect(PyObject *self, PyObject *args)
{
	long n;

	if (!PyArg_ParseTuple(args, ":collect"))	/* check no args */
		return NULL;

	if (collecting) {
		n = 0; /* already collecting, don't do anything */
	}
	else {
		collecting = 1;
		generation = 2;
		gc_list_merge(&amp;_PyGC_generation0, &amp;generation2);
		gc_list_merge(&amp;generation1, &amp;generation2);
		n = collect(&amp;generation2, &amp;generation2);
		collecting = 0;
	}

	return Py_BuildValue("l", n);
}
</t>
<t tx="T34">static char gc_set_debug__doc__[] =
"set_debug(flags) -&gt; None\n"
"\n"
"Set the garbage collection debugging flags. Debugging information is\n"
"written to sys.stderr.\n"
"\n"
"flags is an integer and can have the following bits turned on:\n"
"\n"
"  DEBUG_STATS - Print statistics during collection.\n"
"  DEBUG_COLLECTABLE - Print collectable objects found.\n"
"  DEBUG_UNCOLLECTABLE - Print unreachable but uncollectable objects found.\n"
"  DEBUG_INSTANCES - Print instance objects.\n"
"  DEBUG_OBJECTS - Print objects other than instances.\n"
"  DEBUG_SAVEALL - Save objects to gc.garbage rather than freeing them.\n"
"  DEBUG_LEAK - Debug leaking programs (everything but STATS).\n"
;

static PyObject *
gc_set_debug(PyObject *self, PyObject *args)
{
	if (!PyArg_ParseTuple(args, "i:set_debug", &amp;debug))
		return NULL;

	Py_INCREF(Py_None);
	return Py_None;
}
</t>
<t tx="T35">static char gc_get_debug__doc__[] =
"get_debug() -&gt; flags\n"
"\n"
"Get the garbage collection debugging flags.\n"
;

static PyObject *
gc_get_debug(PyObject *self, PyObject *args)
{
	if (!PyArg_ParseTuple(args, ":get_debug"))	/* no args */
		return NULL;

	return Py_BuildValue("i", debug);
}
</t>
<t tx="T36">static char gc_set_thresh__doc__[] =
"set_threshold(threshold0, [threshold1, threshold2]) -&gt; None\n"
"\n"
"Sets the collection thresholds.  Setting threshold0 to zero disables\n"
"collection.\n"
;

static PyObject *
gc_set_thresh(PyObject *self, PyObject *args)
{
	if (!PyArg_ParseTuple(args, "i|ii:set_threshold", &amp;threshold0,
				&amp;threshold1, &amp;threshold2))
		return NULL;

	Py_INCREF(Py_None);
	return Py_None;
}
</t>
<t tx="T37">static char gc_get_thresh__doc__[] =
"get_threshold() -&gt; (threshold0, threshold1, threshold2)\n"
"\n"
"Return the current collection thresholds\n"
;

static PyObject *
gc_get_thresh(PyObject *self, PyObject *args)
{
	if (!PyArg_ParseTuple(args, ":get_threshold"))	/* no args */
		return NULL;

	return Py_BuildValue("(iii)", threshold0, threshold1, threshold2);
}
</t>
<t tx="T38">static int
referrersvisit(PyObject* obj, PyObject *objs)
{
	int i;
	for (i = 0; i &lt; PyTuple_GET_SIZE(objs); i++)
		if (PyTuple_GET_ITEM(objs, i) == obj)
			return 1;
	return 0;
}
</t>
<t tx="T39">static int
gc_referrers_for(PyObject *objs, PyGC_Head *list, PyObject *resultlist)
{
	PyGC_Head *gc;
	PyObject *obj;
	traverseproc traverse;
	for (gc = list-&gt;gc.gc_next; gc != list; gc = gc-&gt;gc.gc_next) {
		obj = FROM_GC(gc);
		traverse = obj-&gt;ob_type-&gt;tp_traverse;
		if (obj == objs || obj == resultlist)
			continue;
		if (traverse(obj, (visitproc)referrersvisit, objs)) {
			if (PyList_Append(resultlist, obj) &lt; 0)
				return 0; /* error */
		}
	}
	return 1; /* no error */
}
</t>
<t tx="T40">static char gc_get_referrers__doc__[]=
"get_referrers(*objs) -&gt; list\n\
Return the list of objects that directly refer to any of objs.";

static PyObject *
gc_get_referrers(PyObject *self, PyObject *args)
{
	PyObject *result = PyList_New(0);
	if (!(gc_referrers_for(args, &amp;_PyGC_generation0, result) &amp;&amp;
	      gc_referrers_for(args, &amp;generation1, result) &amp;&amp;
	      gc_referrers_for(args, &amp;generation2, result))) {
		Py_DECREF(result);
		return NULL;
	}
	return result;
}
</t>
<t tx="T41">static char gc_get_objects__doc__[] =
"get_objects() -&gt; [...]\n"
"\n"
"Return a list of objects tracked by the collector (excluding the list\n"
"returned).\n"
;

/* appending objects in a GC list to a Python list */
static int
append_objects(PyObject *py_list, PyGC_Head *gc_list)
{
	PyGC_Head *gc;
	for (gc = gc_list-&gt;gc.gc_next; gc != gc_list; gc = gc-&gt;gc.gc_next) {
		PyObject *op = FROM_GC(gc);
		if (op != py_list) {
			if (PyList_Append(py_list, op)) {
				return -1; /* exception */
			}
		}
	}
	return 0;
}
</t>
<t tx="T42">static PyObject *
gc_get_objects(PyObject *self, PyObject *args)
{
	PyObject* result;

	if (!PyArg_ParseTuple(args, ":get_objects")) /* check no args */
		return NULL;
	result = PyList_New(0);
	if (result == NULL) {
		return NULL;
	}
	if (append_objects(result, &amp;_PyGC_generation0) ||
	    append_objects(result, &amp;generation1) ||
	    append_objects(result, &amp;generation2)) {
		Py_DECREF(result);
		return NULL;
	}
	return result;
}
</t>
<t tx="T43">static char gc__doc__ [] =
"This module provides access to the garbage collector for reference cycles.\n"
"\n"
"enable() -- Enable automatic garbage collection.\n"
"disable() -- Disable automatic garbage collection.\n"
"isenabled() -- Returns true if automatic collection is enabled.\n"
"collect() -- Do a full collection right now.\n"
"set_debug() -- Set debugging flags.\n"
"get_debug() -- Get debugging flags.\n"
"set_threshold() -- Set the collection thresholds.\n"
"get_threshold() -- Return the current the collection thresholds.\n"
"get_objects() -- Return a list of all objects tracked by the collector.\n"
"get_referrers() -- Return the list of objects that refer to an object.\n"
;

static PyMethodDef GcMethods[] = {
	{"enable",	        gc_enable,	       METH_VARARGS, gc_enable__doc__},
	{"disable",	       gc_disable,	      METH_VARARGS, gc_disable__doc__},
	{"isenabled",	     gc_isenabled,     METH_VARARGS, gc_isenabled__doc__},
	{"set_debug",	     gc_set_debug,     METH_VARARGS, gc_set_debug__doc__},
	{"get_debug",	     gc_get_debug,     METH_VARARGS, gc_get_debug__doc__},
	{"set_threshold",  gc_set_thresh,    METH_VARARGS, gc_set_thresh__doc__},
	{"get_threshold",  gc_get_thresh,    METH_VARARGS, gc_get_thresh__doc__},
	{"collect",	       gc_collect,	      METH_VARARGS, gc_collect__doc__},
	{"get_objects",    gc_get_objects,   METH_VARARGS, gc_get_objects__doc__},
	{"get_referrers",  gc_get_referrers, METH_VARARGS,
		gc_get_referrers__doc__},
	{NULL,	NULL}		/* Sentinel */
};

void
initgc(void)
{
	PyObject *m;
	PyObject *d;

	m = Py_InitModule4("gc",
			      GcMethods,
			      gc__doc__,
			      NULL,
			      PYTHON_API_VERSION);
	d = PyModule_GetDict(m);
	if (garbage == NULL) {
		garbage = PyList_New(0);
	}
	PyDict_SetItemString(d, "garbage", garbage);
	PyDict_SetItemString(d, "DEBUG_STATS",
			PyInt_FromLong(DEBUG_STATS));
	PyDict_SetItemString(d, "DEBUG_COLLECTABLE",
			PyInt_FromLong(DEBUG_COLLECTABLE));
	PyDict_SetItemString(d, "DEBUG_UNCOLLECTABLE",
			PyInt_FromLong(DEBUG_UNCOLLECTABLE));
	PyDict_SetItemString(d, "DEBUG_INSTANCES",
			PyInt_FromLong(DEBUG_INSTANCES));
	PyDict_SetItemString(d, "DEBUG_OBJECTS",
			PyInt_FromLong(DEBUG_OBJECTS));
	PyDict_SetItemString(d, "DEBUG_SAVEALL",
			PyInt_FromLong(DEBUG_SAVEALL));
	PyDict_SetItemString(d, "DEBUG_LEAK",
			PyInt_FromLong(DEBUG_LEAK));
}
</t>
<t tx="T44">// for debugging

void _PyGC_Dump(PyGC_Head *g)
{
	_PyObject_Dump(FROM_GC(g));
}

#endif /* WITH_CYCLE_GC */</t>
<t tx="T45">/* extension modules might be compiled with GC support so these
   functions must always be available */
   
// EKR: these use regular allocation if WITH_CYCLE_GC is not defined.</t>
<t tx="T46">void
_PyObject_GC_Track(PyObject *op)
{
	_PyObject_GC_TRACK(op);
}
</t>
<t tx="T47">void
_PyObject_GC_UnTrack(PyObject *op)
{
#ifdef WITH_CYCLE_GC
	PyGC_Head *gc = AS_GC(op);
	if (gc-&gt;gc.gc_next != NULL)
		_PyObject_GC_UNTRACK(op);
#endif
}
</t>
<t tx="T48">PyObject *
_PyObject_GC_Malloc(PyTypeObject *tp, int nitems)
{
	PyObject *op;
	const size_t basicsize = _PyObject_VAR_SIZE(tp, nitems);
#ifdef WITH_CYCLE_GC
	const size_t nbytes = sizeof(PyGC_Head) + basicsize;
	PyGC_Head *g = PyObject_MALLOC(nbytes);
	if (g == NULL)
		return (PyObject *)PyErr_NoMemory();
	g-&gt;gc.gc_next = NULL;
	allocated++;
 	if (allocated &gt; threshold0 &amp;&amp;
 	    enabled &amp;&amp;
 	    threshold0 &amp;&amp;
 	    !collecting &amp;&amp;
 	    !PyErr_Occurred()) {
		collecting = 1;
 		collect_generations();
		collecting = 0;
	}
	op = FROM_GC(g);
#else
	op = PyObject_MALLOC(basicsize);
	if (op == NULL)
		return (PyObject *)PyErr_NoMemory();

#endif
	return op;
}
</t>
<t tx="T49">PyObject *
_PyObject_GC_New(PyTypeObject *tp)
{
	PyObject *op = _PyObject_GC_Malloc(tp, 0);
	if (op != NULL)
		op = PyObject_INIT(op, tp);
	return op;
}
</t>
<t tx="T50">PyVarObject *
_PyObject_GC_NewVar(PyTypeObject *tp, int nitems)
{
	PyVarObject *op = (PyVarObject *) _PyObject_GC_Malloc(tp, nitems);
	if (op != NULL)
		op = PyObject_INIT_VAR(op, tp, nitems);
	return op;
}
</t>
<t tx="T51">PyVarObject *
_PyObject_GC_Resize(PyVarObject *op, int nitems)
{
	const size_t basicsize = _PyObject_VAR_SIZE(op-&gt;ob_type, nitems);
#ifdef WITH_CYCLE_GC
	PyGC_Head *g = AS_GC(op);
	g = PyObject_REALLOC(g,  sizeof(PyGC_Head) + basicsize);
	if (g == NULL)
		return (PyVarObject *)PyErr_NoMemory();
	op = (PyVarObject *) FROM_GC(g);
#else
	op = PyObject_REALLOC(op, basicsize);
	if (op == NULL)
		return (PyVarObject *)PyErr_NoMemory();
#endif
	op-&gt;ob_size = nitems;
	return op;
}
</t>
<t tx="T52">void
_PyObject_GC_Del(PyObject *op)
{
#ifdef WITH_CYCLE_GC
	PyGC_Head *g = AS_GC(op);
	if (g-&gt;gc.gc_next != NULL)
		gc_list_remove(g);
	if (allocated &gt; 0) {
		allocated--;
	}
	PyObject_FREE(g);
#else
	PyObject_FREE(op);
#endif
}
</t>
</tnodes>
</leo_file>
