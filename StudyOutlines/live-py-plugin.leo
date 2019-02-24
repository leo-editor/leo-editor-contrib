<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20190103112220.1"><vh>@path live-py-plugin/plugin/PySrc</vh>
<v t="ekr.20190103112220.2"><vh>@@clean canvas.py</vh>
<v t="ekr.20190103112220.3"><vh>class Canvas(object)</vh>
<v t="ekr.20190103112220.4"><vh>Canvas.__init__</vh></v>
<v t="ekr.20190103112220.5"><vh>Canvas.call</vh></v>
<v t="ekr.20190103112220.6"><vh>Canvas.cget</vh></v>
</v>
</v>
<v t="ekr.20190103112220.7"><vh>@@clean code_tracer.py</vh>
<v t="ekr.20190103112220.8"><vh>&lt;&lt; imports &gt;&gt;</vh></v>
<v t="ekr.20190103112220.9"><vh>&lt;&lt; data &gt;&gt;</vh></v>
<v t="ekr.20190103112220.10"><vh>class Tracer(NodeTransformer)</vh>
<v t="ekr.20190103112220.11"><vh>Tracer._set_statement_line_numbers</vh></v>
<v t="ekr.20190103112220.12"><vh>Tracer.visit</vh></v>
<v t="ekr.20190103112220.13"><vh>Tracer._get_attribute_names</vh></v>
<v t="ekr.20190103112220.14"><vh>Tracer._wrap_subscript_target</vh></v>
<v t="ekr.20190103112220.15"><vh>Tracer._wrap_assignment_index</vh></v>
<v t="ekr.20190103112220.16"><vh>Tracer._wrap_slice</vh></v>
<v t="ekr.20190103112220.17"><vh>Tracer.visit_Call</vh></v>
<v t="ekr.20190103112220.18"><vh>Tracer.visit_Delete</vh></v>
<v t="ekr.20190103112220.19"><vh>Tracer._is_untraceable_attribute</vh></v>
<v t="ekr.20190103112220.20"><vh>Tracer.visit_Assign</vh></v>
<v t="ekr.20190103112220.21"><vh>Tracer.visit_AugAssign</vh></v>
<v t="ekr.20190103112220.22"><vh>Tracer._find_line_numbers</vh></v>
<v t="ekr.20190103112220.23"><vh>Tracer.visit_For</vh></v>
<v t="ekr.20190103112220.24"><vh>Tracer.visit_While</vh></v>
<v t="ekr.20190103112220.25"><vh>Tracer.visit_FunctionDef</vh></v>
<v t="ekr.20190103112220.26"><vh>Tracer._is_module_header</vh></v>
<v t="ekr.20190103112220.27"><vh>Tracer.visit_Module</vh></v>
<v t="ekr.20190103112220.28"><vh>Tracer.visit_Lambda</vh></v>
<v t="ekr.20190103112220.29"><vh>Tracer.visit_Return</vh></v>
<v t="ekr.20190103112220.30"><vh>Tracer.visit_TryExcept</vh></v>
<v t="ekr.20190103112220.31"><vh>Tracer.visit_Try</vh></v>
<v t="ekr.20190103112220.32"><vh>Tracer.visit_Raise</vh></v>
<v t="ekr.20190103112220.33"><vh>Tracer.visit_Yield</vh></v>
<v t="ekr.20190103112220.34"><vh>Tracer.visit_YieldFrom</vh></v>
<v t="ekr.20190103112220.35"><vh>Tracer._trace_assignment_list</vh></v>
<v t="ekr.20190103112220.36"><vh>Tracer._trace_assignment</vh></v>
<v t="ekr.20190103112220.37"><vh>Tracer._wrap_assignment_target</vh></v>
<v t="ekr.20190103112220.38"><vh>Tracer._wrap_assignment_targets</vh></v>
<v t="ekr.20190103112220.39"><vh>Tracer._create_context_call</vh></v>
<v t="ekr.20190103112220.40"><vh>Tracer._create_bare_context_call</vh></v>
</v>
<v t="ekr.20190103112220.41"><vh>class LineNumberCleaner(NodeTransformer)</vh>
<v t="ekr.20190103112220.42"><vh>LineNumberCleaner.__init__</vh></v>
<v t="ekr.20190103112220.43"><vh>LineNumberCleaner.visit</vh></v>
</v>
<v t="ekr.20190103112220.44"><vh>class TracedModuleImporter</vh>
<v t="ekr.20190103112220.45"><vh>TracedModuleImporter.__init__</vh></v>
<v t="ekr.20190103112220.46"><vh>TracedModuleImporter.find_spec</vh></v>
<v t="ekr.20190103112220.47"><vh>TracedModuleImporter.exec_module</vh></v>
<v t="ekr.20190103112220.48"><vh>TracedModuleImporter.find_module</vh></v>
<v t="ekr.20190103112220.49"><vh>TracedModuleImporter.load_module</vh></v>
</v>
<v t="ekr.20190103112220.50"><vh>class PatchedModuleLoader(Loader)</vh>
<v t="ekr.20190103112220.51"><vh>PatchedModuleLoader.__init__</vh></v>
<v t="ekr.20190103112220.52"><vh>PatchedModuleLoader.exec_module</vh></v>
<v t="ekr.20190103112220.53"><vh>PatchedModuleLoader.load_module</vh></v>
<v t="ekr.20190103112220.54"><vh>PatchedModuleLoader.mock_show</vh></v>
<v t="ekr.20190103112220.55"><vh>PatchedModuleLoader.live_coding_zoom</vh></v>
</v>
<v t="ekr.20190103112220.56"><vh>swallow_output</vh></v>
<v t="ekr.20190103112220.57"><vh>class CodeTracer(object)</vh>
<v t="ekr.20190103112220.58"><vh>CodeTracer.__init__</vh></v>
<v t="ekr.20190103112220.59"><vh>CodeTracer.run_python_module</vh></v>
<v t="ekr.20190103112220.60"><vh>CodeTracer.run_python_file</vh></v>
<v t="ekr.20190103112220.61"><vh>CodeTracer.make_code_from_py</vh></v>
<v t="ekr.20190103112220.62"><vh>CodeTracer.split_lines</vh></v>
<v t="ekr.20190103112220.63"><vh>CodeTracer.trace_turtle</vh></v>
<v t="ekr.20190103112220.64"><vh>CodeTracer.report_driver_result</vh></v>
<v t="ekr.20190103112220.65"><vh>CodeTracer.trace_code</vh></v>
<v t="ekr.20190103112220.66"><vh>CodeTracer.run_code</vh></v>
</v>
<v t="ekr.20190103112220.67"><vh>class FileSwallower(object)</vh>
<v t="ekr.20190103112220.68"><vh>FileSwallower.__init__</vh></v>
<v t="ekr.20190103112220.69"><vh>FileSwallower.write</vh></v>
<v t="ekr.20190103112220.70"><vh>FileSwallower.__getattr__</vh></v>
</v>
<v t="ekr.20190103112220.71"><vh>find_string_io_targets</vh></v>
<v t="ekr.20190103112220.72"><vh>class TracedStringIO(io.StringIO)</vh>
<v t="ekr.20190103112220.73"><vh>TracedStringIO.write</vh></v>
</v>
<v t="ekr.20190103112220.74"><vh>web_main &amp; helper</vh>
<v t="ekr.20190103112220.75"><vh>display</vh></v>
</v>
<v t="ekr.20190103112220.76"><vh>main</vh>
<v t="ekr.20190104113125.1"><vh>&lt;&lt; add args &gt;&gt;</vh></v>
</v>
</v>
<v t="ekr.20190103112220.77"><vh>@@clean mock_turtle.py</vh>
<v t="ekr.20190103112220.78"><vh>Declarations</vh></v>
<v t="ekr.20190103112220.79"><vh>class MockTurtle</vh>
<v t="ekr.20190103112220.80"><vh>class _Screen(object)</vh>
<v t="ekr.20190103112220.81"><vh>_Screen.__init__</vh></v>
<v t="ekr.20190103112220.82"><vh>_Screen.window_width</vh></v>
<v t="ekr.20190103112220.83"><vh>_Screen.window_height</vh></v>
<v t="ekr.20190103112220.84"><vh>_Screen.bgcolor</vh></v>
<v t="ekr.20190103112220.85"><vh>_Screen.tracer</vh></v>
<v t="ekr.20190103112220.86"><vh>_Screen.update</vh></v>
</v>
<v t="ekr.20190103112220.87"><vh>monkey_patch</vh></v>
<v t="ekr.20190103112220.88"><vh>remove_monkey_patch</vh></v>
<v t="ekr.20190103112220.89"><vh>get_all_reports</vh></v>
<v t="ekr.20190103112220.90"><vh>display_image</vh></v>
<v t="ekr.20190103112220.91"><vh>__init__</vh></v>
<v t="ekr.20190103112220.92"><vh>__repr__</vh></v>
<v t="ekr.20190103112220.93"><vh>_goto</vh></v>
<v t="ekr.20190103112220.94"><vh>__getattr__</vh></v>
<v t="ekr.20190103112220.95"><vh>_draw_stamps</vh></v>
<v t="ekr.20190103112220.96"><vh>window_width</vh></v>
<v t="ekr.20190103112220.97"><vh>window_height</vh></v>
<v t="ekr.20190103112220.98"><vh>begin_fill</vh></v>
<v t="ekr.20190103112220.99"><vh>end_fill</vh></v>
<v t="ekr.20190103112220.100"><vh>_flush_lines</vh></v>
<v t="ekr.20190103112220.101"><vh>fill</vh></v>
<v t="ekr.20190103112220.102"><vh>stamp</vh></v>
<v t="ekr.20190103112220.103"><vh>write</vh></v>
<v t="ekr.20190103112220.104"><vh>_update</vh></v>
<v t="ekr.20190103112220.105"><vh>_colorstr</vh></v>
<v t="ekr.20190103112220.106"><vh>_rgb_value</vh></v>
<v t="ekr.20190103112220.107"><vh>_color</vh></v>
</v>
</v>
<v t="ekr.20190103112220.108"><vh>@@clean report_builder.py</vh>
<v t="ekr.20190103112220.109"><vh>Declarations</vh></v>
<v t="ekr.20190103112220.110"><vh>class ReportBuilder(object)</vh>
<v t="ekr.20190103112220.111"><vh>ReportBuilder.__init__</vh></v>
<v t="ekr.20190103112220.112"><vh>ReportBuilder.start_block</vh></v>
<v t="ekr.20190103112220.113"><vh>ReportBuilder._update_frame_width</vh></v>
<v t="ekr.20190103112220.114"><vh>ReportBuilder.start_frame</vh></v>
<v t="ekr.20190103112220.115"><vh>ReportBuilder._increment_message_count</vh></v>
<v t="ekr.20190103112220.116"><vh>ReportBuilder.add_message</vh></v>
<v t="ekr.20190103112220.117"><vh>ReportBuilder.check_output</vh></v>
<v t="ekr.20190103112220.118"><vh>ReportBuilder.add_output</vh></v>
<v t="ekr.20190103112220.119"><vh>ReportBuilder.add_extra_message</vh></v>
<v t="ekr.20190103112220.120"><vh>ReportBuilder.get_repr</vh></v>
<v t="ekr.20190103112220.121"><vh>ReportBuilder.assign</vh></v>
<v t="ekr.20190103112220.122"><vh>ReportBuilder.start_assignment</vh></v>
<v t="ekr.20190103112220.123"><vh>ReportBuilder.end_assignment</vh></v>
<v t="ekr.20190103112220.124"><vh>ReportBuilder.set_assignment_value</vh></v>
<v t="ekr.20190103112220.125"><vh>ReportBuilder.add_assignment_index</vh></v>
<v t="ekr.20190103112220.126"><vh>ReportBuilder.get_assignment_index</vh></v>
<v t="ekr.20190103112220.127"><vh>ReportBuilder.report_assignment</vh></v>
<v t="ekr.20190103112220.128"><vh>ReportBuilder.report_lambda</vh></v>
<v t="ekr.20190103112220.129"><vh>ReportBuilder.exception</vh></v>
<v t="ekr.20190103112220.130"><vh>ReportBuilder.return_value</vh></v>
<v t="ekr.20190103112220.131"><vh>ReportBuilder.yield_value</vh></v>
<v t="ekr.20190103112220.132"><vh>ReportBuilder.yield_from</vh></v>
<v t="ekr.20190103112220.133"><vh>ReportBuilder.record_call</vh></v>
<v t="ekr.20190103112220.134"><vh>ReportBuilder.record_delete</vh></v>
<v t="ekr.20190103112220.135"><vh>ReportBuilder.report</vh></v>
<v t="ekr.20190103112220.136"><vh>ReportBuilder._check_line_count</vh></v>
<v t="ekr.20190103112220.137"><vh>ReportBuilder.count_all_messages</vh></v>
</v>
<v t="ekr.20190103112220.138"><vh>class DeletionTarget(object)</vh>
<v t="ekr.20190103112220.139"><vh>DeletionTarget.__init__</vh></v>
<v t="ekr.20190103112220.140"><vh>DeletionTarget.__delitem__</vh></v>
<v t="ekr.20190103112220.141"><vh>DeletionTarget.__delattr__</vh></v>
</v>
<v t="ekr.20190103112220.142"><vh>class AssignmentReport(object)</vh>
<v t="ekr.20190103112220.143"><vh>AssignmentReport.__init__</vh></v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20190103112220.1"></t>
<t tx="ekr.20190103112220.10">class Tracer(NodeTransformer):

    @others
</t>
<t tx="ekr.20190103112220.100">def _flush_lines(self):
    for args, kwargs in self._lines_to_draw:
        self.screen.cv.create_line(*args, **kwargs)

    self._lines_to_draw = []

</t>
<t tx="ekr.20190103112220.101">def fill(self, flag=None):
    if flag is None:
        return self._path is not None
    if self._path and len(self._path) &gt; 2:
        self.screen.cv.create_polygon(*self._path,
                                      fill=self._fillcolor,
                                      outline='')
    self._flush_lines()
    if not flag:
        self._path = None
    else:
        x, y = self._position
        self._path = [x + self.__xoff, -y + self.__yoff]

</t>
<t tx="ekr.20190103112220.102">def stamp(self):
    self.stamps.append(
        MockTurtle._Stamp(self.pos(), self.heading(), self.color()))

</t>
<t tx="ekr.20190103112220.103">def write(self,
          arg,
          move=False,
          align="left",
          font=("Arial", 8, "normal")):
    if move:
        raise NotImplementedError('move parameter is not supported.')
    if align == 'left':
        anchor = 'sw'
    elif align == 'center':
        anchor = 's'
    elif align == 'right':
        anchor = 'se'
    kwargs = dict(text=str(arg),
                  anchor=anchor,
                  font=font)
    if self._pencolor:
        kwargs['fill'] = self._pencolor
    self.screen.cv.create_text(self.xcor() + self.__xoff,
                               -self.ycor() + self.__yoff,
                               **kwargs)

</t>
<t tx="ekr.20190103112220.104">def _update(self, *args, **kwargs):
    if not self._pencolor.startswith('#'):
        self._pencolor = self._colorstr(self._pencolor)
    if not self._fillcolor.startswith('#'):
        self._fillcolor = self._colorstr(self._fillcolor)
    return super(MockTurtle, self)._update(*args, **kwargs)

</t>
<t tx="ekr.20190103112220.105">def _colorstr(self, color):
    """Return color string corresponding to args.

    Argument may be a string or a tuple of three
    numbers corresponding to actual colormode,
    i.e. in the range 0&lt;=n&lt;=colormode.

    If the argument doesn't represent a color,
    just uses black.
    """
    if len(color) == 1:
        color = color[0]
    if isinstance(color, str):
        return color_map.get(color.lower(), color)
    try:
        r, g, b = color
    except ValueError:
        return '#000000'
    r, g, b = [round(255.0*x) for x in (r, g, b)]
    if not ((0 &lt;= r &lt;= 255) and (0 &lt;= g &lt;= 255) and (0 &lt;= b &lt;= 255)):
        return '#000000'
    return "#%02x%02x%02x" % (r, g, b)

</t>
<t tx="ekr.20190103112220.106">def _rgb_value(self, rgbstr):
    return round(int(rgbstr, 16)/2.55)/100.0

</t>
<t tx="ekr.20190103112220.107">def _color(self, colorstr):
    """ Reverse lookup of _colorstr. """
    if not colorstr.startswith('#'):
        return colorstr
    itercolors = getattr(color_map, 'iteritems', color_map.items)
    for name, code in itercolors():
        if code == colorstr:
            return name
    return tuple(self._rgb_value(colorstr[2*i+1:2*i+3]) for i in range(3))


\\-4.# Normally, Tkinter will look up these colour names for you, but we don't
\\-4.# actually launch Tkinter when we're analysing code.
</t>
<t tx="ekr.20190103112220.108">@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20190103112220.109">import re

import sys
import traceback
try:
    from unittest.mock import Mock
except ImportError:
    Mock = None
try:
    from enum import Enum
except ImportError:
    Enum = None


</t>
<t tx="ekr.20190103112220.11">def _set_statement_line_numbers(self, statements, previous_line_number=None):
    """ Make sure that a series of statements have line numbers in order.
    previous_line_number is the line number to start with, or None."""
    for statement in statements:
        line_number = getattr(statement, 'lineno', None)
        if (
            line_number is None and statement is not None and
            previous_line_number is not None
        ):
            statement.lineno = previous_line_number
        else:
            line_numbers = set()
            self._find_line_numbers(statement, line_numbers)
            previous_line_number = max(line_numbers)
</t>
<t tx="ekr.20190103112220.110">class ReportBuilder(object):
    @others
</t>
<t tx="ekr.20190103112220.111">def __init__(self, message_limit=None):
    self.messages = []
    self.assignments = []
    self.message_count = 0
    self.message_limit = message_limit
    self.stack_block = None  # (first_line, last_line) numbers, not indexes
    self.history = []  # all stack frames that need to be combined
    self.line_widths = {}
    self.max_width = None
    self.frame_width = 0
    self.is_muted = False
    self.current_output = ''
    self.current_output_line = None
    self.current_output_target_name = None
    self.has_print_function = True
    self.current_exception = None

</t>
<t tx="ekr.20190103112220.112">def start_block(self, first_line, last_line):
    """ Cap all the lines from first_line to last_line inclusive with
    pipes if they need it. They don't need it if they are all empty, or
    if they all end in pipes. first_line and last_line are line numbers,
    not indexes.
    Return the maximum width of all the lines.
    """
    self._check_line_count(last_line)
    self.check_output()
    line_indexes = range(first_line-1, last_line)
    max_width = 0
    all_end_in_pipes = True
    for line_index in line_indexes:
        message = self.messages[line_index]
        max_width = max(len(message), max_width)
        all_end_in_pipes = all_end_in_pipes and message.endswith('| ')
    if max_width and not all_end_in_pipes:
        for line_index in line_indexes:
            message = self.messages[line_index]
            self.messages[line_index] = message.ljust(max_width) + '| '
            self._update_frame_width(max_width + 2, line_index+1)
    else:
        self._increment_message_count()
    return max_width

</t>
<t tx="ekr.20190103112220.113">def _update_frame_width(self, new_width, line_number):
    if not self.max_width:
        # no limit.
        return
    if new_width &gt; self.frame_width or not self.stack_block:
        should_throw = False
        if not self.stack_block:
            self.line_widths[line_number-1] = new_width
            should_throw = new_width &gt; self.max_width
        else:
            first_line, last_line = self.stack_block
            for line_index in range(first_line - 1, last_line):
                line_width = (
                    self.line_widths.get(line_index, 0) +
                    new_width -
                    self.frame_width)
                if line_width &gt; self.max_width:
                    should_throw = True
                self.line_widths[line_index] = line_width
            self.frame_width = new_width
        if should_throw:
            raise RuntimeError('live coding message limit exceeded')
</t>
<t tx="ekr.20190103112220.114">def start_frame(self, first_line, last_line):
    """ Start a new stack frame to support recursive calls.

    This allows extra messages to be added to a stack frame after a
    recursive call finishes.
    :param int first_line: the first line of the function that the frame is
    running.
    :param int last_line: the last line of the function that the frame is
    running.
    """
    if self.is_muted:
        return self
    for frame in self.history:
        if frame.is_muted:
            return frame
    new_frame = ReportBuilder(self.message_limit)
    new_frame.stack_block = (first_line, last_line)
    new_frame.line_widths = self.line_widths
    new_frame.max_width = self.max_width
    self.history.append(new_frame)
    return new_frame
</t>
<t tx="ekr.20190103112220.115">def _increment_message_count(self):
    if (
        self.message_limit is not None and
        self.message_count &gt;= self.message_limit
    ):
        raise RuntimeError('live coding message limit exceeded')
    self.message_count += 1
</t>
<t tx="ekr.20190103112220.116">def add_message(self, message, line_number):
    """ Add a message to the report on line line_number (1-based). """
    self._increment_message_count()
    if self.is_muted:
        return
    if '\n' in message:
        message = re.sub(r'\s+', ' ', message)
    self.check_output()
    self._check_line_count(line_number)
    new_width = len(self.messages[line_number - 1]) + len(message)
    self._update_frame_width(new_width, line_number)
    self.messages[line_number - 1] += message

</t>
<t tx="ekr.20190103112220.117">def check_output(self):
    if self.current_output:
        if (self.current_output_target_name is None and
                self.current_output.endswith('\n')):
            self.current_output = self.current_output[:-1]
            template = 'print({}) ' if self.has_print_function else 'print {} '
        else:
            target_name = self.current_output_target_name or 'sys.stdout'
            template = target_name + '.write({}) '
        print_message = template.format(self.get_repr(self.current_output))
        self.current_output = ''
        print_line = self.current_output_line
        self.current_output_line = None
        self.add_message(print_message, print_line)
</t>
<t tx="ekr.20190103112220.118">def add_output(self, text, line_number, has_print_function=True, target_name=None):
    if (line_number != self.current_output_line or
            target_name != self.current_output_target_name):
        self.check_output()
    self.current_output += text
    self.current_output_line = line_number
    self.current_output_target_name = target_name
    self.has_print_function = has_print_function
</t>
<t tx="ekr.20190103112220.119">def add_extra_message(self, message, line_number):
    """ Add an extra message to the last frame after the code has finished
    running. """
    target = self.history[-1] if self.history else self
    target.max_width = self.max_width
    target.add_message(message, line_number)
</t>
<t tx="ekr.20190103112220.12">def visit(self, node):
    new_node = super(Tracer, self).visit(node)
    body = getattr(new_node, 'body', None)
    if body is not None:
        previous_line_number = getattr(new_node, 'lineno', None)
        try:
            statements = iter(body)
        except TypeError:
            # body doesn't contain statements
            statements = []
        self._set_statement_line_numbers(statements, previous_line_number)
    return new_node

</t>
<t tx="ekr.20190103112220.120">def get_repr(self, value):
    """ Get the representation of an object without reporting the call. """
    if self.is_muted:
        return ''
    start_count = self.message_count
    self.is_muted = True
    try:
        repr_text = repr(value)
    finally:
        self.is_muted = False
        self.message_count = start_count
    max_width = 80
    if len(repr_text) &gt; max_width:
        half_width = max_width//2 - 5
        full_width = half_width * 2
        repr_text = "{}[{} chars]{}".format(
            repr_text[:half_width],
            len(repr_text) - full_width,
            repr_text[-half_width:])
    return repr_text

</t>
<t tx="ekr.20190103112220.121">def assign(self, name, value, line_number):
    """ Convenience method for simple assignments.

    Just wraps all the separate steps for a flexible assignment. """

    self.start_assignment()
    try:
        self.set_assignment_value(value)
        self.report_assignment('{} = {{}}'.format(name), line_number=line_number)
    finally:
        self.end_assignment()
    return value
</t>
<t tx="ekr.20190103112220.122">def start_assignment(self):
    self.assignments.append(AssignmentReport())
</t>
<t tx="ekr.20190103112220.123">def end_assignment(self):
    self.assignments.pop()
</t>
<t tx="ekr.20190103112220.124">def set_assignment_value(self, value):
    self.assignments[-1].value = value
    return value
</t>
<t tx="ekr.20190103112220.125">def add_assignment_index(self, value):
    self.assignments[-1].indexes.append(value)
    return value
</t>
<t tx="ekr.20190103112220.126">def get_assignment_index(self, index_index):
    return self.assignments[-1].indexes[index_index]
</t>
<t tx="ekr.20190103112220.127">def report_assignment(self, format_string, line_number):
    assignment = self.assignments[-1]
    # noinspection PyBroadException
    try:
        if Mock is not None and isinstance(assignment.value, Mock):
            # noinspection PyProtectedMember
            mock_name = assignment.value._mock_name
            args = '' if mock_name is None else 'name={!r}'.format(mock_name)
            value_repr = '{}({})'.format(
                assignment.value.__class__.__name__,
                args)
        else:
            value_repr = self.get_repr(assignment.value)
        display = format_string.format(*(assignment.indexes + [value_repr]))
        if Enum is not None and isinstance(assignment.value, Enum):
            # Leave the representation of enums alone.
            pass
        elif display.endswith('&gt;'):
            display = None
    except Exception:
        display = None
    if display is not None:
        self.start_block(line_number, line_number)
        self.add_message(display + ' ', line_number)
</t>
<t tx="ekr.20190103112220.128">def report_lambda(self, first_line, last_line, *args):
    """ Report lambda parameters and result, and return result.

    :param first_line: where to display the message
    :param last_line: range for the block markers
    :param args: parameter values, followed by the result.
    """
    params = ', '.join(self.get_repr(arg) for arg in args[:-1])
    result = args[-1]
    self.start_block(first_line, last_line)
    self.add_message('({} =&gt; {}) '.format(params, self.get_repr(result)), first_line)
    return result
</t>
<t tx="ekr.20190103112220.129">def exception(self, line_number=None):
    etype, value, tb = sys.exc_info()
    messages = traceback.format_exception_only(etype, value)
    message = messages[-1].strip() + ' '
    if line_number is None:
        if value is self.current_exception:
            return
        self.current_exception = value
        entries = traceback.extract_tb(tb)
        if entries:
            _, line_number, _, _ = entries[0]
    if line_number is not None:
        old_limit, self.message_limit = self.message_limit, None
        old_width, self.max_width = self.max_width, None
        try:
            self.add_message(message, line_number)
        finally:
            self.message_limit = old_limit
            self.max_width = old_width
</t>
<t tx="ekr.20190103112220.13">@staticmethod
def _get_attribute_names(attribute_node):
    names = []
    while isinstance(attribute_node, Attribute):
        names.insert(0, attribute_node.attr)
        attribute_node = attribute_node.value
    if not names:
        return None
    names.insert(0, getattr(attribute_node, 'id', '&lt;?&gt;'))
    return names

</t>
<t tx="ekr.20190103112220.130">def return_value(self, value, line_number):
    self.add_message('return %s ' % self.get_repr(value), line_number)
    return value
</t>
<t tx="ekr.20190103112220.131">def yield_value(self, value, line_number):
    display = self.get_repr(value)
    self.add_message('yield %s ' % display, line_number)
    return value
</t>
<t tx="ekr.20190103112220.132">def yield_from(self, values, line_number):
    for value in values:
        self.start_block(line_number, line_number)
        yield self.yield_value(value, line_number)
</t>
<t tx="ekr.20190103112220.133">def record_call(self,
    names,
    displays_before,
    result,
    displays_after,
    line_number,
):
    zipped = zip(names, displays_before, displays_after)
    for name, display_before, display_after in zipped:
        if display_before != display_after:
            self.add_message('%s = %s ' % (name, display_after), line_number)
    return result
</t>
<t tx="ekr.20190103112220.134">def record_delete(self, name, target, line_number):
    return DeletionTarget(name, target, line_number, self)
</t>
<t tx="ekr.20190103112220.135">def report(self, total_lines=0):
    self.check_output()
    self.max_width = None
    self.message_limit = None
    for frame in self.history:
        frame.check_output()
        first_line, last_line = frame.stack_block
        self.start_block(first_line, last_line)
        for i in range(len(frame.messages)):
            message = frame.messages[i]
            if message:
                line_number = i+1
                self.add_message(message, line_number)
    self.history = []
    self._check_line_count(total_lines)
    return '\n'.join(self.messages)
</t>
<t tx="ekr.20190103112220.136">def _check_line_count(self, line_count):
    while len(self.messages) &lt; line_count:
        self.messages.append('')
</t>
<t tx="ekr.20190103112220.137">def count_all_messages(self):
    history_count = sum(frame.message_count for frame in self.history)
    return self.message_count + history_count
</t>
<t tx="ekr.20190103112220.138">class DeletionTarget(object):
    @others
</t>
<t tx="ekr.20190103112220.139">def __init__(self, name, target, line_number, report_builder):
    self.name = name
    self.target = target
    self.line_number = line_number
    self.report_builder = report_builder

</t>
<t tx="ekr.20190103112220.14">def _wrap_subscript_target(self, subscript, index_to_get=None):
    """ Build string describing subscript target and wrap indexes.

    For example, "x[{!r}]" for one index. Each index will be wrapped in a
    call to context.add_assignment_index() or
    context.get_assignment_index().
    @param index_to_get: if this is None, wrap in add_assignment_index(),
        otherwise, wrap in get_assignment_index(index_to_get).
    @return: string, or None if no assignment can be reported.
    """
    slice_text, next_index = self._wrap_slice(subscript.slice, index_to_get)
    value = subscript.value
    if isinstance(value, Name):
        value_text = value.id
    elif isinstance(value, Subscript):
        value_text = self._wrap_subscript_target(value, index_to_get=next_index)
    elif isinstance(value, Attribute):
        value_text = '.'.join(self._get_attribute_names(value))
    else:
        value_text = None
    if value_text is None:
        format_text = None
    else:
        format_text = '{}[{}]'.format(value_text, slice_text)
    return format_text

</t>
<t tx="ekr.20190103112220.140">def __delitem__(self, key):
    before = self.report_builder.get_repr(self.target)
    del self.target[key]
    after = self.report_builder.get_repr(self.target)
    if before != after:
        self.report_builder.assign(self.name, self.target, self.line_number)

</t>
<t tx="ekr.20190103112220.141">def __delattr__(self, key):
    before = self.report_builder.get_repr(self.target)
    self.target.__delattr__(key)
    after = self.report_builder.get_repr(self.target)
    if before != after:
        self.report_builder.assign(self.name, self.target, self.line_number)


</t>
<t tx="ekr.20190103112220.142">class AssignmentReport(object):
    @others
</t>
<t tx="ekr.20190103112220.143">def __init__(self):
    self.value = None
    self.indexes = []
</t>
<t tx="ekr.20190103112220.15">def _wrap_assignment_index(self, index_node, index_to_get):
    """ Wrap an index node in an assignment index method.

    @param index_node: the node to read when setting the index.
    @param index_to_get: None when setting the index, or an integer when
        getting the index.
    @return: the wrapped node
    """
    if index_to_get is None:
        return self._create_bare_context_call(
            'add_assignment_index', [index_node])
    return self._create_bare_context_call(
        'get_assignment_index', [Num(n=index_to_get)])
</t>
<t tx="ekr.20190103112220.16">def _wrap_slice(self, sliceNode, index_to_get=None):
    """ Wrap a slice in calls to assignment index methods.

    Also build a format string for the slice.
    @param index_to_get: if this is None, wrap in add_assignment_index(),
        otherwise, wrap in get_assignment_index(index_to_get).
    @return: format_text, next_index_to_get
    """
    if isinstance(sliceNode, (Index, Ellipsis)):
        if (
            isinstance(sliceNode, Ellipsis) or
            isinstance(sliceNode.value, Ellipsis)
        ):
            index_to_get = None
            format_text = '...'
        else:
            sliceNode.value = self._wrap_assignment_index(sliceNode.value, index_to_get)
            format_text = '{!r}'
            if index_to_get is not None:
                index_to_get -= 1
    elif isinstance(sliceNode, Slice):
        index_to_get = None
        if sliceNode.step is None:
            step_text = ''
        else:
            step_text = ':{!r}'
            sliceNode.step = self._wrap_assignment_index(sliceNode.step, index_to_get)
        if sliceNode.upper is None:
            upper_text = ''
        else:
            upper_text = '{!r}'
            sliceNode.upper = self._wrap_assignment_index(sliceNode.upper, index_to_get)
        if sliceNode.lower is None:
            lower_text = ''
        else:
            lower_text = '{!r}'
            sliceNode.lower = self._wrap_assignment_index(sliceNode.lower, index_to_get)
        format_text = '{}:{}{}'.format(lower_text, upper_text, step_text)
    else:
        assert isinstance(sliceNode, ExtSlice)
        index_to_get = None
        format_text = ', '.join(self._wrap_slice(subslice)[0]
            for subslice in sliceNode.dims)
    return format_text, index_to_get
</t>
<t tx="ekr.20190103112220.17">def visit_Call(self, node):
    existing_node = self.generic_visit(node)
    func_node = existing_node.func
    if self._is_untraceable_attribute(func_node):
        return existing_node
    comparisons = []  # [(name, node)]
    names = self._get_attribute_names(func_node)
    if names is not None:
        comparisons.append(('.'.join(names[:-1]), existing_node.func.value))
    for arg_node in existing_node.args:
        if isinstance(arg_node, Name):
            comparisons.append((arg_node.id, arg_node))
    if not comparisons:
        return existing_node
    args = [
        List(elts=[], ctx=Load()),
        List(elts=[], ctx=Load()),
        existing_node,
        List(elts=[], ctx=Load()),
        Num(n=existing_node.lineno),
    ]
    for name, node in comparisons:
        args[0].elts.append(Str(s=name))  # name
        args[1].elts.append(  # repr() before
            self._create_bare_context_call('get_repr', [node]))
        args[3].elts.append(  # repr() after
            self._create_bare_context_call('get_repr', [node]))
    new_node = self._create_bare_context_call('record_call', args)
    return new_node

</t>
<t tx="ekr.20190103112220.18">def visit_Delete(self, node):
    existing_node = self.generic_visit(node)
    for target in existing_node.targets:
        attribute_names = self._get_attribute_names(target)
        if attribute_names:
            target_name = '.'.join(attribute_names[:-1])
        else:
            target_value = getattr(target, 'value', None)
            attribute_names = self._get_attribute_names(target_value)
            if attribute_names:
                target_name = '.'.join(attribute_names)
            else:
                target_name = getattr(target_value, 'id', None)
        if target_name is not None:
            args = [Str(s=target_name), target.value, Num(n=target.lineno)]
            target.value = self._create_bare_context_call('record_delete', args)
    return existing_node
</t>
<t tx="ekr.20190103112220.19">def _is_untraceable_attribute(self, node):
    if isinstance(node, Attribute):
        if isinstance(node.value, Name):
            return False
        if isinstance(node.value, Attribute):
            return self._is_untraceable_attribute(node.value)
        return True
    return False
</t>
<t tx="ekr.20190103112220.2">@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20190103112220.20">def visit_Assign(self, node):
    existing_node = self.generic_visit(node)
    if any(map(self._is_untraceable_attribute, existing_node.targets)):
        return existing_node
    line_numbers = set()
    self._find_line_numbers(existing_node, line_numbers)
    first_line_number = min(line_numbers)
    last_line_number = max(line_numbers)
    new_nodes = []
    format_string = self._wrap_assignment_targets(
        existing_node.targets)
    if (len(existing_node.targets) == 1 and
            isinstance(existing_node.targets[0], Tuple)):
        existing_node.value = Call(
            func=Name(id='tuple', ctx=Load()),
           args=[existing_node.value],
           keywords=[],
           starargs=None,
           kwargs=None,
        )
    existing_node.value = self._create_bare_context_call(
        'set_assignment_value',
        [existing_node.value])
    new_nodes.append(self._create_context_call('start_assignment'))
    try_body = [existing_node]
    if format_string is not None:
        try_body.append(self._create_context_call(
            'report_assignment',
            [Str(s=format_string), Num(n=existing_node.lineno)]))
    end_assignment = self._create_context_call('end_assignment')
    finally_body = [end_assignment]
    new_nodes.append(TryFinally(
        body=try_body,
        finalbody=finally_body,
        handlers=[],
        orelse=[],
        lineno=first_line_number))
    self._set_statement_line_numbers(try_body, first_line_number)
    self._set_statement_line_numbers(finally_body, last_line_number)
    return new_nodes

</t>
<t tx="ekr.20190103112220.21">def visit_AugAssign(self, node):
    read_target = deepcopy(node.target)
    existing_node = self.generic_visit(node)
    line_numbers = set()
    self._find_line_numbers(existing_node, line_numbers)
    first_line_number = min(line_numbers)
    last_line_number = max(line_numbers)
    new_nodes = []
    try_body = [existing_node]
    new_nodes.append(self._create_context_call('start_assignment'))
    format_string = self._wrap_assignment_target(existing_node.target)
    if format_string is not None:
        if ':' in format_string:
            existing_node.value = self._create_bare_context_call(
                'set_assignment_value',
                [existing_node.value])
            operator_char = OPERATOR_CHARS.get(type(existing_node.op), '?')
            format_string += ' {}= {{}} '.format(operator_char)
        else:
            self._wrap_assignment_target(read_target, index_to_get=-1)
            read_target.ctx = Load()
            set_assignment_value = self._create_context_call(
                'set_assignment_value',
                [read_target])
            try_body.append(set_assignment_value)
            format_string += ' = {}'
        try_body.append(self._create_context_call(
            'report_assignment',
            [Str(s=format_string), Num(n=existing_node.lineno)]))
    end_assignment = self._create_context_call('end_assignment')
    finally_body = [end_assignment]
    new_nodes.append(TryFinally(
        body=try_body,
        finalbody=finally_body,
        handlers=[],
        orelse=[],
        lineno=first_line_number))
    self._set_statement_line_numbers(try_body, first_line_number)
    self._set_statement_line_numbers(finally_body, last_line_number)
    return new_nodes

</t>
<t tx="ekr.20190103112220.22">def _find_line_numbers(self, node, line_numbers):
    """ Populates a set containing all line numbers used by the node and its
    descendants.

    line_numbers is a set that all the line numbers will be added to."""
    if FormattedValue is not None and isinstance(node, FormattedValue):
        # FormattedValue is a separate code block with its own line nums.
        return
    line_number = getattr(node, 'lineno', None)
    if line_number is not None:
        line_numbers.add(line_number)
    for _, value in iter_fields(node):
        if isinstance(value, list):
            for item in value:
                if isinstance(item, AST):
                    self._find_line_numbers(item, line_numbers)
        elif isinstance(value, AST):
            self._find_line_numbers(value, line_numbers)

</t>
<t tx="ekr.20190103112220.23">def visit_For(self, node):
    new_node = self.generic_visit(node)

    # Collect line numbers from all except else block.
    line_numbers = set()
    self._find_line_numbers(new_node.target, line_numbers)
    self._find_line_numbers(new_node.iter, line_numbers)
    for statement in new_node.body:
        self._find_line_numbers(statement, line_numbers)
    line_numbers.add(new_node.lineno)
    args = [Num(n=min(line_numbers)), Num(n=max(line_numbers))]
    new_body = [self._create_context_call('start_block', args)]
    new_body.extend(self._trace_assignment_list(new_node.target))
    new_body.extend(new_node.body)
    new_node.body = new_body
    return new_node
</t>
<t tx="ekr.20190103112220.24">def visit_While(self, node):
    new_node = self.generic_visit(node)

    # Collect line numbers from all except else block.
    line_numbers = set()
    self._find_line_numbers(new_node.test, line_numbers)
    for statement in new_node.body:
        self._find_line_numbers(statement, line_numbers)
    line_numbers.add(new_node.lineno)
    args = [Num(n=min(line_numbers)), Num(n=max(line_numbers))]
    new_node.body.insert(0, self._create_context_call('start_block', args))
    return new_node

</t>
<t tx="ekr.20190103112220.25"># noinspection PyTypeChecker

def visit_FunctionDef(self, node):
    """ Instrument a function definition by creating a new report builder
    for this stack frame and putting it in a local variable. The local
    variable has the same name as the global variable so all calls can
    use the same CONTEXT_NAME symbol, but it means that I had to use this:
    x = globals()['x'].start_frame()
    Kind of ugly, but I think it was worth it to handle recursive calls.
    """
    new_node = self.generic_visit(node)
    line_numbers = set()
    self._find_line_numbers(new_node, line_numbers)
    first_line_number = min(line_numbers)
    last_line_number = max(line_numbers)
    args = [Num(n=first_line_number), Num(n=last_line_number)]
    try_body = new_node.body
    globals_call = Call(
        func=Name(id='globals', ctx=Load()),
        args=[],
        keywords=[],
        starargs=None,
        kwargs=None)
    global_context = Subscript(
        value=globals_call,
        slice=Index(value=Str(s=CONTEXT_NAME)),
        ctx=Load())
    start_frame_call = Call(
        func=Attribute(value=global_context, attr='start_frame', ctx=Load()),
        args=args,
        keywords=[],
        starargs=None,
        kwargs=None)
    context_assign = Assign(
        targets=[Name(id=CONTEXT_NAME, ctx=Store())],
        value=start_frame_call)
    new_node.body = [context_assign]
    if isinstance(try_body[0], Expr) and isinstance(try_body[0].value, Str):
        # Move docstring back to top of function.
        # noinspection PyUnresolvedReferences
        new_node.body.insert(0, try_body.pop(0))
    # trace function parameter values
    for target in new_node.args.args:
        if isinstance(target, Name) and target.id == 'self':
            continue
        if arg and isinstance(target, arg) and target.arg == 'self':
            continue
        new_node.body.append(self._trace_assignment(target, node.lineno))
    if new_node.args.vararg is not None:
        new_node.body.append(
            self._trace_assignment(new_node.args.vararg, node.lineno))
    if new_node.args.kwarg is not None:
        new_node.body.append(
            self._trace_assignment(new_node.args.kwarg, node.lineno))
    if try_body:
        handler_body = [self._create_context_call('exception'), Raise()]
        new_node.body.append(TryExcept(
            body=try_body,
            handlers=[ExceptHandler(body=handler_body)],
            orelse=[],
            finalbody=[]))
        self._set_statement_line_numbers(try_body, first_line_number)
        self._set_statement_line_numbers(handler_body, last_line_number)
    return new_node
</t>
<t tx="ekr.20190103112220.26">@staticmethod
def _is_module_header(statement):
    if isinstance(statement, ImportFrom):
        return statement.module == '__future__'
    if isinstance(statement, Expr):
        return isinstance(statement.value, Str)
    return False
</t>
<t tx="ekr.20190103112220.27">def visit_Module(self, node):
    new_node = self.generic_visit(node)
    line_numbers = set()
    new_body = []
    try_body = new_node.body
    if try_body:
        while try_body and self._is_module_header(try_body[0]):
            # noinspection PyUnresolvedReferences
            new_body.append(try_body.pop(0))
        self._find_line_numbers(new_node, line_numbers)
    if line_numbers:
        first_line_number = min(line_numbers)
        last_line_number = max(line_numbers)
        handler_body = [self._create_context_call('exception'), Raise()]
        handler = ExceptHandler(body=handler_body, lineno=last_line_number)
        new_body.append(TryExcept(
            body=try_body, handlers=[handler], orelse=[], finalbody=[]))
        new_node.body = new_body
        self._set_statement_line_numbers(try_body, first_line_number)
        self._set_statement_line_numbers(handler_body, last_line_number)
    return new_node

</t>
<t tx="ekr.20190103112220.28"># noinspection PyPep8Naming

def visit_Lambda(self, node):
    new_node = self.generic_visit(node)

    line_numbers = set()
    self._find_line_numbers(new_node, line_numbers)
    arg_names = (
        getattr(old_arg, 'id', getattr(old_arg, 'arg', None))
            for old_arg in new_node.args.args
    )
    new_args = [Num(n=min(line_numbers)), Num(n=max(line_numbers))]
    new_args.extend(Name(id=name, ctx=Load()) for name in arg_names)
    new_args.append(new_node.body)
    new_node.body = self._create_bare_context_call('report_lambda', new_args)
    return new_node
</t>
<t tx="ekr.20190103112220.29"># noinspection PyPep8Naming
def visit_Return(self, node):
    existing_node = self.generic_visit(node)
    value = existing_node.value
    if value is None:
        return existing_node
    return [
        Assign(targets=[Name(id=RESULT_NAME, ctx=Store())], value=value),
        self._create_context_call('return_value',
            [Name(id=RESULT_NAME, ctx=Load()), Num(n=existing_node.lineno)]),
        Return(value=Name(id=RESULT_NAME, ctx=Load()))]
</t>
<t tx="ekr.20190103112220.3">class Canvas(object):
    @others
</t>
<t tx="ekr.20190103112220.30">def visit_TryExcept(self, node):
    existing_node = self.generic_visit(node)
    for handler in existing_node.handlers:
        handler_name = getattr(handler.name, 'id', handler.name)
        if handler_name is not None:
            handler.body.insert(0, self._create_context_call('assign', [
                Str(s=handler_name),
                Name(id=handler_name, ctx=Load()),
                Num(n=handler.lineno)
            ]))
        handler.body.insert(0, self._create_context_call('exception'))
    return existing_node
</t>
<t tx="ekr.20190103112220.31">def visit_Try(self, node):
    # Python 3.3 renamed TryExcept and TryFinally to Try
    return self.visit_TryExcept(node)
</t>
<t tx="ekr.20190103112220.32">def visit_Raise(self, node):
    existing_node = self.generic_visit(node)
    new_nodes = [existing_node]
    node_exc = getattr(node, 'type', None)
    node_exc = getattr(node, 'exc', node_exc)
    if node_exc is None:
        # Reraising the current exception, so we have to report this line.
        new_nodes.insert(0, self._create_context_call(
            'exception', [Num(n=existing_node.lineno)]))
    return new_nodes
</t>
<t tx="ekr.20190103112220.33">def visit_Yield(self, node):
    existing_node = self.generic_visit(node)
    value = existing_node.value
    if value is None:
        value = Name(id='None', ctx=Load())
    return Yield(value=self._create_bare_context_call('yield_value',
        [value, Num(n=existing_node.lineno)]))
</t>
<t tx="ekr.20190103112220.34">def visit_YieldFrom(self, node):
    existing_node = self.generic_visit(node)
    value = existing_node.value
    existing_node.value = self._create_bare_context_call('yield_from',
        [value, Num(n=existing_node.lineno)])
    return existing_node
</t>
<t tx="ekr.20190103112220.35">def _trace_assignment_list(self, targets):
    """ Build a list of assignment calls based on the contents of targets.
    If targets is a single name, then return a list with one call.
    If targets is a Tuple or a List, then make recursive calls for each
    item, combine the results into a list, and return it."""

    new_nodes = []
    # Tuple and List hold their contents in elts.
    todo = getattr(targets, 'elts', targets)
    try:
        todo = list(todo)
    except TypeError:
        # wasn't iterable, treat it as a single item
        trace = self._trace_assignment(targets)
        if trace:
            new_nodes.append(trace)
        return new_nodes
    for target in todo:
        new_nodes.extend(self._trace_assignment_list(target))
    return new_nodes
</t>
<t tx="ekr.20190103112220.36">def _trace_assignment(self, target, default_lineno=None):
    lineno = getattr(target, 'lineno', default_lineno)
    # name, value, line number
    if isinstance(target, Name):
        arg_name = target.id
    elif arg and isinstance(target, arg):
        arg_name = target.arg
    else:
        assert_message = 'Target type was {}.'.format(type(target))
        assert isinstance(target, str), assert_message
        arg_name = target
    args = [Str(s=arg_name), Name(id=arg_name, ctx=Load()), Num(n=lineno)]
    return self._create_context_call('assign', args)

</t>
<t tx="ekr.20190103112220.37">def _wrap_assignment_target(self, target, index_to_get=None):
    """ Build string describing one assignment target and wrap indexes.

    For example, "x" for a variable target, or "x[{!r}] for an indexed
    target. An indexed target will have each index wrapped in a call to
    context.add_assignment_index() or context.get_assignment_index().
    @param index_to_get: if this is None, wrap in add_assignment_index(),
        otherwise, wrap in get_assignment_index(index_to_get).
    @return: string, or None if no assignment can be reported.
    """
    if isinstance(target, Name):
        return target.id
    if isinstance(target, Subscript):
        return self._wrap_subscript_target(target, index_to_get)
    if isinstance(target, Tuple) or isinstance(target, List):
        target_names = map(self._wrap_assignment_target, target.elts)
        wrapped = '({})'.format(', '.join(target_names))
        if len(target.elts) == 1:
            wrapped = wrapped[:-1] + ',)'
        return wrapped
    if Starred is not None and isinstance(target, Starred):
        return '*{}'.format(target.value.id)
    assert_message = 'Assignment target had type {}.'.format(type(target))
    assert isinstance(target, Attribute), assert_message
    names = self._get_attribute_names(target)
    return '.'.join(names)
</t>
<t tx="ekr.20190103112220.38">def _wrap_assignment_targets(self, targets):
    """ Build string describing assignment targets and wrap indexes.

    For example, "x = {}" for a single target, "x = y = {}" for
    multiple targets, or "x[{!r}] = {} for an indexed target.
    @return: string, or None if no assignment can be reported.
    """
    strings = []
    for target in targets:
        format_text = self._wrap_assignment_target(target)
        if format_text is not None:
            strings.append(format_text)
    if not strings:
        return None
    strings.append('{}')  # for assignment value
    return ' = '.join(strings)

</t>
<t tx="ekr.20190103112220.39">def _create_context_call(self, function_name, args=None):
    """ Create a method call expression on the live coding context object. """
    return Expr(value=self._create_bare_context_call(function_name, args))
</t>
<t tx="ekr.20190103112220.4">def __init__(self, width=0, height=0):
    self.options = {'width': width,
                    'height': height}
    self.report = []

    def make_call(method_name):
        return lambda *args, **kwargs: self.call(method_name,
                                                 *args,
                                                 **kwargs)

    method_names = ('create_line',
                    'create_rectangle',
                    'create_polygon',
                    'create_text',
                    'create_image')
    for method_name in method_names:
        self.__dict__[method_name] = make_call(method_name)

</t>
<t tx="ekr.20190103112220.40">@staticmethod
def _create_bare_context_call(function_name, args=None):
    """ Create a method call on the live coding context object.

    Bare means that it is not wrapped in an expression. """
    if args is None:
        args = []
    context_name = Name(id=CONTEXT_NAME, ctx=Load())
    func = Attribute(
        value=context_name,
        attr=function_name,
        ctx=Load())
    return Call(
        func=func,
        args=args,
        keywords=[],
        starargs=None,
        kwargs=None)
</t>
<t tx="ekr.20190103112220.41">class LineNumberCleaner(NodeTransformer):
    @others
</t>
<t tx="ekr.20190103112220.42">def __init__(self):
    self.max_line = 0
</t>
<t tx="ekr.20190103112220.43">def visit(self, node):
    lineno = getattr(node, 'lineno', None)
    if lineno is not None:
        if lineno &lt; self.max_line:
            node.lineno = self.max_line
        else:
            self.max_line = lineno
    return self.generic_visit(node)
</t>
<t tx="ekr.20190103112220.44"># noinspection PyAbstractClass

class TracedModuleImporter(MetaPathFinder, Loader):
    is_desperate = False

    @others
</t>
<t tx="ekr.20190103112220.45">def __init__(self,
             module_name,
             traced_code,
             environment,
             filename,
             is_own_driver,
             is_zoomed):
    """ Import the code that has been instrumented for live coding.

    :param module_name: name of the module to load in sys.modules, or None
    :param traced_code: compiled code for the module
        to load it as the live coding module
    :param environment: global variables for the module
    :param filename: the name of the file this code came from
    :param is_own_driver: True if this module should be loaded as the main
        module, but in a package.
    :param is_zoomed: True if matplotlib should be zoomed
    """
    self.module_name = module_name
    self.traced_code = traced_code
    self.environment = environment
    self.filename = filename
    self.is_own_driver = is_own_driver
    self.is_zoomed = is_zoomed
</t>
<t tx="ekr.20190103112220.46">def find_spec(self, fullname, path, target=None):
    if (
        fullname == self.module_name or
        (fullname == SCOPE_NAME and self.is_own_driver)
    ):
        return ModuleSpec(fullname, self)
    if fullname not in ('matplotlib', 'matplotlib.pyplot', 'numpy.random'):
        return None
    is_after = False
    for finder in sys.meta_path:
        if not is_after:
            is_after = finder is self
            continue
        finder_find_spec = getattr(finder, 'find_spec', None)
        if finder_find_spec:
            spec = finder_find_spec(fullname, path, target)
            if spec is not None:
                spec.loader = PatchedModuleLoader(
                    fullname, spec.loader, self.is_zoomed)
                return spec
    return None

</t>
<t tx="ekr.20190103112220.47">def exec_module(self, module):
    if '.' in self.module_name:
        package_name, child_name = self.module_name.rsplit('.', 1)
    else:
        package_name = None
    module.__package__ = package_name
    if self.filename is not None:
        module.__file__ = self.filename
    module.__builtins__ = builtins
    module.__dict__.update(self.environment)
    self.environment = module.__dict__

    exec(self.traced_code, self.environment)

</t>
<t tx="ekr.20190103112220.48"># find_module() and load_module() are used in Python 2.

def find_module(self, fullname, path=None):
    if (
        fullname == self.module_name or
        (fullname == SCOPE_NAME and self.is_own_driver)
    ):
        return self
    if fullname not in ('matplotlib', 'matplotlib.pyplot', 'numpy.random'):
        return None
    is_after = False
    for finder in sys.meta_path:
        if not is_after:
            is_after = finder is self
            continue
        loader = finder.find_module(fullname, path)
        if loader is not None:
            return PatchedModuleLoader(fullname, loader, self.is_zoomed)
    if sys.version_info &lt; (3, 0) and not TracedModuleImporter.is_desperate:
        # Didn't find anyone to load the module, get desperate.
        TracedModuleImporter.is_desperate = True
        return PatchedModuleLoader(fullname, None, self.is_zoomed)

</t>
<t tx="ekr.20190103112220.49"># find_module() and load_module() are used in Python 2.

def load_module(self, fullname):
    # noinspection PyDeprecation
    new_mod = imp.new_module(fullname)
    sys.modules[fullname] = new_mod
    self.exec_module(new_mod)
    return new_mod
</t>
<t tx="ekr.20190103112220.5">def call(self, method_name, *args, **kwargs):
    self.report.append(method_name)
    for arg in args:
        self.report.append("    %r" % int(round(arg)))
    keys = list(kwargs.keys())
    keys.sort()
    for key in keys:
        value = kwargs[key]
        self.report.append("    %s=%r" % (key, value))

</t>
<t tx="ekr.20190103112220.50"># noinspection PyAbstractClass

class PatchedModuleLoader(Loader):
    @others
</t>
<t tx="ekr.20190103112220.51">def __init__(self, fullname, main_loader, is_zoomed):
    self.fullname = fullname
    self.main_loader = main_loader
    self.is_zoomed = is_zoomed
    self.plt = None
</t>
<t tx="ekr.20190103112220.52">def exec_module(self, module):
    if self.main_loader is not None:
        self.main_loader.exec_module(module)
    if self.fullname == 'numpy.random':
        module.seed(0)
    elif self.fullname == 'matplotlib':
        module.use('Agg')
    elif self.fullname == 'matplotlib.pyplot':
        self.plt = module
        # noinspection PyProtectedMember
        turtle_screen = MockTurtle._screen
        screen_width = turtle_screen.cv.cget('width')
        screen_height = turtle_screen.cv.cget('height')
        module.show = self.mock_show
        module.live_coding_size = (screen_width, screen_height)
        module.live_coding_zoom = self.live_coding_zoom
        if self.is_zoomed:
            self.live_coding_zoom()
</t>
<t tx="ekr.20190103112220.53">def load_module(self, fullname):
    if self.main_loader is not None:
        module = self.main_loader.load_module(fullname)
    else:
        module = import_module(fullname)
        TracedModuleImporter.is_desperate = False
    self.exec_module(module)
    return module
</t>
<t tx="ekr.20190103112220.54">def mock_show(self, *_args, **_kwargs):
    figure = self.plt.gcf()
    # noinspection PyProtectedMember
    turtle_screen = MockTurtle._screen
    screen_width = turtle_screen.cv.cget('width')
    screen_height = turtle_screen.cv.cget('height')
    figure_width = figure.get_figwidth()*figure.dpi
    figure_height = figure.get_figheight()*figure.dpi
    if figure_width &lt; screen_width:
        x = (screen_width - figure_width) // 2
    else:
        x = 0
    if figure_height &lt; screen_height:
        y = (screen_height - figure_height) // 2
    else:
        y = 0
    # noinspection PyUnresolvedReferences
    data = io.BytesIO()
    self.plt.savefig(data, format='PNG')

    image = data.getvalue()
    encoded = standard_b64encode(image)
    image_text = str(encoded.decode('UTF-8'))
    MockTurtle.display_image(x, y, image=image_text)
</t>
<t tx="ekr.20190103112220.55">def live_coding_zoom(self):
    screen_width, screen_height = self.plt.live_coding_size
    fig = self.plt.gcf()
    fig_width, fig_height = fig.get_figwidth(), fig.get_figheight()
    x_dpi = screen_width/fig_width
    y_dpi = screen_height/fig_height
    fig.dpi = min(x_dpi, y_dpi)
</t>
<t tx="ekr.20190103112220.56">@contextmanager
def swallow_output():
    old_stdout = sys.stdout
    old_stderr = sys.stderr
    # noinspection PyUnresolvedReferences
    old_string_io = io.StringIO
    try:
        sys.stdout = FileSwallower(old_stdout)
        sys.stderr = FileSwallower(old_stderr, target_name='sys.stderr')
        io.StringIO = TracedStringIO
        yield
    finally:
        sys.stdout = old_stdout
        sys.stderr = old_stderr
        io.StringIO = old_string_io


</t>
<t tx="ekr.20190103112220.57">class CodeTracer(object):
    @others
</t>
<t tx="ekr.20190103112220.58">def __init__(self, canvas=None):
    self.message_limit = 10000
    self.max_width = None
    self.keepalive = False
    if MockTurtle is not None:
        MockTurtle.monkey_patch(canvas)
    self.environment = {}
    self.return_code = None
</t>
<t tx="ekr.20190103112220.59">def run_python_module(self, modulename):
    """Run a python module, as though with ``python -m name args...``.

    `modulename` is the name of the module, possibly a dot-separated name.

    This is based on code from coverage.py, by Ned Batchelder.
    https://bitbucket.org/ned/coveragepy
    """
    if find_spec:
        spec = find_spec(modulename)
        pathname = spec.origin
        packagename = spec.name
        if pathname.endswith("__init__.py") and not modulename.endswith("__init__"):
            mod_main = modulename + ".__main__"
            spec = find_spec(mod_main)
            if not spec:
                raise ImportError(
                    "No module named %s; "
                    "%r is a package and cannot be directly executed"
                    % (mod_main, modulename))
            pathname = spec.origin
            packagename = spec.name
        packagename = packagename.rpartition(".")[0]
    else:
        openfile = None
        glo, loc = globals(), locals()
        try:
            # Search for the module - inside its parent package, if any -
            # using standard import mechanics.
            if '.' in modulename:
                packagename, name = modulename.rsplit('.', 1)
                package = __import__(packagename, glo, loc, ['__path__'])
                searchpath = package.__path__
            else:
                packagename, name = None, modulename
                searchpath = None  # "top-level search" in imp.find_module()
            # noinspection PyDeprecation
            openfile, pathname, _ = imp.find_module(name, searchpath)
            # If `modulename` is actually a package, not a mere module,
            # then we pretend to be Python 2.7 and try running its
            # __main__.py script.
            if openfile is None:
                packagename = modulename
                name = '__main__'
                package = __import__(packagename, glo, loc, ['__path__'])
                searchpath = package.__path__
                # noinspection PyDeprecation
                openfile, pathname, _ = imp.find_module(name, searchpath)
        finally:
            if openfile:
                openfile.close()
    # Finally, hand the file off to run_python_file for execution.
    pathname = os.path.abspath(pathname)
    self.run_python_file(pathname, package=packagename)

</t>
<t tx="ekr.20190103112220.6">def cget(self, option):
    return self.options[option]
</t>
<t tx="ekr.20190103112220.60">def run_python_file(self, filename, package=None):
    """Run a python file as if it were the main program on the command line.

    `filename` is the path to the file to execute.
    """
    # Create a module to serve as __main__
    old_main_mod = sys.modules['__main__']
    # noinspection PyUnresolvedReferences
    main_mod = types.ModuleType('__main__')
    sys.modules['__main__'] = main_mod
    main_mod.__file__ = filename
    main_mod.__builtins__ = builtins
    if package:
        main_mod.__package__ = package
    try:
        code = self.make_code_from_py(filename)
        # Execute the code object.
        exec(code, main_mod.__dict__)
    finally:
        # Restore the old __main__
        sys.modules['__main__'] = old_main_mod

</t>
<t tx="ekr.20190103112220.61">@staticmethod
def make_code_from_py(filename):
    """Get source from `filename` and make a code object of it."""
    with open(filename, 'rU') as f:
        source = f.read()
    code = compile(source, filename, "exec")
    return code
</t>
<t tx="ekr.20190103112220.62">@staticmethod
def split_lines(messages):
    for message in messages:
        for line in message.splitlines():
            yield line
</t>
<t tx="ekr.20190103112220.63">def trace_turtle(self, source):
    self.trace_code(source)
    return '\n'.join(MockTurtle.get_all_reports())
</t>
<t tx="ekr.20190103112220.64">def report_driver_result(self, builder, messages):
    messages = list(self.split_lines(messages))
    block_size = len(messages) + 2
    builder.start_block(1, block_size)
    message_width = 1
    for lineno, message in enumerate(messages, 2):
        message_width = max(len(message), message_width)
        builder.add_message(message, lineno)
    header = '-' * message_width + ' '
    builder.add_message(header, 1)
    builder.add_message(header, block_size)
    builder.start_block(1, block_size)
</t>
<t tx="ekr.20190103112220.65">def trace_code(self,
               source,
               load_as=SCOPE_NAME,
               is_module=False,
               dump=False,
               driver=None,
               filename=None,
               bad_driver=None,
               is_zoomed=False):
    """ Trace a module of source code, possibly by running a driver script.

    :param str source: the source code to trace
    :param str load_as: the module name to load the source code as
    :param bool is_module: True if the driver is a module name instead of a
    file name
    :param bool dump: True if the source code should be included in the
    output
    :param list driver: the driver script's file name or module name and args
    :param str filename: the file name of the source code
    :param str bad_driver: a message to display if the driver doesn't call
    the module
    :param bool is_zoomed: True if matplotlib is zoomed
    """
    builder = ReportBuilder(self.message_limit)
    builder.max_width = self.max_width
    self.return_code = 0

    try:
        tree = parse(source, PSEUDO_FILENAME)
        new_tree = Tracer().visit(tree)
        fix_missing_locations(new_tree)
        LineNumberCleaner().visit(new_tree)
        # from ast import dump
        # print(dump(new_tree, include_attributes=True))
        code = compile(new_tree, PSEUDO_FILENAME, 'exec')
        # Set sys.argv properly.
        old_argv = sys.argv
        sys.argv = driver or [filename or load_as]
        try:
            self.run_code(code, builder, load_as, is_module, driver,
                filename, bad_driver, is_zoomed)
        finally:
            # Restore the old argv and path
            sys.argv = old_argv
            # During testing, we import these modules for every test case,
            # so force a reload. This is only likely to happen during testing.
            for target in (load_as, SCOPE_NAME):
                if target in sys.modules:
                    del sys.modules[target]
            for i in reversed(range(len(sys.meta_path))):
                if isinstance(sys.meta_path[i], TracedModuleImporter):
                    sys.meta_path.pop(i)
        for value in self.environment.values():
            if isinstance(value, types.GeneratorType):
                value.close()
    except SyntaxError:
        self.return_code = 1
        ex = sys.exc_info()[1]
        messages = traceback.format_exception_only(type(ex), ex)
        message = messages[-1].strip()
        if ex.filename == PSEUDO_FILENAME:
            line_number = ex.lineno
        else:
            line_number = 1
            message = '{} line {}: {}'.format(
                ex.filename, ex.lineno, message)
        builder.add_message(message, line_number)
    except BaseException as ex:
        self.return_code = getattr(ex, 'code', 1)
        etype, value, tb = sys.exc_info()
        is_reported = False
        entries = traceback.extract_tb(tb)
        for filename, _, _, _ in entries:
            if filename == PSEUDO_FILENAME:
                is_reported = True
        while not is_reported and tb is not None:
            frame = tb.tb_frame
            code = frame.f_code
            filename = code.co_filename
            if __file__ not in (filename, filename + 'c'):
                break
            tb = tb.tb_next
        if not is_reported:
            if tb:
                messages = traceback.format_exception(etype, value, tb)
            else:
                messages = traceback.format_exception_only(etype, value)
            self.report_driver_result(builder, messages)

    report = builder.report(source.count('\n'))
    if dump:
        source_lines = source.splitlines()
        report_lines = report.splitlines()
        dump_lines = []
        source_width = max(map(len, source_lines))
        indent = 4
        for source_line, report_line in izip_longest(
            source_lines, report_lines, fillvalue=''):
            line = (indent * ' ' + source_line +
                    (source_width-len(source_line))*' ' +
                    ' | ' + report_line)
            dump_lines.append(line)
        report = '\n'.join(dump_lines)
    return report

</t>
<t tx="ekr.20190103112220.66">def run_code(self,
    code,
    builder,
    load_as,
    is_module,
    driver,
    filename,
    bad_driver,
    is_zoomed,
):
    """ Run the traced module, plus its driver.

    :param code: the compiled code for the traced module
    :param builder: the report builder
    :param str load_as: the module name to load the source code as
    :param bool is_module: True if the driver is a module name instead of a
    file name
    :param list driver: the driver script's file name or module name and args
    :param str filename: the file name of the source code
    :param str bad_driver: a message to display if the driver doesn't call
    the module
    :param bool is_zoomed: True if matplotlib is zoomed
    """
    self.environment[CONTEXT_NAME] = builder
    is_own_driver = ((is_module and driver and driver[0] == load_as) or
                     load_as == SCOPE_NAME)
    seed(0)
    module_importer = TracedModuleImporter(load_as,
                                           code,
                                           self.environment,
                                           filename,
                                           is_own_driver,
                                           is_zoomed)
    sys.meta_path.insert(0, module_importer)
    if is_own_driver:
        with swallow_output():
            import_module(SCOPE_NAME)
    else:
        with swallow_output():
            try:
                if not is_module:
                    self.run_python_file(driver[0])
                else:
                    module_name = driver[0]
                    self.run_python_module(module_name)
                if sys.stdout.saw_failures:
                    self.report_driver_result(builder, ['Pytest reported failures.'])
                    self.return_code = 1
            except SystemExit as ex:
                if ex.code:
                    self.return_code = ex.code
                    messages = traceback.format_exception_only(type(ex), ex)
                    message = messages[-1].strip()
                    self.report_driver_result(builder, [message])
        if load_as not in sys.modules:
            driver_name = os.path.basename(driver[0])
            message = (bad_driver or
                "{} doesn't call the {} module."
                " Try a different driver.".format(driver_name, load_as))
            self.report_driver_result(builder, [message])
    self.environment = module_importer.environment

</t>
<t tx="ekr.20190103112220.67">class FileSwallower(object):
    @others
</t>
<t tx="ekr.20190103112220.68">def __init__(self,
             target,
             check_buffer=True,
             target_name=None):
    self.target = target
    self.target_name = target_name
    self.saw_failures = False
    if check_buffer:
        buffer = getattr(target, 'buffer', None)
        if buffer is not None:
            self.buffer = FileSwallower(buffer, check_buffer=False)

</t>
<t tx="ekr.20190103112220.69">def write(self, *args, **_):
    text = args and str(args[0]) or ''
    if re.search(r'^=+\s*FAILURES\s*=+$', text):
        self.saw_failures = True
    frame = currentframe()
    while frame is not None:
        report_builder = frame.f_locals.get(CONTEXT_NAME)
        if report_builder is not None:
            has_print_function = (
                sys.version_info &gt;= (3, 0) or
                __future__.print_function in frame.f_globals.values())
            report_builder.add_output(text,
                                      frame.f_lineno,
                                      has_print_function,
                                      target_name=self.target_name)
            break
        frame = frame.f_back

</t>
<t tx="ekr.20190103112220.7">&lt;&lt; imports &gt;&gt;
&lt;&lt; data &gt;&gt;
# noinspection PyPep8Naming

@others
if __name__ == '__main__':
    main()
elif IS_PYODIDE:
    web_main()
@language python
@tabwidth -4
</t>
<t tx="ekr.20190103112220.70">def __getattr__(self, name):
    return getattr(self.target, name)


</t>
<t tx="ekr.20190103112220.71">def find_string_io_targets(frame):
    for name, value in frame.f_locals.items():
        yield name, value
        if name == 'self':
            for attr_name, attr_value in value.__dict__.items():
                yield 'self.' + attr_name, attr_value


</t>
<t tx="ekr.20190103112220.72"># noinspection PyUnresolvedReferences

class TracedStringIO(io.StringIO):
    @others
</t>
<t tx="ekr.20190103112220.73">def write(self, text):
    super(TracedStringIO, self).write(text)
    frame = currentframe()
    while frame is not None:
        report_builder = frame.f_locals.get(CONTEXT_NAME)
        if report_builder is not None:
            for name, value in find_string_io_targets(frame):
                if value is self:
                    report_builder.add_output(
                        text, frame.f_lineno, target_name=name)
                    return
        frame = frame.f_back
</t>
<t tx="ekr.20190103112220.74">def web_main():
    display()
    document.getElementById('source').addEventListener('input', display)


</t>
<t tx="ekr.20190103112220.75">def display(_event=None):
    code = document.getElementById('source').value
    tracer = CodeTracer()
    tracer.max_width = 200000
    code_report = tracer.trace_code(code)
    document.getElementById('display').value = code_report


</t>
<t tx="ekr.20190103112220.76">def main():
    parser = argparse.ArgumentParser(
        description='Trace Python code.',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    &lt;&lt; add args &gt;&gt;
    args = parser.parse_args()
    if args.driver and args.driver[0] in ('-m', '--module'):
        args.module = True
        args.driver = args.driver[1:]
    if args.source == '-':
        code = sys.stdin.read()
    else:
        with open(args.source, 'r') as source:
            code = source.read()
    canvas = Canvas(args.width, args.height)
    tracer = CodeTracer(canvas)
    tracer.max_width = 200000
    code_report = tracer.trace_code(code,
        dump=args.dump,
        load_as=args.load_as,
        is_module=args.module,
        driver=args.driver,
        filename=args.filename,
        bad_driver=args.bad_driver,
        is_zoomed=args.zoomed)
    turtle_report = MockTurtle.get_all_reports()
    if turtle_report and args.canvas:
        print('start_canvas')
        print('\n'.join(turtle_report))
        print('end_canvas')
        print('.')
    print(code_report)
    if tracer.return_code:
        exit(tracer.return_code)
</t>
<t tx="ekr.20190103112220.77">@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20190103112220.78">from collections import namedtuple
# noinspection PyDeprecation
import imp
import importlib
import sys

from canvas import Canvas

if sys.version_info.major &gt;= 3:
    tkinter_name = 'tkinter'
else:
    tkinter_name = 'Tkinter'
try:
    tk = importlib.import_module(tkinter_name)
except ImportError:
    tk = sys.modules[tkinter_name] = imp.new_module(tkinter_name)
    tk.Frame = tk.Canvas = tk.Tk = object
    tk.mainloop = lambda *args, **kwargs: None
    tk.simpledialog = imp.new_module(tkinter_name)
    sys.modules[tkinter_name + '.simpledialog'] = tk.simpledialog

from turtle import TNavigator, TPen


</t>
<t tx="ekr.20190103112220.79">class MockTurtle(TNavigator, TPen):
    @others
color_map = {
    'alice blue': '#f0f8ff',
    'aliceblue': '#f0f8ff',
    'antique white': '#faebd7',
    'antiquewhite': '#faebd7',
    'antiquewhite1': '#ffefdb',
    'antiquewhite2': '#eedfcc',
    'antiquewhite3': '#cdc0b0',
    'antiquewhite4': '#8b8378',
    'aquamarine': '#7fffd4',
    'aquamarine1': '#7fffd4',
    'aquamarine2': '#76eec6',
    'aquamarine3': '#66cdaa',
    'aquamarine4': '#458b74',
    'azure': '#f0ffff',
    'azure1': '#f0ffff',
    'azure2': '#e0eeee',
    'azure3': '#c1cdcd',
    'azure4': '#838b8b',
    'beige': '#f5f5dc',
    'bisque': '#ffe4c4',
    'bisque1': '#ffe4c4',
    'bisque2': '#eed5b7',
    'bisque3': '#cdb79e',
    'bisque4': '#8b7d6b',
    'black': '#000000',
    'blanched almond': '#ffebcd',
    'blanchedalmond': '#ffebcd',
    'blue': '#0000ff',
    'blue violet': '#8a2be2',
    'blue1': '#0000ff',
    'blue2': '#0000ee',
    'blue3': '#0000cd',
    'blue4': '#00008b',
    'blueviolet': '#8a2be2',
    'brown': '#a52a2a',
    'brown1': '#ff4040',
    'brown2': '#ee3b3b',
    'brown3': '#cd3333',
    'brown4': '#8b2323',
    'burlywood': '#deb887',
    'burlywood1': '#ffd39b',
    'burlywood2': '#eec591',
    'burlywood3': '#cdaa7d',
    'burlywood4': '#8b7355',
    'cadet blue': '#5f9ea0',
    'cadetblue': '#5f9ea0',
    'cadetblue1': '#98f5ff',
    'cadetblue2': '#8ee5ee',
    'cadetblue3': '#7ac5cd',
    'cadetblue4': '#53868b',
    'chartreuse': '#7fff00',
    'chartreuse1': '#7fff00',
    'chartreuse2': '#76ee00',
    'chartreuse3': '#66cd00',
    'chartreuse4': '#458b00',
    'chocolate': '#d2691e',
    'chocolate1': '#ff7f24',
    'chocolate2': '#ee7621',
    'chocolate3': '#cd661d',
    'chocolate4': '#8b4513',
    'coral': '#ff7f50',
    'coral1': '#ff7256',
    'coral2': '#ee6a50',
    'coral3': '#cd5b45',
    'coral4': '#8b3e2f',
    'cornflower blue': '#6495ed',
    'cornflowerblue': '#6495ed',
    'cornsilk': '#fff8dc',
    'cornsilk1': '#fff8dc',
    'cornsilk2': '#eee8cd',
    'cornsilk3': '#cdc8b1',
    'cornsilk4': '#8b8878',
    'cyan': '#00ffff',
    'cyan1': '#00ffff',
    'cyan2': '#00eeee',
    'cyan3': '#00cdcd',
    'cyan4': '#008b8b',
    'dark blue': '#00008b',
    'dark cyan': '#008b8b',
    'dark goldenrod': '#b8860b',
    'dark gray': '#a9a9a9',
    'dark green': '#006400',
    'dark grey': '#a9a9a9',
    'dark khaki': '#bdb76b',
    'dark magenta': '#8b008b',
    'dark olive green': '#556b2f',
    'dark orange': '#ff8c00',
    'dark orchid': '#9932cc',
    'dark red': '#8b0000',
    'dark salmon': '#e9967a',
    'dark sea green': '#8fbc8f',
    'dark slate blue': '#483d8b',
    'dark slate gray': '#2f4f4f',
    'dark slate grey': '#2f4f4f',
    'dark turquoise': '#00ced1',
    'dark violet': '#9400d3',
    'darkblue': '#00008b',
    'darkcyan': '#008b8b',
    'darkgoldenrod': '#b8860b',
    'darkgoldenrod1': '#ffb90f',
    'darkgoldenrod2': '#eead0e',
    'darkgoldenrod3': '#cd950c',
    'darkgoldenrod4': '#8b6508',
    'darkgray': '#a9a9a9',
    'darkgreen': '#006400',
    'darkgrey': '#a9a9a9',
    'darkkhaki': '#bdb76b',
    'darkmagenta': '#8b008b',
    'darkolivegreen': '#556b2f',
    'darkolivegreen1': '#caff70',
    'darkolivegreen2': '#bcee68',
    'darkolivegreen3': '#a2cd5a',
    'darkolivegreen4': '#6e8b3d',
    'darkorange': '#ff8c00',
    'darkorange1': '#ff7f00',
    'darkorange2': '#ee7600',
    'darkorange3': '#cd6600',
    'darkorange4': '#8b4500',
    'darkorchid': '#9932cc',
    'darkorchid1': '#bf3eff',
    'darkorchid2': '#b23aee',
    'darkorchid3': '#9a32cd',
    'darkorchid4': '#68228b',
    'darkred': '#8b0000',
    'darksalmon': '#e9967a',
    'darkseagreen': '#8fbc8f',
    'darkseagreen1': '#c1ffc1',
    'darkseagreen2': '#b4eeb4',
    'darkseagreen3': '#9bcd9b',
    'darkseagreen4': '#698b69',
    'darkslateblue': '#483d8b',
    'darkslategray': '#2f4f4f',
    'darkslategray1': '#97ffff',
    'darkslategray2': '#8deeee',
    'darkslategray3': '#79cdcd',
    'darkslategray4': '#528b8b',
    'darkslategrey': '#2f4f4f',
    'darkturquoise': '#00ced1',
    'darkviolet': '#9400d3',
    'deep pink': '#ff1493',
    'deep sky blue': '#00bfff',
    'deeppink': '#ff1493',
    'deeppink1': '#ff1493',
    'deeppink2': '#ee1289',
    'deeppink3': '#cd1076',
    'deeppink4': '#8b0a50',
    'deepskyblue': '#00bfff',
    'deepskyblue1': '#00bfff',
    'deepskyblue2': '#00b2ee',
    'deepskyblue3': '#009acd',
    'deepskyblue4': '#00688b',
    'dim gray': '#696969',
    'dim grey': '#696969',
    'dimgray': '#696969',
    'dimgrey': '#696969',
    'dodger blue': '#1e90ff',
    'dodgerblue': '#1e90ff',
    'dodgerblue1': '#1e90ff',
    'dodgerblue2': '#1c86ee',
    'dodgerblue3': '#1874cd',
    'dodgerblue4': '#104e8b',
    'firebrick': '#b22222',
    'firebrick1': '#ff3030',
    'firebrick2': '#ee2c2c',
    'firebrick3': '#cd2626',
    'firebrick4': '#8b1a1a',
    'floral white': '#fffaf0',
    'floralwhite': '#fffaf0',
    'forest green': '#228b22',
    'forestgreen': '#228b22',
    'gainsboro': '#dcdcdc',
    'ghost white': '#f8f8ff',
    'ghostwhite': '#f8f8ff',
    'gold': '#ffd700',
    'gold1': '#ffd700',
    'gold2': '#eec900',
    'gold3': '#cdad00',
    'gold4': '#8b7500',
    'goldenrod': '#daa520',
    'goldenrod1': '#ffc125',
    'goldenrod2': '#eeb422',
    'goldenrod3': '#cd9b1d',
    'goldenrod4': '#8b6914',
    'gray': '#bebebe',
    'gray0': '#000000',
    'gray1': '#030303',
    'gray2': '#050505',
    'gray3': '#080808',
    'gray4': '#0a0a0a',
    'gray5': '#0d0d0d',
    'gray6': '#0f0f0f',
    'gray7': '#121212',
    'gray8': '#141414',
    'gray9': '#171717',
    'gray10': '#1a1a1a',
    'gray11': '#1c1c1c',
    'gray12': '#1f1f1f',
    'gray13': '#212121',
    'gray14': '#242424',
    'gray15': '#262626',
    'gray16': '#292929',
    'gray17': '#2b2b2b',
    'gray18': '#2e2e2e',
    'gray19': '#303030',
    'gray20': '#333333',
    'gray21': '#363636',
    'gray22': '#383838',
    'gray23': '#3b3b3b',
    'gray24': '#3d3d3d',
    'gray25': '#404040',
    'gray26': '#424242',
    'gray27': '#454545',
    'gray28': '#474747',
    'gray29': '#4a4a4a',
    'gray30': '#4d4d4d',
    'gray31': '#4f4f4f',
    'gray32': '#525252',
    'gray33': '#545454',
    'gray34': '#575757',
    'gray35': '#595959',
    'gray36': '#5c5c5c',
    'gray37': '#5e5e5e',
    'gray38': '#616161',
    'gray39': '#636363',
    'gray40': '#666666',
    'gray41': '#696969',
    'gray42': '#6b6b6b',
    'gray43': '#6e6e6e',
    'gray44': '#707070',
    'gray45': '#737373',
    'gray46': '#757575',
    'gray47': '#787878',
    'gray48': '#7a7a7a',
    'gray49': '#7d7d7d',
    'gray50': '#7f7f7f',
    'gray51': '#828282',
    'gray52': '#858585',
    'gray53': '#878787',
    'gray54': '#8a8a8a',
    'gray55': '#8c8c8c',
    'gray56': '#8f8f8f',
    'gray57': '#919191',
    'gray58': '#949494',
    'gray59': '#969696',
    'gray60': '#999999',
    'gray61': '#9c9c9c',
    'gray62': '#9e9e9e',
    'gray63': '#a1a1a1',
    'gray64': '#a3a3a3',
    'gray65': '#a6a6a6',
    'gray66': '#a8a8a8',
    'gray67': '#ababab',
    'gray68': '#adadad',
    'gray69': '#b0b0b0',
    'gray70': '#b3b3b3',
    'gray71': '#b5b5b5',
    'gray72': '#b8b8b8',
    'gray73': '#bababa',
    'gray74': '#bdbdbd',
    'gray75': '#bfbfbf',
    'gray76': '#c2c2c2',
    'gray77': '#c4c4c4',
    'gray78': '#c7c7c7',
    'gray79': '#c9c9c9',
    'gray80': '#cccccc',
    'gray81': '#cfcfcf',
    'gray82': '#d1d1d1',
    'gray83': '#d4d4d4',
    'gray84': '#d6d6d6',
    'gray85': '#d9d9d9',
    'gray86': '#dbdbdb',
    'gray87': '#dedede',
    'gray88': '#e0e0e0',
    'gray89': '#e3e3e3',
    'gray90': '#e5e5e5',
    'gray91': '#e8e8e8',
    'gray92': '#ebebeb',
    'gray93': '#ededed',
    'gray94': '#f0f0f0',
    'gray95': '#f2f2f2',
    'gray96': '#f5f5f5',
    'gray97': '#f7f7f7',
    'gray98': '#fafafa',
    'gray99': '#fcfcfc',
    'gray100': '#ffffff',
    'green': '#00ff00',
    'green yellow': '#adff2f',
    'green1': '#00ff00',
    'green2': '#00ee00',
    'green3': '#00cd00',
    'green4': '#008b00',
    'greenyellow': '#adff2f',
    'grey': '#bebebe',
    'grey0': '#000000',
    'grey1': '#030303',
    'grey2': '#050505',
    'grey3': '#080808',
    'grey4': '#0a0a0a',
    'grey5': '#0d0d0d',
    'grey6': '#0f0f0f',
    'grey7': '#121212',
    'grey8': '#141414',
    'grey9': '#171717',
    'grey10': '#1a1a1a',
    'grey11': '#1c1c1c',
    'grey12': '#1f1f1f',
    'grey13': '#212121',
    'grey14': '#242424',
    'grey15': '#262626',
    'grey16': '#292929',
    'grey17': '#2b2b2b',
    'grey18': '#2e2e2e',
    'grey19': '#303030',
    'grey20': '#333333',
    'grey21': '#363636',
    'grey22': '#383838',
    'grey23': '#3b3b3b',
    'grey24': '#3d3d3d',
    'grey25': '#404040',
    'grey26': '#424242',
    'grey27': '#454545',
    'grey28': '#474747',
    'grey29': '#4a4a4a',
    'grey30': '#4d4d4d',
    'grey31': '#4f4f4f',
    'grey32': '#525252',
    'grey33': '#545454',
    'grey34': '#575757',
    'grey35': '#595959',
    'grey36': '#5c5c5c',
    'grey37': '#5e5e5e',
    'grey38': '#616161',
    'grey39': '#636363',
    'grey40': '#666666',
    'grey41': '#696969',
    'grey42': '#6b6b6b',
    'grey43': '#6e6e6e',
    'grey44': '#707070',
    'grey45': '#737373',
    'grey46': '#757575',
    'grey47': '#787878',
    'grey48': '#7a7a7a',
    'grey49': '#7d7d7d',
    'grey50': '#7f7f7f',
    'grey51': '#828282',
    'grey52': '#858585',
    'grey53': '#878787',
    'grey54': '#8a8a8a',
    'grey55': '#8c8c8c',
    'grey56': '#8f8f8f',
    'grey57': '#919191',
    'grey58': '#949494',
    'grey59': '#969696',
    'grey60': '#999999',
    'grey61': '#9c9c9c',
    'grey62': '#9e9e9e',
    'grey63': '#a1a1a1',
    'grey64': '#a3a3a3',
    'grey65': '#a6a6a6',
    'grey66': '#a8a8a8',
    'grey67': '#ababab',
    'grey68': '#adadad',
    'grey69': '#b0b0b0',
    'grey70': '#b3b3b3',
    'grey71': '#b5b5b5',
    'grey72': '#b8b8b8',
    'grey73': '#bababa',
    'grey74': '#bdbdbd',
    'grey75': '#bfbfbf',
    'grey76': '#c2c2c2',
    'grey77': '#c4c4c4',
    'grey78': '#c7c7c7',
    'grey79': '#c9c9c9',
    'grey80': '#cccccc',
    'grey81': '#cfcfcf',
    'grey82': '#d1d1d1',
    'grey83': '#d4d4d4',
    'grey84': '#d6d6d6',
    'grey85': '#d9d9d9',
    'grey86': '#dbdbdb',
    'grey87': '#dedede',
    'grey88': '#e0e0e0',
    'grey89': '#e3e3e3',
    'grey90': '#e5e5e5',
    'grey91': '#e8e8e8',
    'grey92': '#ebebeb',
    'grey93': '#ededed',
    'grey94': '#f0f0f0',
    'grey95': '#f2f2f2',
    'grey96': '#f5f5f5',
    'grey97': '#f7f7f7',
    'grey98': '#fafafa',
    'grey99': '#fcfcfc',
    'grey100': '#ffffff',
    'honeydew': '#f0fff0',
    'honeydew1': '#f0fff0',
    'honeydew2': '#e0eee0',
    'honeydew3': '#c1cdc1',
    'honeydew4': '#838b83',
    'hot pink': '#ff69b4',
    'hotpink': '#ff69b4',
    'hotpink1': '#ff6eb4',
    'hotpink2': '#ee6aa7',
    'hotpink3': '#cd6090',
    'hotpink4': '#8b3a62',
    'indian red': '#cd5c5c',
    'indianred': '#cd5c5c',
    'indianred1': '#ff6a6a',
    'indianred2': '#ee6363',
    'indianred3': '#cd5555',
    'indianred4': '#8b3a3a',
    'ivory': '#fffff0',
    'ivory1': '#fffff0',
    'ivory2': '#eeeee0',
    'ivory3': '#cdcdc1',
    'ivory4': '#8b8b83',
    'khaki': '#f0e68c',
    'khaki1': '#fff68f',
    'khaki2': '#eee685',
    'khaki3': '#cdc673',
    'khaki4': '#8b864e',
    'lavender': '#e6e6fa',
    'lavender blush': '#fff0f5',
    'lavenderblush': '#fff0f5',
    'lavenderblush1': '#fff0f5',
    'lavenderblush2': '#eee0e5',
    'lavenderblush3': '#cdc1c5',
    'lavenderblush4': '#8b8386',
    'lawn green': '#7cfc00',
    'lawngreen': '#7cfc00',
    'lemon chiffon': '#fffacd',
    'lemonchiffon': '#fffacd',
    'lemonchiffon1': '#fffacd',
    'lemonchiffon2': '#eee9bf',
    'lemonchiffon3': '#cdc9a5',
    'lemonchiffon4': '#8b8970',
    'light blue': '#add8e6',
    'light coral': '#f08080',
    'light cyan': '#e0ffff',
    'light goldenrod': '#eedd82',
    'light goldenrod yellow': '#fafad2',
    'light gray': '#d3d3d3',
    'light green': '#90ee90',
    'light grey': '#d3d3d3',
    'light pink': '#ffb6c1',
    'light salmon': '#ffa07a',
    'light sea green': '#20b2aa',
    'light sky blue': '#87cefa',
    'light slate blue': '#8470ff',
    'light slate gray': '#778899',
    'light slate grey': '#778899',
    'light steel blue': '#b0c4de',
    'light yellow': '#ffffe0',
    'lightblue': '#add8e6',
    'lightblue1': '#bfefff',
    'lightblue2': '#b2dfee',
    'lightblue3': '#9ac0cd',
    'lightblue4': '#68838b',
    'lightcoral': '#f08080',
    'lightcyan': '#e0ffff',
    'lightcyan1': '#e0ffff',
    'lightcyan2': '#d1eeee',
    'lightcyan3': '#b4cdcd',
    'lightcyan4': '#7a8b8b',
    'lightgoldenrod': '#eedd82',
    'lightgoldenrod1': '#ffec8b',
    'lightgoldenrod2': '#eedc82',
    'lightgoldenrod3': '#cdbe70',
    'lightgoldenrod4': '#8b814c',
    'lightgoldenrodyellow': '#fafad2',
    'lightgray': '#d3d3d3',
    'lightgreen': '#90ee90',
    'lightgrey': '#d3d3d3',
    'lightpink': '#ffb6c1',
    'lightpink1': '#ffaeb9',
    'lightpink2': '#eea2ad',
    'lightpink3': '#cd8c95',
    'lightpink4': '#8b5f65',
    'lightsalmon': '#ffa07a',
    'lightsalmon1': '#ffa07a',
    'lightsalmon2': '#ee9572',
    'lightsalmon3': '#cd8162',
    'lightsalmon4': '#8b5742',
    'lightseagreen': '#20b2aa',
    'lightskyblue': '#87cefa',
    'lightskyblue1': '#b0e2ff',
    'lightskyblue2': '#a4d3ee',
    'lightskyblue3': '#8db6cd',
    'lightskyblue4': '#607b8b',
    'lightslateblue': '#8470ff',
    'lightslategray': '#778899',
    'lightslategrey': '#778899',
    'lightsteelblue': '#b0c4de',
    'lightsteelblue1': '#cae1ff',
    'lightsteelblue2': '#bcd2ee',
    'lightsteelblue3': '#a2b5cd',
    'lightsteelblue4': '#6e7b8b',
    'lightyellow': '#ffffe0',
    'lightyellow1': '#ffffe0',
    'lightyellow2': '#eeeed1',
    'lightyellow3': '#cdcdb4',
    'lightyellow4': '#8b8b7a',
    'lime green': '#32cd32',
    'limegreen': '#32cd32',
    'linen': '#faf0e6',
    'magenta': '#ff00ff',
    'magenta1': '#ff00ff',
    'magenta2': '#ee00ee',
    'magenta3': '#cd00cd',
    'magenta4': '#8b008b',
    'maroon': '#b03060',
    'maroon1': '#ff34b3',
    'maroon2': '#ee30a7',
    'maroon3': '#cd2990',
    'maroon4': '#8b1c62',
    'medium aquamarine': '#66cdaa',
    'medium blue': '#0000cd',
    'medium orchid': '#ba55d3',
    'medium purple': '#9370db',
    'medium sea green': '#3cb371',
    'medium slate blue': '#7b68ee',
    'medium spring green': '#00fa9a',
    'medium turquoise': '#48d1cc',
    'medium violet red': '#c71585',
    'mediumaquamarine': '#66cdaa',
    'mediumblue': '#0000cd',
    'mediumorchid': '#ba55d3',
    'mediumorchid1': '#e066ff',
    'mediumorchid2': '#d15fee',
    'mediumorchid3': '#b452cd',
    'mediumorchid4': '#7a378b',
    'mediumpurple': '#9370db',
    'mediumpurple1': '#ab82ff',
    'mediumpurple2': '#9f79ee',
    'mediumpurple3': '#8968cd',
    'mediumpurple4': '#5d478b',
    'mediumseagreen': '#3cb371',
    'mediumslateblue': '#7b68ee',
    'mediumspringgreen': '#00fa9a',
    'mediumturquoise': '#48d1cc',
    'mediumvioletred': '#c71585',
    'midnight blue': '#191970',
    'midnightblue': '#191970',
    'mint cream': '#f5fffa',
    'mintcream': '#f5fffa',
    'misty rose': '#ffe4e1',
    'mistyrose': '#ffe4e1',
    'mistyrose1': '#ffe4e1',
    'mistyrose2': '#eed5d2',
    'mistyrose3': '#cdb7b5',
    'mistyrose4': '#8b7d7b',
    'moccasin': '#ffe4b5',
    'navajo white': '#ffdead',
    'navajowhite': '#ffdead',
    'navajowhite1': '#ffdead',
    'navajowhite2': '#eecfa1',
    'navajowhite3': '#cdb38b',
    'navajowhite4': '#8b795e',
    'navy': '#000080',
    'navy blue': '#000080',
    'navyblue': '#000080',
    'old lace': '#fdf5e6',
    'oldlace': '#fdf5e6',
    'olive drab': '#6b8e23',
    'olivedrab': '#6b8e23',
    'olivedrab1': '#c0ff3e',
    'olivedrab2': '#b3ee3a',
    'olivedrab3': '#9acd32',
    'olivedrab4': '#698b22',
    'orange': '#ffa500',
    'orange red': '#ff4500',
    'orange1': '#ffa500',
    'orange2': '#ee9a00',
    'orange3': '#cd8500',
    'orange4': '#8b5a00',
    'orangered': '#ff4500',
    'orangered1': '#ff4500',
    'orangered2': '#ee4000',
    'orangered3': '#cd3700',
    'orangered4': '#8b2500',
    'orchid': '#da70d6',
    'orchid1': '#ff83fa',
    'orchid2': '#ee7ae9',
    'orchid3': '#cd69c9',
    'orchid4': '#8b4789',
    'pale goldenrod': '#eee8aa',
    'pale green': '#98fb98',
    'pale turquoise': '#afeeee',
    'pale violet red': '#db7093',
    'palegoldenrod': '#eee8aa',
    'palegreen': '#98fb98',
    'palegreen1': '#9aff9a',
    'palegreen2': '#90ee90',
    'palegreen3': '#7ccd7c',
    'palegreen4': '#548b54',
    'paleturquoise': '#afeeee',
    'paleturquoise1': '#bbffff',
    'paleturquoise2': '#aeeeee',
    'paleturquoise3': '#96cdcd',
    'paleturquoise4': '#668b8b',
    'palevioletred': '#db7093',
    'palevioletred1': '#ff82ab',
    'palevioletred2': '#ee799f',
    'palevioletred3': '#cd687f',
    'palevioletred4': '#8b475d',
    'papaya whip': '#ffefd5',
    'papayawhip': '#ffefd5',
    'peach puff': '#ffdab9',
    'peachpuff': '#ffdab9',
    'peachpuff1': '#ffdab9',
    'peachpuff2': '#eecbad',
    'peachpuff3': '#cdaf95',
    'peachpuff4': '#8b7765',
    'peru': '#cd853f',
    'pink': '#ffc0cb',
    'pink1': '#ffb5c5',
    'pink2': '#eea9b8',
    'pink3': '#cd919e',
    'pink4': '#8b636c',
    'plum': '#dda0dd',
    'plum1': '#ffbbff',
    'plum2': '#eeaeee',
    'plum3': '#cd96cd',
    'plum4': '#8b668b',
    'powder blue': '#b0e0e6',
    'powderblue': '#b0e0e6',
    'purple': '#a020f0',
    'purple1': '#9b30ff',
    'purple2': '#912cee',
    'purple3': '#7d26cd',
    'purple4': '#551a8b',
    'red': '#ff0000',
    'red1': '#ff0000',
    'red2': '#ee0000',
    'red3': '#cd0000',
    'red4': '#8b0000',
    'rosy brown': '#bc8f8f',
    'rosybrown': '#bc8f8f',
    'rosybrown1': '#ffc1c1',
    'rosybrown2': '#eeb4b4',
    'rosybrown3': '#cd9b9b',
    'rosybrown4': '#8b6969',
    'royal blue': '#4169e1',
    'royalblue': '#4169e1',
    'royalblue1': '#4876ff',
    'royalblue2': '#436eee',
    'royalblue3': '#3a5fcd',
    'royalblue4': '#27408b',
    'saddle brown': '#8b4513',
    'saddlebrown': '#8b4513',
    'salmon': '#fa8072',
    'salmon1': '#ff8c69',
    'salmon2': '#ee8262',
    'salmon3': '#cd7054',
    'salmon4': '#8b4c39',
    'sandy brown': '#f4a460',
    'sandybrown': '#f4a460',
    'sea green': '#2e8b57',
    'seagreen': '#2e8b57',
    'seagreen1': '#54ff9f',
    'seagreen2': '#4eee94',
    'seagreen3': '#43cd80',
    'seagreen4': '#2e8b57',
    'seashell': '#fff5ee',
    'seashell1': '#fff5ee',
    'seashell2': '#eee5de',
    'seashell3': '#cdc5bf',
    'seashell4': '#8b8682',
    'sienna': '#a0522d',
    'sienna1': '#ff8247',
    'sienna2': '#ee7942',
    'sienna3': '#cd6839',
    'sienna4': '#8b4726',
    'sky blue': '#87ceeb',
    'skyblue': '#87ceeb',
    'skyblue1': '#87ceff',
    'skyblue2': '#7ec0ee',
    'skyblue3': '#6ca6cd',
    'skyblue4': '#4a708b',
    'slate blue': '#6a5acd',
    'slate gray': '#708090',
    'slate grey': '#708090',
    'slateblue': '#6a5acd',
    'slateblue1': '#836fff',
    'slateblue2': '#7a67ee',
    'slateblue3': '#6959cd',
    'slateblue4': '#473c8b',
    'slategray': '#708090',
    'slategray1': '#c6e2ff',
    'slategray2': '#b9d3ee',
    'slategray3': '#9fb6cd',
    'slategray4': '#6c7b8b',
    'slategrey': '#708090',
    'snow': '#fffafa',
    'snow1': '#fffafa',
    'snow2': '#eee9e9',
    'snow3': '#cdc9c9',
    'snow4': '#8b8989',
    'spring green': '#00ff7f',
    'springgreen': '#00ff7f',
    'springgreen1': '#00ff7f',
    'springgreen2': '#00ee76',
    'springgreen3': '#00cd66',
    'springgreen4': '#008b45',
    'steel blue': '#4682b4',
    'steelblue': '#4682b4',
    'steelblue1': '#63b8ff',
    'steelblue2': '#5cacee',
    'steelblue3': '#4f94cd',
    'steelblue4': '#36648b',
    'tan': '#d2b48c',
    'tan1': '#ffa54f',
    'tan2': '#ee9a49',
    'tan3': '#cd853f',
    'tan4': '#8b5a2b',
    'thistle': '#d8bfd8',
    'thistle1': '#ffe1ff',
    'thistle2': '#eed2ee',
    'thistle3': '#cdb5cd',
    'thistle4': '#8b7b8b',
    'tomato': '#ff6347',
    'tomato1': '#ff6347',
    'tomato2': '#ee5c42',
    'tomato3': '#cd4f39',
    'tomato4': '#8b3626',
    'turquoise': '#40e0d0',
    'turquoise1': '#00f5ff',
    'turquoise2': '#00e5ee',
    'turquoise3': '#00c5cd',
    'turquoise4': '#00868b',
    'violet': '#ee82ee',
    'violet red': '#d02090',
    'violetred': '#d02090',
    'violetred1': '#ff3e96',
    'violetred2': '#ee3a8c',
    'violetred3': '#cd3278',
    'violetred4': '#8b2252',
    'wheat': '#f5deb3',
    'wheat1': '#ffe7ba',
    'wheat2': '#eed8ae',
    'wheat3': '#cdba96',
    'wheat4': '#8b7e66',
    'white': '#ffffff',
    'white smoke': '#f5f5f5',
    'whitesmoke': '#f5f5f5',
    'yellow': '#ffff00',
    'yellow green': '#9acd32',
    'yellow1': '#ffff00',
    'yellow2': '#eeee00',
    'yellow3': '#cdcd00',
    'yellow4': '#8b8b00',
    'yellowgreen': '#9acd32',
}
</t>
<t tx="ekr.20190103112220.8">import argparse
import re
from ast import (fix_missing_locations, iter_fields, parse, Add, Assign, AST,
                 Attribute, BitAnd, BitOr, BitXor, Call, Div, Ellipsis,
                 ExceptHandler, Expr, ExtSlice, FloorDiv, ImportFrom, Index,
                 List, Load, LShift, Mod, Mult, Name, NodeTransformer, Num,
                 Pow, Raise, Return, RShift, Slice, Store, Str, Sub, Subscript,
                 Tuple, Yield)
from contextlib import contextmanager
from copy import deepcopy
import __future__
from inspect import currentframe
import io

import sys
import traceback
import types
import os
from importlib import import_module

try:
    from importlib.abc import MetaPathFinder, Loader
    from importlib.machinery import ModuleSpec
    from importlib.util import find_spec
    imp = None
except ImportError:
    # Stub out the classes for older versions of Python.
    class MetaPathFinder(object):
        pass

    Loader = ModuleSpec = object
    find_spec = None
    import imp
try:
    builtins = import_module('__builtin__')
except ImportError:
    import builtins


IS_PYODIDE = __name__ == 'builtins'
if IS_PYODIDE:
    # noinspection PyUnresolvedReferences
    from js import document
    standard_b64encode = Canvas = MockTurtle = None
else:
    from base64 import standard_b64encode
    from canvas import Canvas
    from mock_turtle import MockTurtle
    from report_builder import ReportBuilder
    document = None

from random import seed  # noqa

# Import some classes that are only available in Python 3.
try:
    from ast import arg, Starred
except ImportError:
    arg = Starred = None
try:
    from ast import FormattedValue
except ImportError:
    FormattedValue = None
try:
    from ast import TryExcept, TryFinally
except ImportError:
    # Make Python 3.3 try class compatible with old versions.
    from ast import Try as TryExcept
    TryFinally = TryExcept

try:
    from itertools import izip_longest
except ImportError:
    from itertools import zip_longest as izip_longest

</t>
<t tx="ekr.20190103112220.80">class _Screen(object):
    @others
_Stamp = namedtuple('Stamp', 'pos heading color')
_screen = _pen = OriginalTurtle = original_mainloop = None
instances = []

</t>
<t tx="ekr.20190103112220.81">def __init__(self, canvas):
    if canvas is None:
        canvas = Canvas()
    self.cv = canvas
    self.xscale = self.yscale = 1
    self._config = {'bgcolor': None}

</t>
<t tx="ekr.20190103112220.82">def window_width(self):
    return self.cv.cget('width')

</t>
<t tx="ekr.20190103112220.83">def window_height(self):
    return self.cv.cget('height')

</t>
<t tx="ekr.20190103112220.84">def bgcolor(self, color=None):
    if color is None:
        bgcolor = self._config['bgcolor']
        if bgcolor is None:
            return 'white'
        return bgcolor
    self._config['bgcolor'] = color

</t>
<t tx="ekr.20190103112220.85">def tracer(self, a=None, b=None):
    pass

</t>
<t tx="ekr.20190103112220.86">def update(self):
    pass

</t>
<t tx="ekr.20190103112220.87">@classmethod
def monkey_patch(cls, canvas=None):
    turtle_module = sys.modules['turtle']
    cls.OriginalTurtle = turtle_module.Turtle
    turtle_module.Turtle = MockTurtle
    cls.original_mainloop = turtle_module.mainloop
    turtle_module.mainloop = turtle_module.done = lambda: None
    MockTurtle._screen = MockTurtle._Screen(canvas)
    MockTurtle._pen = MockTurtle()

</t>
<t tx="ekr.20190103112220.88">@classmethod
def remove_monkey_patch(cls):
    MockTurtle.instances = []
    if cls.OriginalTurtle is not None:
        turtle_module = sys.modules['turtle']
        turtle_module.Turtle = cls.OriginalTurtle
        turtle_module.mainloop = turtle_module.done = cls.original_mainloop
        MockTurtle._pen = cls.OriginalTurtle = cls.original_mainloop = None
        MockTurtle._screen = None

</t>
<t tx="ekr.20190103112220.89">@classmethod
def get_all_reports(cls):
    return MockTurtle._pen.report

</t>
<t tx="ekr.20190103112220.9">CONTEXT_NAME = '__live_coding_context__'
RESULT_NAME = '__live_coding_result__'
PSEUDO_FILENAME = '&lt;live coding source&gt;'
SCOPE_NAME = '__live_coding__'

OPERATOR_CHARS = {Add: '+',
                  Sub: '-',
                  Mult: '*',
                  Div: '/',
                  FloorDiv: '//',
                  Mod: '%',
                  Pow: '**',
                  RShift: '&gt;&gt;',
                  LShift: '&lt;&lt;',
                  BitAnd: '&amp;',
                  BitXor: '^',
                  BitOr: '|'}
</t>
<t tx="ekr.20190103112220.90">@classmethod
def display_image(cls, x, y, image):
    MockTurtle._screen.cv.create_image(x, y, image=image)

</t>
<t tx="ekr.20190103112220.91">def __init__(self, x=0, y=0, heading=0, canvas=None):
    self._path = None
    self._lines_to_draw = []
    TNavigator.__init__(self)
    TPen.__init__(self)
    if MockTurtle._screen is not None:
        self.screen = MockTurtle._screen
    else:
        self.screen = MockTurtle._Screen(canvas)
    self.stamps = []
    self.__xoff = self.screen.cv.cget('width')/2
    self.__yoff = self.screen.cv.cget('height')/2
    if x or y:
        self.setx(x)
        self.sety(y)
    self.setheading(heading)
    MockTurtle.instances.append(self)

</t>
<t tx="ekr.20190103112220.92">def __repr__(self):
    x = round(self.xcor())
    y = round(self.ycor())
    h = round(self.heading())
    return 'MockTurtle(%d, %d, %d)' % (x, y, h)

</t>
<t tx="ekr.20190103112220.93">def _goto(self, end):
    xstart = self.xcor()
    ystart = self.ycor()
    xend, yend = end
    kwargs = {}
    if self._pencolor:
        kwargs['fill'] = self._pencolor
    if self._pensize:
        kwargs['pensize'] = self._pensize
    if self._drawing:
        args = [xstart*self.screen.xscale + self.__xoff,
                -ystart*self.screen.yscale + self.__yoff,
                xend*self.screen.xscale + self.__xoff,
                -yend*self.screen.yscale + self.__yoff]
        if self._path:
            self._lines_to_draw.append((args, kwargs))
        else:
            self.screen.cv.create_line(*args, **kwargs)
    if self._path:
        self._path.append(xend + self.__xoff)
        self._path.append(-yend + self.__yoff)
    self._position = end

</t>
<t tx="ekr.20190103112220.94">def __getattr__(self, name):
    if name == 'report':
        for instance in MockTurtle.instances:
            instance._path = None  # Cancel incomplete fill.
            instance._newLine()
            instance._flush_lines()
            instance._draw_stamps()
        report = self.screen.cv.report[:]
        bgcolor = self.screen._config['bgcolor']
        if bgcolor is not None:
            bgcolorstr = self._colorstr(bgcolor)
            report[:0] = ["bgcolor",
                          "    fill={!r}".format(bgcolorstr),
                          "    outline=''"]
        return report
    raise AttributeError(name)

</t>
<t tx="ekr.20190103112220.95">def _draw_stamps(self):
    self.pensize(1)
    for stamp in self.stamps:
        self.up()
        self.goto(stamp.pos)
        self.setheading(stamp.heading)
        self.color(*stamp.color)
        self.down()
        self.begin_fill()
        self.left(151)
        self.fd(10.296)
        self.left(140.8)
        self.fd(5.385)
        self.right(43.6)
        self.fd(5.385)
        self.setpos(stamp.pos)
        self.end_fill()

</t>
<t tx="ekr.20190103112220.96">def window_width(self):
    return self.screen.cv.cget('width')

</t>
<t tx="ekr.20190103112220.97">def window_height(self):
    return self.screen.cv.cget('height')

</t>
<t tx="ekr.20190103112220.98">def begin_fill(self):
    self.fill(True)

</t>
<t tx="ekr.20190103112220.99">def end_fill(self):
    self.fill(False)

</t>
<t tx="ekr.20190104113125.1">parser.add_argument('-c', '--canvas',
    action='store_true',
    help='Should canvas commands be printed?')
parser.add_argument('-x', '--width',
    type=int,
    default=800,
    help='width of the canvas in pixels')
parser.add_argument('-y', '--height',
    type=int,
    default=600,
    help='height of the canvas in pixels')
parser.add_argument('-z', '--zoomed',
    action='store_true',
    help='matplotlib is zoomed to fit the canvas size')
parser.add_argument('-d', '--dump',
    action='store_true',
    help='dump source code with report')
parser.add_argument('-f', '--filename',
    help='file name to save in __file__')
parser.add_argument('-b', '--bad_driver',
    help="message to display if driver doesn't call module")
parser.add_argument('-m', '--module',
    action='store_true',
    help='driver is an importable module, not a script')
parser.add_argument('source',
    nargs=argparse.OPTIONAL,
    default='-',
    help='source file to trace, or - for stdin')
parser.add_argument('load_as',
    nargs=argparse.OPTIONAL,
    default=SCOPE_NAME,
    help='load traced code as a module with this name')
parser.add_argument('driver',
    nargs=argparse.REMAINDER,
    help='script to call traced code, plus any arguments')</t>
</tnodes>
</leo_file>
