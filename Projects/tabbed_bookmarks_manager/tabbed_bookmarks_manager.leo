<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: https://leo-editor.github.io/leo-editor/leo_toc.html -->
<leo_file xmlns:leo="http://leo-editor.github.io/leo-editor/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="tom.20230505073354.1"><vh>@settings</vh>
<v t="tom.20230505073354.2"><vh>@menuat help before</vh>
<v t="tom.20230505073354.3"><vh>@menu &amp;Bookmarks</vh>
<v t="tom.20230505073354.4"><vh>@@item bk-open-tab</vh></v>
<v t="tom.20230505073354.5"><vh>@item bk-toggle-tab</vh></v>
<v t="tom.20230505073354.6"><vh>@item bk-create-bookmark</vh></v>
<v t="tom.20230505073354.7"><vh>@item bk-chk-url</vh></v>
<v t="tom.20230505073354.8"><vh>@item bk-open-docs</vh></v>
</v>
</v>
<v t="tom.20230505073354.9"><vh>@button Bookmarks</vh></v>
<v t="tom.20230505073354.10"><vh>Commands</vh>
<v t="tom.20230505073354.11"><vh>@command bk-create-bookmark</vh>
<v t="tom.20230505073354.12"><vh>Get Title</vh>
<v t="tom.20230505073354.13"><vh>&lt;&lt; if status OK &gt;&gt;</vh></v>
<v t="tom.20230505073354.14"><vh>&lt;&lt; else handle errors &gt;&gt;</vh></v>
</v>
<v t="tom.20230505073354.15"><vh>Utility</vh></v>
</v>
<v t="tom.20230505073354.16"><vh>@command bk-chk-url</vh>
<v t="tom.20230505073354.17"><vh>&lt;&lt; def check_url &gt;&gt;</vh>
<v t="tom.20230505073354.18"><vh>&lt;&lt; if status OK &gt;&gt;</vh></v>
<v t="tom.20230505073354.19"><vh>&lt;&lt; else handle errors &gt;&gt;</vh></v>
</v>
<v t="tom.20230505073354.20"><vh>&lt;&lt; get url from node &gt;&gt;</vh></v>
<v t="tom.20230505073354.21"><vh>&lt;&lt; check host &gt;&gt;</vh></v>
</v>
<v t="tom.20230505073354.22"><vh>@command bk-find-latest</vh></v>
<v t="tom.20230505073354.23"><vh>@command bk-count</vh></v>
<v t="tom.20230505073354.24"><vh>@command bk-open-docs</vh></v>
</v>
</v>
<v t="tom.20220301164355.1"><vh>Bookmark Search Panel</vh>
<v t="tom.20230330195652.2"><vh>@command bk-toggle-tab</vh>
<v t="tom.20230505072853.1"><vh>&lt;&lt; declare CSS &gt;&gt;</vh></v>
<v t="tom.20230505072902.1"><vh>&lt;&lt; def toggle_app_tab &gt;&gt;</vh></v>
<v t="tom.20230505073051.1"><vh>&lt;&lt; Bookmark Main Widget &gt;&gt;</vh>
<v t="tom.20230330195652.3"><vh>Imports</vh></v>
<v t="tom.20230330195652.4"><vh>Declarations</vh></v>
<v t="tom.20230330195652.5"><vh>color_styles()</vh></v>
<v t="tom.20230330195652.6"><vh>open_file()</vh></v>
<v t="tom.20230330195652.7"><vh>path2unl_anchors()</vh></v>
<v t="tom.20230330195652.8"><vh>positionFromRelUnl()</vh></v>
<v t="tom.20230330195652.9"><vh>urlFromRef</vh></v>
<v t="tom.20230330195652.10"><vh>truncate</vh></v>
<v t="tom.20230330195652.11"><vh>class PanelWidget</vh></v>
<v t="tom.20230330195652.12"><vh>Class BaseView</vh>
<v t="tom.20230330195652.13"><vh>&lt;&lt; __init__ &gt;&gt;</vh>
<v t="tom.20230330195652.14"><vh>&lt;&lt; compute styles &gt;&gt;</vh></v>
<v t="tom.20230330195652.15"><vh>&lt;&lt; set up widgets &gt;&gt;</vh></v>
<v t="tom.20230330195652.16"><vh>&lt;&lt; build display widget &gt;&gt;</vh></v>
<v t="tom.20230330195652.17"><vh>&lt;&lt; set layout &gt;&gt;</vh></v>
<v t="tom.20230330195652.18"><vh>&lt;&lt; connect signals &gt;&gt;</vh></v>
<v t="tom.20230330195652.19"><vh>&lt;&lt; def signal handlers &gt;&gt;</vh></v>
</v>
<v t="tom.20230330195652.20"><vh>&lt;&lt; def generate link display &gt;&gt;</vh></v>
<v t="tom.20230330195652.21"><vh>get_colors_from_palette()</vh></v>
<v t="tom.20230330195652.22"><vh>bv.generate_link_html</vh>
<v t="tom.20230330195652.23"><vh>&lt;&lt; utility functions &gt;&gt;</vh></v>
<v t="tom.20230330195652.24"><vh>&lt;&lt; get resources by paths &gt;&gt;</vh></v>
<v t="tom.20230330195652.25"><vh>&lt;&lt; build display list &gt;&gt;</vh></v>
</v>
<v t="tom.20230330195652.26"><vh>bv.generate_term_html</vh></v>
<v t="tom.20230330195652.27"><vh>bv.data_available</vh></v>
<v t="tom.20230330195652.28"><vh>bv.subj_term_data_available</vh></v>
</v>
<v t="tom.20230330195652.29"><vh>Class SearchBox</vh></v>
<v t="tom.20230330195652.30"><vh>class ViewSwitcher</vh></v>
<v t="tom.20230330195652.31"><vh>class Item</vh></v>
<v t="tom.20230504113411.1"><vh>class SearchType</vh></v>
<v t="tom.20230330195652.32"><vh>class Controller</vh>
<v t="tom.20230330195652.33"><vh>&lt;&lt; __init__ &gt;&gt;</vh></v>
<v t="tom.20230330195652.34"><vh>def move to bookmarks start</vh></v>
<v t="tom.20230330195652.35"><vh>def walk_resources()</vh></v>
<v t="tom.20230330195652.36"><vh>def search_resources</vh>
<v t="tom.20230330195652.37"><vh>&lt;&lt; docstring &gt;&gt;</vh></v>
<v t="tom.20230330195652.38"><vh>&lt;&lt; get search terms &gt;&gt;</vh></v>
</v>
<v t="tom.20230330195652.39"><vh>def search_subjects</vh>
<v t="tom.20230330195652.40"><vh>&lt;&lt; docstring &gt;&gt;</vh></v>
</v>
<v t="tom.20230330195652.41"><vh>def count_all</vh></v>
<v t="tom.20230330195652.42"><vh>def handle_rel_browser_anchor_click</vh>
<v t="tom.20230330195652.43"><vh>&lt;&lt; create resource links &gt;&gt;</vh></v>
<v t="tom.20230330195652.44"><vh>&lt;&lt; create subject links &gt;&gt;</vh></v>
</v>
</v>
<v t="tom.20230503133741.1"><vh>Help Messages</vh>
<v t="tom.20230503133801.1"><vh>Help for search box</vh>
<v t="tom.20230503134408.1"><vh>&lt;&lt; search help message &gt;&gt;</vh></v>
</v>
</v>
</v>
</v>
<v t="tom.20230505075418.1"><vh>Bookmark Import Scripts</vh>
<v t="tom.20230505075418.2"><vh>Import Chrome-family JSON Bookmarks File</vh>
<v t="tom.20230505075418.3"><vh>get_children</vh></v>
<v t="tom.20230505075418.4"><vh>create_head_node</vh></v>
<v t="tom.20230505075418.5"><vh>gnx2date</vh></v>
</v>
<v t="tom.20230505075418.6"><vh>Import Firefox Bookmarks File</vh>
<v t="tom.20230505075418.7"><vh>Decompress Firefox JSON bookmark files</vh></v>
<v t="tom.20230505075418.8"><vh>get_children</vh></v>
<v t="tom.20230505075418.9"><vh>create_head_node</vh></v>
<v t="tom.20230505075418.10"><vh>gnx2date</vh></v>
</v>
</v>
<v t="tom.20230505075508.1"><vh>@path docs</vh>
<v t="tom.20230505075508.2"><vh>@button Build HTML</vh></v>
<v t="tom.20230505075508.3"><vh>@rst Bookmarks_manager_Users_Guide</vh>
<v t="tom.20230505075508.4"><vh>Introduction</vh>
<v t="tom.20230505075508.5"><vh>The Tabbed Bookmarks Manager</vh></v>
<v t="tom.20230505075508.6"><vh>The Bookmark Search Panel</vh></v>
<v t="tom.20230505075508.7"><vh>The Bookmarks  Tree</vh></v>
</v>
<v t="tom.20230505075508.8"><vh>Installation</vh></v>
<v t="tom.20230505075508.9"><vh>Bookmarks Outline Organization</vh></v>
<v t="tom.20230505075508.10"><vh>Bookmarks Organization</vh>
<v t="tom.20230505075508.11"><vh>Example</vh></v>
</v>
<v t="tom.20230505075508.12"><vh>Using The Bookmarks Manager</vh>
<v t="tom.20230505075508.13"><vh>Basics</vh>
<v t="tom.20230505075508.14"><vh>Getting Started</vh>
<v t="tom.20230505075508.15"><vh>Starter Set Of Bookmarks</vh></v>
<v t="tom.20230505075508.16"><vh>Where are the bookmarks?</vh></v>
</v>
<v t="tom.20230505075508.17"><vh>Terminology</vh>
<v t="tom.20230505075508.18"><vh>Resource</vh></v>
<v t="tom.20230505075508.19"><vh>Subject Term</vh></v>
</v>
<v t="tom.20230505075508.20"><vh>Leo Layouts</vh></v>
<v t="tom.20230505075508.21"><vh>Importing Bookmarks</vh>
<v t="tom.20230505075508.22"><vh>How To Create The bookmarks.json File</vh></v>
<v t="tom.20230505075508.23"><vh>Firefox</vh></v>
<v t="tom.20230505075508.24"><vh>Vivaldi And Other Chrome-Based Browsers</vh></v>
</v>
<v t="tom.20230505075508.25"><vh>Saving A New Bookmark</vh></v>
<v t="tom.20230505075508.26"><vh>Creating A New Bookmark By Hand</vh></v>
<v t="tom.20230505075508.27"><vh>Finding Bookmarks</vh>
<v t="tom.20230505075508.28"><vh>The Search Box</vh></v>
<v t="tom.20230505075508.29"><vh>Search Results</vh>
<v t="tom.20230505075508.30"><vh>Two Kinds Of Search Results</vh></v>
<v t="tom.20230505075508.31"><vh>An Search Example</vh></v>
<v t="tom.20230505075508.32"><vh>Resource Results.</vh></v>
<v t="tom.20230505075508.33"><vh>Subject Term Results</vh></v>
</v>
<v t="tom.20230505075508.34"><vh>Searching With Leo's Search Tools</vh></v>
</v>
<v t="tom.20230505075508.35"><vh>Broken Bookmarks</vh></v>
<v t="tom.20230505075508.36"><vh>Commands</vh></v>
</v>
</v>
</v>
</v>
</v>
<v t="tom.20230505073154.1"><vh>@bookmark-collection (starter set)</vh>
<v t="tom.20230505073154.2"><vh>Literate Programming</vh>
<v t="tom.20230505073154.3"><vh>xmLP - A Literate Programming Tool for XML</vh></v>
<v t="tom.20230505073154.4"><vh>xmLP</vh></v>
<v t="tom.20230505073154.5"><vh>Literate Programming (Norman Walsh DocBook-based)</vh></v>
<v t="tom.20230505073154.6"><vh>Literate Programming with XML</vh></v>
<v t="tom.20230505073154.7"><vh>Literate Programming</vh></v>
<v t="tom.20230505073154.8"><vh>pycco</vh></v>
</v>
<v t="tom.20230505073154.9"><vh>Python</vh>
<v t="tom.20230505073154.10"><vh>5 Python GUI Frameworks to Create Desktop, Web, and Even Mobile Apps. | Towards Data Science</vh></v>
<v t="tom.20230505073154.11"><vh>PyScript | Run Python in your HTML</vh></v>
<v t="tom.20230505073154.12"><vh>Install/Upgrade Python 3.10 on Linux Mint 20 LTS - LinuxCapable</vh></v>
<v t="tom.20230505073154.13"><vh>ASPN Cookbook Python Cookbook</vh></v>
<v t="tom.20230505073154.14"><vh>276494 - Using Python Scripts with IIS</vh></v>
<v t="tom.20230505073154.15"><vh>Python IAQ Infrequently Answered Questions</vh></v>
<v t="tom.20230505073154.16"><vh>And Web Services</vh>
<v t="tom.20230505073154.17"><vh>Tools</vh>
<v t="tom.20230505073154.18"><vh>Python Web Services</vh></v>
</v>
</v>
<v t="tom.20230505073154.19"><vh>And XML</vh>
<v t="tom.20230505073154.20"><vh>PyXML</vh></v>
<v t="tom.20230505073154.21"><vh>XML.com: XML Data Bindings in Python [Jun. 11, 2003]</vh></v>
<v t="tom.20230505073154.22"><vh>XML.com: Proper XML Output in Python</vh></v>
<v t="tom.20230505073154.23"><vh>online.effbot.org</vh></v>
</v>
<v t="tom.20230505073154.24"><vh>Application Frameworks</vh>
<v t="tom.20230505073154.25"><vh>Albatross - a Toolkit for Stateful Web Applications - Object Craft</vh></v>
<v t="tom.20230505073154.26"><vh>What is PEAK?</vh>
<v t="tom.20230505073154.27"><vh>PyProtocols</vh></v>
</v>
<v t="tom.20230505073154.28"><vh>PyQt</vh>
<v t="tom.20230505073154.29"><vh>PyQt. How to shoot yourself in the foot</vh></v>
<v t="tom.20230505073154.30"><vh>python - Draw vertical lines on QTextEdit in PyQt - Stack Overflow</vh></v>
<v t="tom.20230505073154.31"><vh>pyzo - paint indent guides</vh></v>
</v>
<v t="tom.20230505073154.32"><vh>tcl/Tk</vh>
<v t="tom.20230505073154.33"><vh>TkDocs - Tkinter Class API Reference</vh></v>
<v t="tom.20230505073154.34"><vh>Dialog Windows ::: An Introduction to Tkinter ::: www.effbot.org</vh></v>
<v t="tom.20230505073154.35"><vh>tk_html_widgets</vh></v>
</v>
<v t="tom.20230505073154.36"><vh>Web Application Frameworks</vh>
<v t="tom.20230505073154.37"><vh>Cheetah - The Python-Powered Template Engine</vh></v>
<v t="tom.20230505073154.38"><vh>CherryPy Less code, more power</vh></v>
</v>
<v t="tom.20230505073154.39"><vh>XUL</vh>
<v t="tom.20230505073154.40"><vh>developerWorks Web services Getting started with PyXPCOM, Part 3</vh></v>
</v>
</v>
<v t="tom.20230505073154.41"><vh>Applications</vh>
<v t="tom.20230505073154.42"><vh>Home of Pytalk</vh></v>
<v t="tom.20230505073154.43"><vh>PyGeo Home</vh></v>
<v t="tom.20230505073154.44"><vh>Twisted Matrix Enterprises</vh></v>
<v t="tom.20230505073154.45"><vh>VPython</vh></v>
<v t="tom.20230505073154.46"><vh>Webware for Python</vh></v>
<v t="tom.20230505073154.47"><vh>SourceForge.net: Project Info - The MayaVi Data Visualizer</vh></v>
</v>
<v t="tom.20230505073154.48"><vh>Articles</vh>
<v t="tom.20230505073154.49"><vh>ASPN Python Cookbook Finite State Machine (FSM)</vh></v>
<v t="tom.20230505073154.50"><vh>developerWorks XML zone Tip Using generators</vh></v>
<v t="tom.20230505073154.51"><vh>Webizing Python - Slide list</vh></v>
<v t="tom.20230505073154.52"><vh>Publications of David Mertz</vh></v>
<v t="tom.20230505073154.53"><vh>Markov poetry [dive into mark]</vh></v>
<v t="tom.20230505073154.54"><vh>Are Dynamic Languages Going to Replace Static Languages?</vh></v>
<v t="tom.20230505073154.55"><vh>Bruce Eckel's MindView, Inc 5-2-03 Strong Typing vs. Strong Testing</vh></v>
<v t="tom.20230505073154.56"><vh>Charming Python Iterators and simple generators</vh></v>
<v t="tom.20230505073154.57"><vh>developerWorks Web services The Python Web services developer RSS for Python</vh></v>
<v t="tom.20230505073154.58"><vh>Python Success Stories brochure</vh></v>
<v t="tom.20230505073154.59"><vh>Sean McGrath, CTO, Propylon</vh></v>
<v t="tom.20230505073154.60"><vh>XML.com Generating DOM Magic [Jan. 08, 2003]</vh></v>
</v>
<v t="tom.20230505073154.61"><vh>Books</vh>
<v t="tom.20230505073154.62"><vh>Text Processing in Python - Chapter 4</vh></v>
<v t="tom.20230505073154.63"><vh>The Hitchhiker’s Guide to Python! — The Hitchhiker's Guide to Python</vh></v>
</v>
<v t="tom.20230505073154.64"><vh>Building</vh>
<v t="tom.20230505073154.65"><vh>http--liko.home.cern.ch-liko-Manuals-Python-inst.pdf</vh></v>
<v t="tom.20230505073154.66"><vh>Instructions for Python Extensions with GCC-mingw32</vh></v>
<v t="tom.20230505073154.67"><vh>Python headers for Mingw32</vh></v>
<v t="tom.20230505073154.68"><vh>The Whole Python FAQ (bulding extension modules - error)</vh></v>
<v t="tom.20230505073154.69"><vh>6 Building Extensions: Tips and Tricks</vh></v>
</v>
<v t="tom.20230505073154.70"><vh>Compilers</vh>
<v t="tom.20230505073154.71"><vh>Welcome to Codon</vh></v>
<v t="tom.20230505073154.72"><vh>GitHub - exaloop/codon: A high-performance, zero-overhead, extensible Python compiler using LLVM</vh></v>
<v t="tom.20230505073154.73"><vh>Numba: A High Performance Python Compiler</vh></v>
</v>
<v t="tom.20230505073154.74"><vh>Databases</vh>
<v t="tom.20230505073154.75"><vh>dB-API modules</vh></v>
</v>
<v t="tom.20230505073154.76"><vh>Dependencies Management</vh>
<v t="tom.20230505073154.77"><vh>setup.py vs requirements.txt · caremad</vh></v>
</v>
<v t="tom.20230505073154.78"><vh>Development Environments</vh>
<v t="tom.20230505073154.79"><vh>Leo</vh>
<v t="tom.20230505073154.80"><vh>Leo's Home Page</vh></v>
<v t="tom.20230505073154.81"><vh>Google Groups - Leo - How did we ever live without mypy?</vh></v>
</v>
</v>
<v t="tom.20230505073154.82"><vh>Journals</vh>
<v t="tom.20230505073154.83"><vh>Python Journal thru 3(1), Volume 3, Issue 1, c. 2002</vh></v>
</v>
<v t="tom.20230505073154.84"><vh>Jython</vh>
<v t="tom.20230505073154.85"><vh>Evangelizing Java</vh></v>
<v t="tom.20230505073154.86"><vh>Jython Interactive Servlet Console</vh></v>
<v t="tom.20230505073154.87"><vh>Introduction to Jython</vh></v>
</v>
<v t="tom.20230505073154.88"><vh>Multiprocessing</vh>
<v t="tom.20230505073154.89"><vh>Things I Wish They Told Me About Multiprocessing in Python</vh></v>
</v>
<v t="tom.20230505073154.90"><vh>Packaging</vh>
<v t="tom.20230505073154.91"><vh>Packaging Python Projects — Python Packaging User Guide</vh></v>
<v t="tom.20230505073154.92"><vh>pipx</vh></v>
</v>
<v t="tom.20230505073154.93"><vh>Scientific Computing</vh>
<v t="tom.20230505073154.94"><vh>Home — Spyder IDE</vh></v>
<v t="tom.20230505073154.95"><vh>CodraFT | The Codra Filtering Tool, an open-source Signal and Image Processing Software</vh></v>
<v t="tom.20230505073154.96"><vh>A ~5 minute guide to Numba</vh></v>
<v t="tom.20230505073154.97"><vh>Pandas</vh>
<v t="tom.20230505073154.98"><vh>pandas.Series — pandas 1.4.2 documentation</vh></v>
<v t="tom.20230505073154.99"><vh>DataFrame — pandas 1.4.2 documentation</vh></v>
</v>
<v t="tom.20230505073154.100"><vh>SciPy - SciPy</vh></v>
<v t="tom.20230505073154.101"><vh>Python Extension Packages for Windows - Christoph Gohlke</vh></v>
</v>
<v t="tom.20230505073154.102"><vh>Servers</vh>
<v t="tom.20230505073154.103"><vh>PyWX -- Python for AOLserver</vh></v>
<v t="tom.20230505073154.104"><vh>Swocket - A Modular XML Socket server in Python</vh></v>
<v t="tom.20230505073154.105"><vh>Karrigell</vh></v>
</v>
<v t="tom.20230505073154.106"><vh>Techniques</vh>
<v t="tom.20230505073154.107"><vh>Returns 0.19.0 documentation</vh></v>
<v t="tom.20230505073154.108"><vh>shell - Execute terminal command from python in new terminal window? - Stack Overflow</vh></v>
<v t="tom.20230505073154.109"><vh>python - Check if string has date, any format - Stack Overflow</vh></v>
<v t="tom.20230505073154.110"><vh>How to open a python file in a new terminal window? - Raspberry Pi Forums</vh></v>
<v t="tom.20230505073154.111"><vh>Python trick: asynchronously reading subprocess pipes</vh></v>
<v t="tom.20230505073154.112"><vh>Declutter python code with error handling decorators – Rina Artstain</vh></v>
<v t="tom.20230505073154.113"><vh>Get name of current function and caller with Python - Stefaan Lippens inserts content here</vh></v>
<v t="tom.20230505073154.114"><vh>Dynamically extending APIs [dive into mark]</vh></v>
<v t="tom.20230505073154.115"><vh>Network programming with the Twisted framework, Part 1</vh></v>
<v t="tom.20230505073154.116"><vh>PEP 8 -- Style Guide for Python Code</vh></v>
<v t="tom.20230505073154.117"><vh>Using Python Generators</vh></v>
<v t="tom.20230505073154.118"><vh>Compiling Python Code</vh></v>
<v t="tom.20230505073154.119"><vh>How to Use UTF-8 with Python (evanjones.ca)</vh></v>
<v t="tom.20230505073154.120"><vh>9.4. Unicode</vh></v>
<v t="tom.20230505073154.121"><vh>Dryice Liu’s Blog - reading utf-8 file in Python</vh></v>
<v t="tom.20230505073154.122"><vh>Determine size of console window on Windows « Python recipes « ActiveState Code</vh></v>
<v t="tom.20230505073154.123"><vh>Introspection</vh>
<v t="tom.20230505073154.124"><vh>python - Getting the docstring from a function - Stack Overflow</vh></v>
</v>
</v>
<v t="tom.20230505073154.125"><vh>Tools</vh>
<v t="tom.20230505073154.126"><vh></vh></v>
<v t="tom.20230505073154.127"><vh>anygui - Generic GUI for Python</vh></v>
<v t="tom.20230505073154.128"><vh>ASPN Python Cookbook Finite State Machine (FSM)</vh></v>
<v t="tom.20230505073154.129"><vh>Bicycle Repair Man!</vh></v>
<v t="tom.20230505073154.130"><vh>Boa Constructor home</vh></v>
<v t="tom.20230505073154.131"><vh>Dave's Page</vh></v>
<v t="tom.20230505073154.132"><vh>Distributing Python Programs</vh></v>
<v t="tom.20230505073154.133"><vh>py2exe</vh></v>
<v t="tom.20230505073154.134"><vh>Pyco - Tiny Python Distributions</vh></v>
<v t="tom.20230505073154.135"><vh>PyRXP - a fast, validating XML parser for Python</vh></v>
<v t="tom.20230505073154.136"><vh>SourceForge.net Project Info - Python Plugin for the Eclipse platform</vh></v>
<v t="tom.20230505073154.137"><vh>PythonJournal 2(2) Python Code Animator: PySpy</vh></v>
<v t="tom.20230505073154.138"><vh>::: procoders.net :::</vh></v>
<v t="tom.20230505073154.139"><vh>Python things</vh></v>
<v t="tom.20230505073154.140"><vh>Zope.org - Python Scripting For .NET</vh></v>
<v t="tom.20230505073154.141"><vh>OpenOffice.org</vh></v>
<v t="tom.20230505073154.142"><vh>SPE - Stani's Python Editor</vh></v>
<v t="tom.20230505073154.143"><vh>downloads.effbot.org www.effbot.org</vh></v>
<v t="tom.20230505073154.144"><vh>PIDDLE</vh></v>
<v t="tom.20230505073154.145"><vh>Python Editor for Eclipse</vh></v>
<v t="tom.20230505073154.146"><vh>Network Programming</vh>
<v t="tom.20230505073154.147"><vh>asynchttp - Asynconronous HTTP Client</vh></v>
<v t="tom.20230505073154.148"><vh>Ned Batchelder: Cog</vh></v>
</v>
</v>
<v t="tom.20230505073154.149"><vh>Wiki</vh>
<v t="tom.20230505073154.150"><vh>FrontPage - PyXML Wiki</vh></v>
<v t="tom.20230505073154.151"><vh>WyPy: A Minimal 18 Line Python Wiki</vh></v>
<v t="tom.20230505073154.152"><vh>Wy.Py - Eleven Lines of Wikiness</vh></v>
<v t="tom.20230505073154.153"><vh>TeudProject - PoundPython Wiki</vh></v>
</v>
<v t="tom.20230505073154.154"><vh>XML Processing</vh>
<v t="tom.20230505073154.155"><vh>XML.com: Simple XML Processing With elementtree [Feb. 12, 2003]</vh></v>
<v t="tom.20230505073154.156"><vh>(OPML) Parsing an XML Document</vh></v>
<v t="tom.20230505073154.157"><vh>opyml</vh></v>
<v t="tom.20230505073154.158"><vh>DOM Standards compliance</vh></v>
<v t="tom.20230505073154.159"><vh>Pxdom</vh></v>
<v t="tom.20230505073154.160"><vh>RELAX NG with Python</vh></v>
<v t="tom.20230505073154.161"><vh>XML.com: Three More For XML Output</vh></v>
<v t="tom.20230505073154.162"><vh>Parsers</vh>
<v t="tom.20230505073154.163"><vh>entrian.com - PyMeld - Introduction</vh></v>
</v>
<v t="tom.20230505073154.164"><vh>Tag Soup Parsers</vh>
<v t="tom.20230505073154.165"><vh>xmltramp: Make XML documents easily accessible.</vh></v>
<v t="tom.20230505073154.166"><vh>Beautiful Soup</vh></v>
</v>
</v>
<v t="tom.20230505073154.167"><vh>Security</vh>
<v t="tom.20230505073154.168"><vh>Home - PythonSecurity.org</vh></v>
<v t="tom.20230505073154.169"><vh>brool » The Tiniest Lisp (in Python)</vh></v>
<v t="tom.20230505073154.170"><vh>Python Extension Packages for Windows - Christoph Gohlke</vh></v>
</v>
<v t="tom.20230505073154.171"><vh>Unicode</vh>
<v t="tom.20230505073154.172"><vh>Python-Unicode-Collation-Algorithm/pyuca.py</vh></v>
<v t="tom.20230505073154.173"><vh>blist</vh></v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="tom.20220301164355.1"></t>
<t tx="tom.20230330195652.10">def truncate(s, num = 50):
    s = s if len(s) &lt; num else s[:num] + '...'
    return s
</t>
<t tx="tom.20230330195652.11">class PanelWidget(QWidget):
    """Contains the View and Controller for a browser bookmark viewer.

    The Leo tree nodes amount to the Model of a MVC
    design.
    """

    def __init__(self, g, c):
        """
        ARGUMENTS
        g -- the Leo Global instance
        c -- the Leo commander for the current outline.
        """

        super().__init__()

        self.c = c
        self.g = g
        bv = self.baseview = BaseView(g, c)
        cont = self.controller = Controller(bv, g, c)
        sb = self.statusbar = QStatusBar()

        layout = QVBoxLayout()
        layout.addWidget(bv)
        layout.addWidget(sb)
        self.setLayout(layout)

        bv.search_box.change_connect(cont.search_resources)
        bv.subjbrowser.anchorClicked.connect(cont.search_subjects)
        bv.relbrowser.anchorClicked.connect(cont.handle_rel_browser_anchor_click)
        bv.search_box.helpbutton.clicked.connect(bv.search_box.search_help_handler)

        res_counts, subj_counts = cont.count_all()
        count_str = f'resources: {res_counts}, subjects: {subj_counts}'

        sb_css = f"""QStatusBar {{
            color: {bv.bg};
            background: {bv.fg};}}"""
        sb.setStyleSheet(sb_css)

        sb.showMessage(count_str, 10000)

</t>
<t tx="tom.20230330195652.12">class BaseView(QWidget):
    """Provides a "view" that receives a data package and displays it.

    The display consists of three panes, of which only one
    can be visible at a time, buttons to change
    the pane in view, and an input field for entering
    search terms.
    """

    &lt;&lt; __init__ &gt;&gt;

    &lt;&lt; def signal handlers &gt;&gt;
    &lt;&lt; def generate link display &gt;&gt;

    def display_html(self, browser, html_):
        browser.setHtml(html_)

    @others
</t>
<t tx="tom.20230330195652.13">def __init__(self, g, c):
    super().__init__()
    self.c = c
    self.g = g
    rb = self.resbrowser = QTextBrowser()
    sb = self.subjbrowser = QTextBrowser()
    relb = self.relbrowser = QTextBrowser()

    self.search_box = SearchBox(c)
    self.view_switcher = ViewSwitcher()

    self.model_data = None
    self.subj_term_data = None
    self.HTML_CSS = ''

    self.subjects = 0
    self.resources = 0

    &lt;&lt; compute styles &gt;&gt;
    &lt;&lt; set up widgets &gt;&gt;
    &lt;&lt; build display widget &gt;&gt;
    &lt;&lt; set layout &gt;&gt;
    &lt;&lt; connect signals &gt;&gt;

    self.setStyleSheet(STYLES)
    self.find_view_kind = RES
    self.display_widget.setCurrentIndex(RES)
</t>
<t tx="tom.20230330195652.14">fg, bg, bbg = self.get_colors_from_palette()
STYLES, BASE_STYLE, HTML_CSS, PB_STYLE_EXT,LE_STYLE_EXT = \
    color_styles(fg, bg, bbg)

self.fg, self.bg = fg, bg
self.HTML_CSS = HTML_CSS
</t>
<t tx="tom.20230330195652.15">rb.setOpenLinks(False)  # Prevent widget from navigating to links
sb.setOpenLinks(False)  # Prevent widget from navigating to links
relb.setOpenLinks(False)

</t>
<t tx="tom.20230330195652.16">self.display_widget = QStackedWidget()
self.display_widget.insertWidget(RES, rb)
self.display_widget.insertWidget(SUBJ, sb)
self.display_widget.insertWidget(REL, relb)

</t>
<t tx="tom.20230330195652.17">layout = QVBoxLayout()
layout.addWidget(self.search_box.widget)
layout.addWidget(self.view_switcher.widget)
layout.addWidget(self.display_widget)
#layout.setContentsMargins(0, 0, 0, 0)

self.setLayout(layout)

</t>
<t tx="tom.20230330195652.18">self.resbrowser.anchorClicked.connect(self.handleRbAnchorClick)

# Order of the handlers is important here!
handlers = (self.view_switch_res, self.view_switch_subj,
            self.view_switch_rel)
self.view_switcher.connect(handlers)
</t>
<t tx="tom.20230330195652.19">def view_switch(self, tab = RES):
    """Switch visible panel to "tab" panel.

    tab must be one of (RES, SUBJ, REL)
    """
    self.find_view_kind = tab
    self.display_widget.setCurrentIndex(tab)
    self.view_switcher.clear_bolds()
    self.view_switcher.set_bold(self.view_switcher.buttons[tab])

def view_switch_subj(self):
    """When the "Subjects" button is pressed."""
    self.view_switch(SUBJ)

def view_switch_res(self):
    """When the "Resources" button is pressed."""
    self.view_switch(RES)

def view_switch_rel(self):
    """When the "Related Terms" button is pressed."""
    self.view_switch(REL)

def handleRbAnchorClick(self, ref):
    ref_st = ref.toString()  # ref is a QUrl
    ref_st = ref_st.replace(' ', '%20')
    if ref_st.startswith('http:') or ref_st.startswith('https:'):
        url = urllib.parse.unquote(ref_st)
        webbrowser.open_new_tab(url)
    elif ref_st.startswith('url:file://'):
        url = ref_st.replace('url:file://', '')
        url = urllib.parse.unquote(url)
        if self.g.isWindows:
            url = url.replace('/', '\\')
        assert url, 'URL should not be empty'
        open_file(url)
    elif ref_st.startswith('file:'):
        url = ref_st.replace('"', '')
        self.g.handleUrl(url, self.c)
    elif ref_st.startswith('unl:'):
        # Assume the form is "unl://c:/..."
        unl = ref_st
        host = ref.host()
        if self.g.isWindows and host and not host.endswith(':'):
            unl = unl.replace(host, host + ':', 1)
            unl = unl.replace('%20', ' ')
            unl = unl.replace('%3E', '&gt;')
        self.g.handleUnl(unl, self.c)
    # elif not ref_st.startswith('unl'):
    else:
        unl = 'unl://#' + ref_st
        self.g.handleUnl(unl, self.c)
    # else:
        # self.g.handleUnl(ref_st, self.c)
    # else:
        # print(ref)

def handleSbAnchorClick(self, term):
    pass  # Connected to Controller.search_subjects() by PanelWidget.__init__

def handleRelbAnchorClick(self, term):
    pass# Connected in PanelWidget.__init__
</t>
<t tx="tom.20230330195652.2">@language python
"""A log tab panel for a bookmark manager."""

log = c.frame.log
TABNAME = 'Bookmarks'
WIDGET_NAME = f'{TABNAME}-widget'

&lt;&lt; declare CSS &gt;&gt;
&lt;&lt; def toggle_app_tab &gt;&gt;

# If this is the first activation, create our widget's code
if not log.contentsDict.get(WIDGET_NAME, None):
    &lt;&lt; Bookmark Main Widget &gt;&gt;

toggle_app_tab(log, TABNAME)</t>
<t tx="tom.20230330195652.20">def generate_link_display(self):
    html_ = self.generate_link_html() or ''
    return html_
</t>
<t tx="tom.20230330195652.21">def get_colors_from_palette(self):
    """Get fg, bg, and bbg colors from the body's colors.

    RETURNS
    a tuple (fg, bg, bbg) of CSS colors.
    """
    c = self.c

    # This code is taken from Leo's freewin plugin
    wrapper = c.frame.body.wrapper
    w = wrapper.widget

    palette:QtGui.QPalette = w.viewport().palette()
    fg_hex:int = palette.text().color().rgb()
    bg_hex:int = palette.window().color().rgb()
    fg:str = f'#{fg_hex:x}'
    bg:str = f'#{bg_hex:x}'

    return (fg, bg, bg)

</t>
<t tx="tom.20230330195652.22">def generate_link_html(self):
    """Return an HTML string for the View to use for display.

    The display will show the links data.

    find_results = [(&lt;searchterm&gt;, &lt;termlist&gt;, &lt;linklist&gt;)*]
    &lt;termlist&gt; = [(&lt;leaf term&gt;, &lt;unl&gt;)*]
    &lt;linklist&gt; = [(&lt;page title&gt;, &lt;page url&gt;, &lt;term unl&gt;)*]

    ARGUMENT
    data -- a list of results with the above structure.

    RETURNS -- an HTML string
    """

    data = self.model_data
    if not data:
        return 'No data'
    search_phrase = data[0]

    &lt;&lt; utility functions &gt;&gt;

    if data:
        #str = ''
        res_count = 0
        paths = []
        res_by_paths = {}

        # Populate paths list, res_by_paths dict
        &lt;&lt; get resources by paths &gt;&gt;

        display_list = []
        &lt;&lt; build display list &gt;&gt;
        if not display_list:
            return ''

    html_ = '&lt;br&gt;\n'.join(display_list)
    # Produce the html string for output
    searches = ''
    for s in search_phrase:
        searches += f'"{s}" '
    header = f'&lt;h3&gt;Resource Matches for &lt;i&gt;{searches}&lt;/i&gt;&lt;/h3&gt;\n'
    html_ = self.HTML_CSS + '&lt;body&gt;\n' + header + f'&lt;div&gt;{html_}&lt;/div&gt;\n&lt;/body&gt;'
    # if HTML_TO_CLIP:
        # self.g.app.gui.replaceClipboardWith(html_)


    return self.HTML_CSS + html_  # + countstr
</t>
<t tx="tom.20230330195652.23">def path_str(path: tuple) -&gt; str:
    """Convert a list of path steps to a "/"-separated string."""
    return '/'.join(path)

</t>
<t tx="tom.20230330195652.24">for item in data[1]:
    path = item.path
    subject_path = path[:-1]
    paths.append(subject_path)
    if item.type == RES:
        res_count += 1
        _l1 = res_by_paths.get(subject_path, [])
        if not _l1:
            res_by_paths[subject_path] = _l1
        _l1.append(item)
</t>
<t tx="tom.20230330195652.25"># Dedup and sort
pathset = set()
for path in res_by_paths:
    pathset.add(path)
pathlist = sorted(pathset)

for path in pathlist:
    subj_path = path
    # Clickable context line for this path:
    display_list.append(path2unl_anchors(subj_path, True))

    # All items for this path
    items = res_by_paths.get(path, [])
    for n, item in enumerate(items):
        # Build the context line
        if n %7 == 0 and n != 0:
            display_list.append('\n')

        # Build the resource line
        title = truncate(item.title, 65)
        url = item.url.replace(':ref: ', '')
        url = html.unescape(url)
        unl = item.unl
        # pos = unl.find('#', 1)
        # unl = unl[pos:]
        # unl = 'unl://' + unl
        resource_str = (f'&lt;a href="{unl}"&gt;( &lt;b&gt;?&lt;/b&gt; )&lt;/a&gt; '
                        + f'&lt;a href="{url}"&gt;{title}&lt;/a&gt;\n')
        display_list.append(resource_str)

    display_list.append('\n')

</t>
<t tx="tom.20230330195652.26">def generate_term_html(self):
    """Return an HTML string for the View to use for display.

    The display will show the subject terms data.

    find_results = [(&lt;searchterm&gt;, &lt;linklist&gt;, &lt;termlist&gt;)*]
    &lt;termlist&gt; = [Item*]
    &lt;linklist&gt; = [Item*]

    The display pane will receive deduplicated entries.

    ARGUMENT
    data -- a list of results with the above structure.

    RETURNS -- an HTML string
    """

    data = self.model_data
    if not data:
        return 'No data'


    search_phrase = data[0]
    try:
        termlist = [t.path[-1] for t in data[2]]
    except:
        print(data[2][0].title, data[2][0].path)
        assert False, 'data error'
    termset = set(termlist)
    terms = sorted(list(termset))


    searches = ''
    for s in search_phrase:
        searches += f'"{s}" '

    header = f'&lt;h3&gt;Subject Matches for &lt;i&gt;{searches}&lt;/i&gt;&lt;/h3&gt;\n'
    results = []
    for leaf in terms:
        if leaf.lower().startswith('and'):
            continue
        results.append(f'&lt;a href="{leaf}"&gt;{leaf}&lt;/a&gt;')

    html = header + '&lt;br&gt;'.join(results)
    #if HTML_TO_CLIP: g.app.gui.replaceClipboardWith(html)
    return html

def generate_term_display(self, html):
    """Add CSS styling to html string."""
    return f'{self.HTML_CSS}\n&lt;body&gt;\n{html}\n&lt;/body&gt;'
</t>
<t tx="tom.20230330195652.27">def data_available(self, data):
    """Display views of search results.

    This method is used as a signal handler when a
    search is made.

    Uses data stored in self.model_data.  Format:

    find_results = [(&lt;searchterm&gt;, &lt;linklist&gt;)*, &lt;termlist&gt; ]
    &lt;termlist&gt; = [Item*]
    &lt;linklist&gt; = [Item*]
    """
    self.model_data = data
    html_ = self.generate_link_display()
    if html_:
        self.display_html(self.resbrowser, html_)
        self.view_switch(RES)
    else:
        self.resbrowser.document().clear()
    has_resources = html_

    html_ = self.generate_term_html()
    if html_:
        html_ = self.generate_term_display(html_)
        self.display_html(self.subjbrowser, html_)
    else:
        self.subjbrowser.document().clear()
    if html_ and not has_resources:
        self.view_switch(SUBJ)

    # Clear the Related Terms panel until a term is selected in the
    # Subjects panel.
    self.relbrowser.document().clear()
</t>
<t tx="tom.20230330195652.28">def subj_term_data_available(self):
    """Display views of subject term search results.

    This method is used as a signal handler when a
    search is made.

    Uses data stored in self.subj_term_data.  Format:

    find_results = [(&lt;searchterm&gt;, &lt;termlist&gt; ]
    &lt;termlist&gt; = [Item*]
    """
    search, subj_items = self.subj_term_data
    html_ = ''
    for i, t  in enumerate(subj_items):
        if i &gt; 0 and i % 7 == 0:
            html_ += '&lt;br&gt;\n'
        steps = t.context.split('/')
        html_ += path2unl_anchors(steps) + '&lt;br&gt;'

    html_  = f'&lt;h3&gt;By Context&lt;/h3&gt;{html_}'
    html_ = f'&lt;h2&gt;Terms Related to "{search.toString()}"&lt;/h2&gt;{html_}'
    html_ = self.generate_term_display(html_)
    self.display_html(self.relbrowser, html_)
    self.view_switch_rel()

</t>
<t tx="tom.20230330195652.29">class SearchBox:
    """A basic search input having a lineedit input and a pushbutton."""

    def __init__(self, commander = None):
        self.commander = commander
        self.widget = QWidget()
        self.findbox = QLineEdit()
        self.gobutton = QPushButton("Search")
        self.helpbutton = QPushButton('?')

        layout = QHBoxLayout()
        layout.addWidget(self.findbox)
        layout.addWidget(self.gobutton)
        layout.addWidget(self.helpbutton)
        self.widget.setLayout(layout)

        # These connections should be overridden by the
        # using widget or window.
        #self.change_connect(self.controller.search)

    def send_find(self):
        print(self.findbox.text())

    def change_connect(self, handler):
        try:
            self.gobutton.clicked.disconnect()
            self.findbox.returnPressed.disconnect()
        except:
            pass  # Can't disconnect if we've never been connected
        self.gobutton.clicked.connect(handler)
        self.findbox.returnPressed.connect(handler)

    def search_help_handler(self):
        FNAME = 'bk-temp.html'
        msg = self.remove_sentinels(SEARCH_HELP)
        with open(FNAME, 'w', encoding='utf-8') as f:
            f.write(msg)
        webbrowser.open_new_tab(FNAME)

    @staticmethod
    def remove_sentinels(text):
        lines = [line for line in text.splitlines()
                if not line.lstrip().startswith('#@')]
        return '\n'.join(lines)
</t>
<t tx="tom.20230330195652.3">import sys
import subprocess
import re
import os
import webbrowser
import urllib
import html
from enum import auto, IntFlag

from leo.core.leoQt import QtWidgets, QtCore, QtGui

QLineEdit = QtWidgets.QLineEdit
QMainWindow = QtWidgets.QMainWindow
QPushButton = QtWidgets.QPushButton
QRect = QtCore.QRect
QStackedWidget = QtWidgets.QStackedWidget
QTextBrowser = QtWidgets.QTextBrowser
QHBoxLayout = QtWidgets.QHBoxLayout
QVBoxLayout = QtWidgets.QVBoxLayout
QUrl = QtCore.QUrl
QWidget = QtWidgets.QWidget

QStatusBar = QtWidgets.QStatusBar
</t>
<t tx="tom.20230330195652.30">class ViewSwitcher:
    """A class to contain view-switching controls."""

    def __init__(self):
        self.widget = QWidget()
        self.button_res = QPushButton("Resources")
        self.button_subj = QPushButton("Subjects")
        self.button_rel = QPushButton('Related Terms')
        self.buttons = {RES: self.button_res,
                        SUBJ: self.button_subj,
                        REL: self.button_rel}

        layout = QHBoxLayout()
        layout.addWidget(self.button_res)
        layout.addWidget(self.button_subj)
        layout.addWidget(self.button_rel)
        self.widget.setLayout(layout)

        self.set_bold(self.button_res)

    def connect(self, handlers: dict) -&gt;None:
        """Connect signal handlers.

        Handlers are connected to the buttons in order
        of their insertion into the layout.
        """
        self.button_res.clicked.connect(handlers[RES])
        self.button_subj.clicked.connect(handlers[SUBJ])
        self.button_rel.clicked.connect(handlers[REL])

    def clear_bolds(self):
        """Set weight of all buttons back to normal."""
        for b in self.buttons.values():
            b.setStyleSheet(PB_STYLE_WEIGHT_NORMAL)

    def set_bold(self, pb):
        """Set weight of a button to bold."""
        pb.setStyleSheet(PB_STYLE_WEIGHT_BOLD)

</t>
<t tx="tom.20230330195652.31">class Item:
    """Represents a collection of attributes of interest
    for nesting search results hierarchically.
    """

    def __init__(self):
        self._unl = ''
        self.context = ''
        self.has_content = False
        self.level = 0
        self.pos = None
        self.path = []
        self.title = ''
        self.type = None
        self.url = ''

    def __str__(self):
        return f'Item: path = {self.context}, title = {self.title[:40]}'

    @property
    def unl(self):
        return self._unl

    @unl.setter
    def unl(self, value):
        """Add unl and also the corresponding context path."""
        self._unl = value
        self.path = self.make_path()
        self.context = self.make_context()

    def make_path(self):
        """Return this item's path.

        The path is a list of the parent node names.
        For example, a hierarchical structure
        Food/Recipes/Bread would become
        the list ["Food", "Recipes", "Bread"].
        """
        pth_steps = self.unl.split('--&gt;')[1:]
        return tuple(pth_steps)

    def make_context(self):
        """Return the context string for this item's path.

        For a path ('a', 'b', 'c'), the context string is
        "a/b/c".
        """
        return '/'.join(self.path)

</t>
<t tx="tom.20230330195652.32">class Controller:
    """Sends data to View panels."""

&lt;&lt; __init__ &gt;&gt;
    @others
</t>
<t tx="tom.20230330195652.33">    def __init__(self, baseview, g, c):
        """Operates on the data and communicates with
        the "View" and the "Model" (i.e., the Leo tree).

        ARGUMENTS
        g -- the Leo Global instance
        c -- the Leo commander for the current outline.
        """
        self.baseview = baseview
        self.g = g
        self.c = c
        self.resources = 0
        self.subjects = 0
        self.data = None
        self.subj_search_term = ''

    # def simulate_search(self, c = None):
        # """Return simulated search results."""
        # self.baseview.data_available(self.FIND_DATA)

</t>
<t tx="tom.20230330195652.34">def move_to_bk_start(self):
    """Find and move to the top node of the bookmarks tree.

    RETURNS
    the top node, or None if not found
    """
    global BOOKMARKS_HOME_ACTUAL
    bk_root = None
    p = self.c.rootPosition()
    while p:
        if p.h.startswith(f'{BOOKMARKS_HOME}'):
            bk_root = p
            break
        p.moveToThreadNext()

    if bk_root:
        if bk_root.h != BOOKMARKS_HOME_ACTUAL:
            BOOKMARKS_HOME_ACTUAL = bk_root.h
    return bk_root
</t>
<t tx="tom.20230330195652.35">def walk_resources(self, p, search_phrases = [], search_type = SearchType.STD):
    """Walk node subtree and return Item list.

    Create one new Item for each node for which
    the search term occurs in headline.

    Return the list of found Items.
    """

    res_items = []
    subj_items = []
    for p1 in p.subtree():
        h, b = p1.h, p1.b
        item = Item()
        item.pos = p1
        item.title = h
        item.unl = p1.get_UNL()
        item.type = RES if ':ref:' in b else SUBJ
        item.level = p1.level()

        keep = not search_phrases
        for sp in search_phrases:
            if search_type == SearchType.WORDS:
                # Only keep if match is on word boundary
                sw = sp.split()
                target_words = h.lower().split()
                if target_words == sw:
                    keep = True
                    break
                len_sw = len(sw)
                shifts = len(target_words) - len_sw + 1
                for i in range(shifts):
                    x = target_words[i:i + len_sw]
                    if x == sw:
                        keep = True
                        break
            else:
                # Keep if search phrase matches any substring
                if sp in h.lower():
                    keep = True
                    break

        if not keep:
            continue

        if item.type == RES:
            start = b.find(':ref:')
            end = b[start:].find('\n')
            if end &gt; -1:
                item.url = b[start:start + end].strip()
            else:
                item.url = b[start:].strip()
            res_items.append(item)
        else:
            subj_items.append(item)
    return res_items, subj_items

</t>
<t tx="tom.20230330195652.36">@language python
def search_resources(self):
    """
    &lt;&lt; docstring &gt;&gt;
    """
    bv = self.baseview
    sb = bv.search_box
    fb = sb.findbox

    search_terms = []
    &lt;&lt; get search terms &gt;&gt;

    g = self.g

    bk_root = self.move_to_bk_start()
    if not bk_root:
        g.es('No bookmark tree found')
        return

    res_items, subj_items = self.walk_resources(bk_root, search_terms, search_type)

    bv.resources = len(res_items)
    bv.subjects = len(subj_items)

    bv.data_available((search_terms, res_items, subj_items))
</t>
<t tx="tom.20230330195652.37">Find links and organizer nodes containing search words.

Link nodes contain a line starting with ":ref:".  Organizers
do not.

The outline is searched starting at a top-level node
whose headline starts with BOOKMARKS_HOME.

After assembling the search results, they are stored in the
parent BaseView, and bv.data_available() is called.

ARGUMENT
phrase -- a string of one or more search terms.
          A search term is either a word or a
          double-quoted string.

RETURNS
nothing -- Stores a "find_results" data structure the Baseview
           variable "model_data".

           find_results = ((&lt;search string&gt;, [Item(),*])

</t>
<t tx="tom.20230330195652.38">@language python
# Search terms may be phrases in double quotes
search_phrase = fb.text()

search_type = SearchType.STD
if search_phrase.startswith('w:'):
    search_type = SearchType.WORDS
    search_phrase = search_phrase[2:]

search_phrase_lower = search_phrase.lower()

# If there is an unmatched quote, add one to the end
if search_phrase.count('"') %2:
    search_phrase += '"'

found = TERM.split(search_phrase_lower)
search_terms = [t for t in found if t and t.strip()]

# Add equivalent words unless we have asked for exact word matches
if search_type != SearchType.WORDS:
    for term in search_terms[:]:
        if term in EQUIVALENT_WORDS:
            words = EQUIVALENT_WORDS[term]
            for wd in words:
                search_terms.append(wd)

</t>
<t tx="tom.20230330195652.39">def search_subjects(self, subject):
    """
    &lt;&lt; docstring &gt;&gt;
    """
    bk_root = self.move_to_bk_start()
    if not bk_root:
        self.g.es('No bookmark tree found')
        return

    subj_items = []
    subj_dict = {}
    term = subject.toString().lower()  # subject: QUrl
    for p1 in bk_root.subtree():
        h = p1.h
        if ':ref:' in p1.b:
            continue
        item = Item()
        item.pos = p1
        item.title = h
        item.unl = p1.get_UNL()
        item.type = SUBJ
        item.level = p1.level()
        if term not in item.unl.lower():# or len(item.unl.split('--&gt;')) &gt; 3:
            continue

        subj_dict[item.level] = item
        subj_items.append(item)
    if not subj_items: return

    subj_items.sort(key = lambda it: (it.unl, it.level))

    self.baseview.subj_term_data = (subject, subj_items)
    self.baseview.subj_term_data_available()
</t>
<t tx="tom.20230330195652.4">VERSION = '0.99'

BOOKMARKS_HOME = '@bookmark-collection'
BOOKMARKS_HOME_ACTUAL = BOOKMARKS_HOME
INDENT = '&amp;nbsp;'*5  # For lists of links
RES = 0
SUBJ = 1
REL = 2

HTML_TO_CLIP = True

WORD = r'(\w+)'
PHRASE = r'"(.*?)"'
TERM = re.compile(f'{PHRASE}|{WORD}')

# These initial colors are suitable for the tbp_dark_solarized
# but may be changed depending on the theme in use.
FG = '#839496;'
BG = '#002b36'
BBG = '#073642' # "bright" bg for pushbuttons and line edits

PB_STYLE_WEIGHT_BOLD = 'QPushButton {font-weight: bold;}'
PB_STYLE_WEIGHT_NORMAL = 'QPushButton {font-weight: normal;}'

EQUIVALENT_WORDS = {
    'chicken': ('poultry',),
    'duck': ('poultry',),
    'goose': ('poultry',),
    'turkey': ('poultry',),
    'poultry': ('chicken', 'turkey', 'duck', 'goose'),
    'article': ('paper',),
    'paper': ('article',),
    }
</t>
<t tx="tom.20230330195652.40">Return a list of items for nodes whose headline matches the subject.

After assembling the search results, they are stored in the
BaseView, and bv.subj_term_data_available() is called.


ARGUMENT
subject -- a string

RETURNS
Nothing -- a tuple: (&lt;search term&gt;, &lt;list of Items&gt;) is stored in
           the Baseview variable "subj_term_data".

</t>
<t tx="tom.20230330195652.41">def count_all(self):
    """Return counts of all subject terms and resource nodes.

    RETURNS
    a tuple (subject_counts, resource_counts)
    """
    bk_root = self.move_to_bk_start()
    if not bk_root:
        self.g.es('No bookmark tree found')
        return (0, 0)

    res_counts = subj_counts = 0
    for p1 in bk_root.subtree():
        if ':ref: ' in p1.b:
            res_counts += 1
        else:
            subj_counts += 1

    return res_counts, subj_counts
</t>
<t tx="tom.20230330195652.42">def handle_rel_browser_anchor_click(self, ref):
    """Click handler for "Related" tab anchor clicks.

       ref must contain a relative UNL.

       ARGUMENT
       ref -- the QUrl contained in the clicked anchor.
    """
    # Find children of clicked term and extract their :ref: urls
    bv = self.baseview
    ref_st = ref.toString()
    unl = ref_st.replace('--%3E', '--&gt;')  # Might contain "--%3E" instead of "--&gt;"
    p0 = positionFromRelUnl(self.c, unl)
    if not p0:
        self.g.es('not found:', unl)
        return

    &lt;&lt; create resource links &gt;&gt;
    have_links = len(entries) &gt; 0
    &lt;&lt; create subject links &gt;&gt;

    bv.view_switch(RES)

</t>
<t tx="tom.20230330195652.43">entries = []
for p in p0.children:
# for p in p0.subtree:
    url = urlFromRef(p)
    title = p.h
    entries.append((url, title))
entries.sort(key = lambda x: x[1])

html = ''
for i, (url, title) in enumerate(entries):
    if not url:
        continue
    if i &gt; 0 and i % 7 == 0:
        html += '&lt;br&gt;\n'
    title = truncate(title, 60)
    anchor = f'&lt;a href="{url}"&gt;{title}&lt;/a&gt;&lt;br&gt;\n'
    html += anchor
loc = unl.find('--&gt;', 2)
context = unl[loc + 3:].replace('--&gt;', '/')
context_anchors = path2unl_anchors(context.split('/'), True)
html = f"&lt;h3&gt;Links For {context_anchors}&lt;/h3&gt;\n" + html
html = bv.generate_term_display(html)
bv.display_html(bv.resbrowser, html)
</t>
<t tx="tom.20230330195652.44">
</t>
<t tx="tom.20230330195652.5">@language python
def color_styles(fg, bg, bbg):
    styles = f"""QTextBrowser
        {{font-family: "Open Sans", "Segoe UI", Verdana, "Bitstream Vera Sans", sans-serif;}}

        QLineEdit {{
        padding-left: .5em;
        padding-right: 1em;
        border: 1px solid {fg};}}
    """


    base_style = f"""* {{
        color: {fg};
        background: {bg};
        font-family: "Segoe UI", Verdana, Arial, "Bitstream Vera Sans", sans-serif;
        font-size: 9pt;
        font-weight: normal;
        padding-left:2em;
        padding-right:2em;
     }}

     QTextBrowser {{
        border: 1px solid {fg};
        padding-left: 1em;
        padding-right:1em;
     }}

    QScrollBar:vertical {{
        width: 12px;
        border: 1px solid {bg};
        margin: 22px 0px 22 0px
    }}
    QScrollBar::hover:vertical{{
        background: {fg};
    }}

    QScrollBar::handle:vertical {{
        min-height: 20px;
        subcontrol-origin: padding;
    }}

    QScrollBar::sub-line:vertical {{
        background: {fg};
        height: 20px;
        border: 1px solid black;
        subcontrol-position: top;
        subcontrol-origin: margin;
    }}
    QScrollBar::add-line:vertical {{
        background: {fg};
        border: 1px solid black;
        height: 20px;
        subcontrol-position: bottom;
        subcontrol-origin: margin;
    }}

    QScrollBar::up-arrow:vertical {{
        height: 20px;
    }}
    QScrollBar::down-arrow:vertical {{
        height: 20px;
    """

    html_css = f'''&lt;style type='text/css'&gt;
    a {{
        color: {fg};
        text-decoration: none;
        font-size: 10pt;
    }}
    li {{
        list-style:none;
        margin-left: -2em;
    }}
    hr {{border: 3px solid {fg};}}
&lt;/style&gt;\n
'''

    pb_style_ext = f'''QPushButton {{
        background: {bbg};
        padding-bottom: .3em;
        border: 1px solid {fg};
    }}
        QPushButton:hover {{
        color: {bg};
        background: {fg};
        }}
    '''

    le_style_ext = f'''QLineEdit {{
        padding-left: .5em;
        padding-right: 1em;
        border: 1px solid {fg};
    }}'''

    return (styles, base_style, html_css, pb_style_ext, le_style_ext)

</t>
<t tx="tom.20230330195652.6"># Use this function instead of os.startfile(), since startfile() does not
# exist on Linux/MacOS.
# See https://stackoverflow.com/questions/17317219/is-there-an-platform-independent-equivalent-of-os-startfile
def open_file(filename):
    try:
        os.startfile(filename)  # Windows only
    except Exception as e:
        print(e)
        opener = "open" if sys.platform == "darwin" else "xdg-open"
        subprocess.call([opener, filename])
</t>
<t tx="tom.20230330195652.7">def path2unl_anchors(path, bold = False):
    """Return an html string of a context string for the path.

    Each step of the context has an anchor with its UNL.

    ARGUMENT
    path -- a sequence of path steps (e.g., ['a', 'b', 'c'])

    RETURNS
    a string
    """
    html_ = context = ''
    unl = f'unl://#{BOOKMARKS_HOME_ACTUAL}'
    stress = '&lt;b&gt;' if bold else ''
    stress_end = '&lt;/b&gt;' if bold else ''
    for n, step in enumerate(path):
        if n == 0:
            context += step
        else:
            context = '/' + step
        unl += '--&gt;' + step
        unl = unl.replace('"', '%22')
        html_ += (f'&lt;a href="{unl}"&gt;{stress}{context}{stress_end}&lt;/a&gt;\n')
    return html_
</t>
<t tx="tom.20230330195652.8">def positionFromRelUnl(c, unl):
    """Return node's position from its relative UNL in current outline.

       Does not move to the position
       UNLs must not have index values into the body text.  The UNL syntax
       is not checked.

       A relative UNL must look like this:

           UNL = 'unl://#@chapters--&gt;@chapter Leo--&gt;Leo-specific--&gt;Type of Editor'

       ARGUMENTS
       c -- the commander for the relative UNL
       unl -- the relative UNL

       RETURNS
       The position object for the UNL or None.
    """
    unl_body = unl.replace('unl://#', '')
    steps = unl_body.split('--&gt;')
    p1 = c.hiddenRootNode
    for step in steps:
        for p2 in p1.children:
            if p2.h == step:
                p1 = p2
                break
        else:
            return None
    return p2
</t>
<t tx="tom.20230330195652.9">def urlFromRef(p):
    """Return a url contained in a line that starts with ":ref:".

    ARGUMENT
    p -- the position of a node containing the :ref: line.

    RETURNS
    the url as a string, or "".  Leading and trailing whitespace is removed.
    """
    b = p.b
    start = b.find(':ref:')
    if start == -1:
        return ""
    start += len(':ref:')
    end = b[start:].find('\n')
    if end &gt; -1:
        url = b[start:start + end].strip()
    else:
        url = b[start:].strip()

    return url
</t>
<t tx="tom.20230503133741.1"></t>
<t tx="tom.20230503133801.1">SEARCH_HELP = """\
&lt;&lt; search help message &gt;&gt;
"""</t>
<t tx="tom.20230503134408.1">&lt;head&gt;
&lt;style type='text/css'&gt;
    h1 {font-size: 140%;}
    h2 {font-size: 125%;}
    h3 {font-size: 115%;}
&lt;/style&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;div&gt;
&lt;h1&gt;Using The Search Box&lt;/h1&gt;
&lt;h2&gt;Search Phrase&lt;/h2&gt;
Press &lt;i&gt;&amp;lt;ENTER&amp;gt;&lt;/i&gt; or the &lt;i&gt;Search&lt;/i&gt; Button after entering a search
phrase into the search box.
&lt;ul&gt;
    &lt;li&gt;All space-separated parts of the search phrase will be searched for.&lt;/li&gt;
    &lt;li&gt;Searches are case-insensitive&lt;/li&gt;
    &lt;li&gt;A string in quotes will be searched for as is, even if it 
        contains spaces.&lt;/li&gt;
    &lt;li&gt;To search for a word match, start the search phrase with "w:"&lt;/li&gt;
&lt;/ul&gt;

&lt;h3&gt;Examples&lt;/h3&gt;
&lt;p&gt;
&lt;i&gt;mill&lt;/i&gt; will find "&lt;b&gt;mill&lt;/b&gt;", "&lt;b&gt;mill&lt;/b&gt;s", "&lt;b&gt;mill&lt;/b&gt;stone", " Don Ca&lt;b&gt;mill&lt;/b&gt;o: The Books in English", etc.&lt;/p&gt;

&lt;p&gt;&lt;i&gt;w:mill&lt;/i&gt; will match "Bob's Red &lt;b&gt;Mill&lt;/b&gt;", "Artisan &lt;b&gt;Mill&lt;/b&gt; Goods from Organic Heirloom Grains ", etc.&lt;/p&gt;

&lt;p&gt;&lt;i&gt;mill biscuit&lt;/i&gt; will match all &lt;i&gt;mill&lt;/i&gt; instances &lt;b&gt;and&lt;/b&gt; all &lt;i&gt;biscuit&lt;/i&gt; instances.&lt;/p&gt;

&lt;p&gt;&lt;i&gt;"don camillo"&lt;/i&gt; will match &lt;i&gt;&lt;b&gt;Don Camillo&lt;/b&gt;: The Books in English&lt;/i&gt; 
and &lt;i&gt;&lt;b&gt;Don Camillo&lt;/b&gt;'s Dilemma&lt;/i&gt;.&lt;/p&gt;
&lt;/div&gt;
</t>
<t tx="tom.20230504113411.1">class SearchType(IntFlag):
    STD = auto()
    WORDS = auto()
    AND = auto()</t>
<t tx="tom.20230505072853.1"># Body font to use when the Bookmarks tab is open
CSS = """\
QTextBrowser {
    font-family: Corbel, Verdana, "Open Sans", Sans-serif; 
    font-size: 12pt;
}"""
</t>
<t tx="tom.20230505072902.1">def toggle_app_tab(log, tabname):
    """Create or remove our app's tab.
    
    ARGUMENTS
    log -- the log panel object for this outline.
    tabname -- a string to use as the display name of our tab.
    """
    WIDGET_NAME = f'{tabname}-widget'
    VISIBLE = f'{tabname}-visible'
    LOADED = f'{tabname}-loaded'

    # If our tab is visible, remove it
    if log.contentsDict.get(VISIBLE, False):
        log.deleteTab(tabname)
        log.contentsDict[VISIBLE] = False
        font = c.config.getColor('font-family')
        editor = c.frame.body.wrapper.widget
        editor.setStyleSheet(f'QTextBrowser {{font-family: {font};}}')
    else:
        # Show our tab, reusing our widget if already loaded
        if log.contentsDict.get(LOADED, False):
            log.createTab(tabname,
                          widget = log.contentsDict[WIDGET_NAME],
                          createText = False)
            log.contentsDict[VISIBLE] = True
            log.selectTab(tabname)
        else:
            # Create our widget for the first time
            w = PanelWidget(g, c)
            log.createTab(tabname, widget = w, createText = False)
            log.selectTab(tabname)
            log.contentsDict[LOADED] = True
            log.contentsDict[VISIBLE] = True
            log.contentsDict[WIDGET_NAME] = w

        editor = c.frame.body.wrapper.widget
        editor.setStyleSheet(CSS)
</t>
<t tx="tom.20230505073051.1">@others</t>
<t tx="tom.20230505073154.1"></t>
<t tx="tom.20230505073154.10">:title: 5 Python GUI Frameworks to Create Desktop, Web, and Even Mobile Apps. | Towards Data Science
:ref: https://towardsdatascience.com/5-python-gui-frameworks-to-create-desktop-web-and-even-mobile-apps-c25f1bcfb561
:date-added: 2022-12-01
</t>
<t tx="tom.20230505073154.100">:title: SciPy - SciPy
:ref: http://www.scipy.org/
</t>
<t tx="tom.20230505073154.101">:title: Python Extension Packages for Windows - Christoph Gohlke
:ref: http://www.lfd.uci.edu/~gohlke/pythonlibs/#scipy-stack
</t>
<t tx="tom.20230505073154.102"></t>
<t tx="tom.20230505073154.103">:title: PyWX -- Python for AOLserver
:ref: http://pywx.idyll.org/
</t>
<t tx="tom.20230505073154.104">:title: Swocket - A Modular XML Socket server in Python
:ref: http://swocket.sourceforge.net/
</t>
<t tx="tom.20230505073154.105">:title: Karrigell
:ref: http://karrigell.sourceforge.net/
</t>
<t tx="tom.20230505073154.106"></t>
<t tx="tom.20230505073154.107">:title: Returns 0.19.0 documentation
:ref: https://returns.readthedocs.io/en/latest/
:date-added: 2023-03-22

"Make your functions return something meaningful, typed, and safe!

Features
Brings functional programming to Python land
..."</t>
<t tx="tom.20230505073154.108">:title: shell - Execute terminal command from python in new terminal window? - Stack Overflow
:ref: https://stackoverflow.com/questions/19308415/execute-terminal-command-from-python-in-new-terminal-window
:date-added: 2023-01-10

This seems to be quite difficult in Linux generally - that is, if you don't know what terminal is available with the distro in use.

This link was found with the search

"python open new terminal in linux"

</t>
<t tx="tom.20230505073154.109">:title: python - Check if string has date, any format - Stack Overflow
:ref: https://stackoverflow.com/questions/25341945/check-if-string-has-date-any-format
:date-added: 2023-02-13
:seealso: unl://c:/tom/devel/zettelkasten/zettel2.leo#@zettel--&gt;Leo, Python, and Programming--&gt;@chapter Python--&gt;Date Handling--&gt;Detect If String Is A Date</t>
<t tx="tom.20230505073154.11">:title: PyScript | Run Python in your HTML
:ref: https://pyscript.net/#pyscript
:date-added: 2022-12-01
</t>
<t tx="tom.20230505073154.110">:title: How to open a python file in a new terminal window? - Raspberry Pi Forums
:ref: https://forums.raspberrypi.com/viewtopic.php?t=282796
:date-added: 2023-01-10

Specific to Raspberry Pi since it uses their lxterminal, but maybe useful more generally.
</t>
<t tx="tom.20230505073154.111">:title: Python trick: asynchronously reading subprocess pipes 
:ref: https://www.stefaanlippens.net/python-asynchronous-subprocess-pipe-reading/
:date-added: 2022-04-09
</t>
<t tx="tom.20230505073154.112">:title: Declutter python code with error handling decorators – Rina Artstain
:ref: https://rinaarts.com/declutter-python-code-with-error-handling-decorators/
:date-added: 2022-10-03
</t>
<t tx="tom.20230505073154.113">:title: Get name of current function and caller with Python - Stefaan Lippens inserts content here
:ref: https://www.stefaanlippens.net/python_inspect/
:date-added: 2022-04-02
</t>
<t tx="tom.20230505073154.114">:title: Dynamically extending APIs [dive into mark]
:ref: http://diveintomark.org/archives/2003/01/27/dynamically_extending_apis.html
</t>
<t tx="tom.20230505073154.115">:title: Network programming with the Twisted framework, Part 1
:ref: http://www-106.ibm.com/developerworks/linux/library/l-twist1.html
</t>
<t tx="tom.20230505073154.116">:title: PEP 8 -- Style Guide for Python Code
:ref: http://www.python.org/peps/pep-0008.html
</t>
<t tx="tom.20230505073154.117">:title: Using Python Generators
:ref: http://www.dabeaz.com/generators/Generators.pdf
</t>
<t tx="tom.20230505073154.118">:title: Compiling Python Code
:ref: http://effbot.org/zone/python-compile.htm
</t>
<t tx="tom.20230505073154.119">:title: How to Use UTF-8 with Python (evanjones.ca)
:ref: http://www.evanjones.ca/python-utf8.html
</t>
<t tx="tom.20230505073154.12">:title: Install/Upgrade Python 3.10 on Linux Mint 20 LTS - LinuxCapable
:ref: https://www.linuxcapable.com/how-to-install-python-3-10-on-linux-mint-20/
:date-added: 2022-09-19

Also need to install pip - https://bootstrap.pypa.io/get-pip.py

Download and run with the Python installation you need pip for: get-pip.py

Alternatively, run (if you have it; it comes with standard installs) -

python -m ensurepip --upgrade</t>
<t tx="tom.20230505073154.120">:title: 9.4. Unicode
:ref: http://www.diveintopython.net/xml_processing/unicode.html
</t>
<t tx="tom.20230505073154.121">:title: Dryice Liu’s Blog - reading utf-8 file in Python
:ref: http://dryice.name/blog/python/reading-utf-8-file-in-python/
</t>
<t tx="tom.20230505073154.122">:title: Determine size of console window on Windows « Python recipes « ActiveState Code
:ref: http://code.activestate.com/recipes/440694-determine-size-of-console-window-on-windows/
</t>
<t tx="tom.20230505073154.123"></t>
<t tx="tom.20230505073154.124">:title: python - Getting the docstring from a function - Stack Overflow
:ref: https://stackoverflow.com/questions/713138/getting-the-docstring-from-a-function
:date-added: 2023-03-25
</t>
<t tx="tom.20230505073154.125"></t>
<t tx="tom.20230505073154.126">:title: PySimpleGUI
:ref: https://github.com/PySimpleGUI/PySimpleGUI/blob/master/PySimpleGUIQt/PySimpleGUIQt.py
:date-added: 2023-03-12
</t>
<t tx="tom.20230505073154.127">:title: anygui - Generic GUI for Python
:ref: http://anygui.sourceforge.net/
</t>
<t tx="tom.20230505073154.128">:title: ASPN Python Cookbook Finite State Machine (FSM)
:ref: http://aspn.activestate.com/ASPN/Cookbook/Python/Recipe/146262
</t>
<t tx="tom.20230505073154.129">:title: Bicycle Repair Man!
:ref: http://bicyclerepair.sourceforge.net/
</t>
<t tx="tom.20230505073154.13">:title: ASPN Cookbook Python Cookbook
:ref: http://aspn.activestate.com/ASPN/Python/Cookbook/
</t>
<t tx="tom.20230505073154.130">:title: Boa Constructor home
:ref: http://boa-constructor.sourceforge.net/
</t>
<t tx="tom.20230505073154.131">:title: Dave's Page
:ref: http://www.rexx.com/~dkuhlman/
</t>
<t tx="tom.20230505073154.132">:title: Distributing Python Programs
:ref: http://www.mcmillan-inc.com/install1.html
</t>
<t tx="tom.20230505073154.133">:title: py2exe
:ref: http://starship.python.net/crew/theller/py2exe/
</t>
<t tx="tom.20230505073154.134">:title: Pyco - Tiny Python Distributions
:ref: http://www.pythonapocrypha.com/projects/pyco/
</t>
<t tx="tom.20230505073154.135">:title: PyRXP - a fast, validating XML parser for Python
:ref: http://www.reportlab.com/xml/pyrxp.html
</t>
<t tx="tom.20230505073154.136">:title: SourceForge.net Project Info - Python Plugin for the Eclipse platform
:ref: http://sourceforge.net/projects/pyeclipse/
</t>
<t tx="tom.20230505073154.137">:title: PythonJournal 2(2) Python Code Animator: PySpy
:ref: http://pythonjournal.cognizor.com/pyj2.2/PySpy7.html
</t>
<t tx="tom.20230505073154.138">:title: ::: procoders.net :::
:ref: http://pythonmagick.procoders.net/
</t>
<t tx="tom.20230505073154.139">:title: Python things
:ref: http://crit.org/http://lfw.org/python/
</t>
<t tx="tom.20230505073154.14">:title: 276494 - Using Python Scripts with IIS
:ref: http://support.microsoft.com/default.aspx?scid=kb%3Ben-us%3B276494
</t>
<t tx="tom.20230505073154.140">:title: Zope.org - Python Scripting For .NET
:ref: http://zope.org/Members/Brian/PythonNet/
</t>
<t tx="tom.20230505073154.141">:title: OpenOffice.org
:ref: http://udk.openoffice.org/python/python-bridge.html
</t>
<t tx="tom.20230505073154.142">:title: SPE - Stani's Python Editor
:ref: http://spe.pycs.net/
</t>
<t tx="tom.20230505073154.143">:title: downloads.effbot.org www.effbot.org
:ref: http://effbot.org/downloads/index.cgi/xmltoys-1.0a5-20020412.zip/README
</t>
<t tx="tom.20230505073154.144">:title: PIDDLE
:ref: http://piddle.sourceforge.net/
</t>
<t tx="tom.20230505073154.145">:title: Python Editor for Eclipse
:ref: http://pe4eclipse.sourceforge.net/
</t>
<t tx="tom.20230505073154.146"></t>
<t tx="tom.20230505073154.147">:title: asynchttp - Asynconronous HTTP Client
:ref: http://asynchttp.sourceforge.net/
</t>
<t tx="tom.20230505073154.148">:title: Ned Batchelder: Cog
:ref: http://nedbatchelder.com/code/cog/
</t>
<t tx="tom.20230505073154.149"></t>
<t tx="tom.20230505073154.15">:title: Python IAQ Infrequently Answered Questions
:ref: http://www.norvig.com/python-iaq.html
</t>
<t tx="tom.20230505073154.150">:title: FrontPage - PyXML Wiki
:ref: http://twistedmatrix.com/users/jh.twistd/xml-sig/moin.cgi/
</t>
<t tx="tom.20230505073154.151">:title: WyPy: A Minimal 18 Line Python Wiki
:ref: http://infomesh.net/2003/wypy/
</t>
<t tx="tom.20230505073154.152">:title: Wy.Py - Eleven Lines of Wikiness
:ref: http://miscoranda.com/76
</t>
<t tx="tom.20230505073154.153">:title: TeudProject - PoundPython Wiki
:ref: http://twistedmatrix.com/users/jh.twistd/python/moin.cgi/TeudProject
</t>
<t tx="tom.20230505073154.154"></t>
<t tx="tom.20230505073154.155">:title: XML.com: Simple XML Processing With elementtree [Feb. 12, 2003]
:ref: http://www.xml.com/pub/a/2003/02/12/py-xml.html
</t>
<t tx="tom.20230505073154.156">:title: (OPML) Parsing an XML Document
:ref: https://pymotw.com/3/xml.etree.ElementTree/parse.html
:date-added: 2022-09-01
</t>
<t tx="tom.20230505073154.157">:title: opyml
:ref: https://github.com/Holllo/opyml
:date-added: 2022-09-01
</t>
<t tx="tom.20230505073154.158">:title: DOM Standards compliance
:ref: http://pyxml.sourceforge.net/topics/compliance.html
</t>
<t tx="tom.20230505073154.159">:title: Pxdom
:ref: http://www.doxdesk.com/software/py/pxdom.html
</t>
<t tx="tom.20230505073154.16"></t>
<t tx="tom.20230505073154.160">:title: RELAX NG with Python
:ref: http://uche.ogbuji.net/akara/nodes/2003-12-30/relaxng-python?xslt=/akara/akara.xslt
</t>
<t tx="tom.20230505073154.161">:title: XML.com: Three More For XML Output
:ref: http://www.xml.com/pub/a/2003/10/15/py-xml.html
</t>
<t tx="tom.20230505073154.162"></t>
<t tx="tom.20230505073154.163">:title: entrian.com - PyMeld - Introduction
:ref: http://www.entrian.com/PyMeld/
</t>
<t tx="tom.20230505073154.164"></t>
<t tx="tom.20230505073154.165">:title: xmltramp: Make XML documents easily accessible.
:ref: http://www.aaronsw.com/2002/xmltramp/
</t>
<t tx="tom.20230505073154.166">:title: Beautiful Soup
:ref: http://www.crummy.com/software/BeautifulSoup/
</t>
<t tx="tom.20230505073154.167"></t>
<t tx="tom.20230505073154.168">:title: Home - PythonSecurity.org
:ref: http://www.pythonsecurity.org/
</t>
<t tx="tom.20230505073154.169">:title: brool » The Tiniest Lisp (in Python)
:ref: http://www.brool.com/index.php/the-tiniest-lisp-in-python
</t>
<t tx="tom.20230505073154.17"></t>
<t tx="tom.20230505073154.170">:title: Python Extension Packages for Windows - Christoph Gohlke
:ref: http://www.lfd.uci.edu/~gohlke/pythonlibs/
</t>
<t tx="tom.20230505073154.171"></t>
<t tx="tom.20230505073154.172">:title: Python-Unicode-Collation-Algorithm/pyuca.py
:ref: https://github.com/href/Python-Unicode-Collation-Algorithm/blob/master/pyuca/pyuca.py
</t>
<t tx="tom.20230505073154.173">:title: blist
:ref: https://pypi.org/project/blist/
</t>
<t tx="tom.20230505073154.18">:title: Python Web Services
:ref: http://pywebsvcs.sourceforge.net/
</t>
<t tx="tom.20230505073154.19"></t>
<t tx="tom.20230505073154.2"></t>
<t tx="tom.20230505073154.20">:title: PyXML
:ref: http://pyxml.sourceforge.net/
</t>
<t tx="tom.20230505073154.21">:title: XML.com: XML Data Bindings in Python [Jun. 11, 2003]
:ref: http://www.xml.com/pub/a/2003/06/11/py-xml.h_l?page=1
</t>
<t tx="tom.20230505073154.22">:title: XML.com: Proper XML Output in Python
:ref: http://www.xml.com/lpt/a/2002/11/13/py-xml.h_l
</t>
<t tx="tom.20230505073154.23">:title: online.effbot.org
:ref: http://online.effbot.org/#unicode-html
</t>
<t tx="tom.20230505073154.24"></t>
<t tx="tom.20230505073154.25">:title: Albatross - a Toolkit for Stateful Web Applications - Object Craft
:ref: http://www.object-craft.com.au/projects/albatross/
</t>
<t tx="tom.20230505073154.26">:title: What is PEAK?
:ref: http://peak.telecommunity.com/Articles/WhatisPEAK.html</t>
<t tx="tom.20230505073154.27">:title: PyProtocols
:ref: http://peak.telecommunity.com/PyProtocols.html
</t>
<t tx="tom.20230505073154.28"></t>
<t tx="tom.20230505073154.29">:title: PyQt. How to shoot yourself in the foot
:ref: http://enki-editor.org/2014/08/23/Pyqt_mem_mgmt.html
</t>
<t tx="tom.20230505073154.3">:title: xmLP - A Literate Programming Tool for XML
:ref: http://xmlp.sourceforge.net/
</t>
<t tx="tom.20230505073154.30">:title: python - Draw vertical lines on QTextEdit in PyQt - Stack Overflow
:ref: https://stackoverflow.com/questions/30371613/draw-vertical-lines-on-qtextedit-in-pyqt
:date-added: 2022-04-21
</t>
<t tx="tom.20230505073154.31">:title: pyzo - paint indent guides
:ref: https://github.com/pyzo/pyzo/blob/main/pyzo/codeeditor/extensions/appearance.py
:date-added: 2022-04-21
</t>
<t tx="tom.20230505073154.32"></t>
<t tx="tom.20230505073154.33">:title: TkDocs - Tkinter Class API Reference
:ref: https://tkdocs.com/pyref/index.html
:date-added: 2022-04-12
</t>
<t tx="tom.20230505073154.34">:title: Dialog Windows ::: An Introduction to Tkinter ::: www.effbot.org
:ref: http://tkinter.programujte.com/tkinter-dialog-windows.htm
:date-added: 2022-05-19
</t>
<t tx="tom.20230505073154.35">:title: tk_html_widgets
:ref: https://github.com/paolo-gurisatti/tk_html_widgets
:date-added: 2022-04-12
</t>
<t tx="tom.20230505073154.36"></t>
<t tx="tom.20230505073154.37">:title: Cheetah - The Python-Powered Template Engine
:ref: http://www.cheetahtemplate.org/learn.html
</t>
<t tx="tom.20230505073154.38">:title: CherryPy Less code, more power
:ref: http://www.cherrypy.org/
</t>
<t tx="tom.20230505073154.39"></t>
<t tx="tom.20230505073154.4">:title: xmLP
:ref: http://about.reuters.com/researchandstandards/firstcontact/xmlp/
</t>
<t tx="tom.20230505073154.40">:title: developerWorks Web services Getting started with PyXPCOM, Part 3
:ref: http://www-106.ibm.com/developerworks/webservices/library/co-pyxp3/
</t>
<t tx="tom.20230505073154.41"></t>
<t tx="tom.20230505073154.42">:title: Home of Pytalk
:ref: http://pytalk.sourceforge.net/
</t>
<t tx="tom.20230505073154.43">:title: PyGeo Home
:ref: http://home.netcom.com/~ajs/index.html
</t>
<t tx="tom.20230505073154.44">:title: Twisted Matrix Enterprises
:ref: http://twistedmatrix.com/index.epy
</t>
<t tx="tom.20230505073154.45">:title: VPython
:ref: http://www.vpython.org/
</t>
<t tx="tom.20230505073154.46">:title: Webware for Python
:ref: http://webware.sourceforge.net/
</t>
<t tx="tom.20230505073154.47">:title: SourceForge.net: Project Info - The MayaVi Data Visualizer
:ref: http://sourceforge.net/projects/mayavi/
</t>
<t tx="tom.20230505073154.48"></t>
<t tx="tom.20230505073154.49">:title: ASPN Python Cookbook Finite State Machine (FSM)
:ref: http://aspn.activestate.com/ASPN/Cookbook/Python/Recipe/146262
</t>
<t tx="tom.20230505073154.5">:title: Literate Programming (Norman Walsh DocBook-based)
:ref: http://docbook.sourceforge.net/projects/litprog/index.html
</t>
<t tx="tom.20230505073154.50">:title: developerWorks XML zone Tip Using generators
:ref: http://www-106.ibm.com/developerworks/xml/library/x-tipgenr.html
</t>
<t tx="tom.20230505073154.51">:title: Webizing Python - Slide list
:ref: http://www.w3.org/2002/Talks/0206-python/Overview.html
</t>
<t tx="tom.20230505073154.52">:title: Publications of David Mertz
:ref: http://gnosis.cx/publish/
</t>
<t tx="tom.20230505073154.53">:title: Markov poetry [dive into mark]
:ref: http://diveintomark.org/archives/2003/01/27/markov_poetry.html
</t>
<t tx="tom.20230505073154.54">:title: Are Dynamic Languages Going to Replace Static Languages?
:ref: http://www.artima.com/weblogs/viewpost.jsp?thread=4639
</t>
<t tx="tom.20230505073154.55">:title: Bruce Eckel's MindView, Inc 5-2-03 Strong Typing vs. Strong Testing
:ref: http://mindview.net/WebLog/log-0025
</t>
<t tx="tom.20230505073154.56">:title: Charming Python Iterators and simple generators
:ref: http://www-106.ibm.com/developerworks/library/l-pycon.html
</t>
<t tx="tom.20230505073154.57">:title: developerWorks Web services The Python Web services developer RSS for Python
:ref: http://www-106.ibm.com/developerworks/webservices/library/ws-pyth11.html
</t>
<t tx="tom.20230505073154.58">:title: Python Success Stories brochure
:ref: http://python.oreilly.com/news/python_success_stories.pdf
</t>
<t tx="tom.20230505073154.59">:title: Sean McGrath, CTO, Propylon
:ref: http://seanmcgrath.blogspot.com/#200001117
</t>
<t tx="tom.20230505073154.6">:title: Literate Programming with XML
:ref: http://literatexml.sourceforge.net/
</t>
<t tx="tom.20230505073154.60">:title: XML.com Generating DOM Magic [Jan. 08, 2003]
:ref: http://www.xml.com/pub/a/2003/01/08/py-xml.html
</t>
<t tx="tom.20230505073154.61"></t>
<t tx="tom.20230505073154.62">:title: Text Processing in Python - Chapter 4
:ref: http://gnosis.cx/TPiP/chap4.txt
</t>
<t tx="tom.20230505073154.63">:title: The Hitchhiker’s Guide to Python! — The Hitchhiker's Guide to Python
:ref: https://docs.python-guide.org/
</t>
<t tx="tom.20230505073154.64"></t>
<t tx="tom.20230505073154.65">:title: http--liko.home.cern.ch-liko-Manuals-Python-inst.pdf
:ref: http://liko.home.cern.ch/liko/Manuals/Python/inst.pdf
</t>
<t tx="tom.20230505073154.66">:title: Instructions for Python Extensions with GCC-mingw32
:ref: http://starship.python.net/crew/kernr/mingw32/Notes.html
</t>
<t tx="tom.20230505073154.67">:title: Python headers for Mingw32
:ref: http://www.infoservice.lg.ua/~paul/devel/python_headers.html
</t>
<t tx="tom.20230505073154.68">:title: The Whole Python FAQ (bulding extension modules - error)
:ref: http://www.python.org/doc/FAQ.html
</t>
<t tx="tom.20230505073154.69">:title: 6 Building Extensions: Tips and Tricks
:ref: http://www.python.org/doc/2.3.2/inst/tweak-flags.html
</t>
<t tx="tom.20230505073154.7">:title: Literate Programming
:ref: http://www.literateprogramming.com/
</t>
<t tx="tom.20230505073154.70"></t>
<t tx="tom.20230505073154.71">:title: Welcome to Codon
:ref: https://docs.exaloop.io/codon/
:date-added: 2023-03-19

Python compiled to assembly.

NOTE: "Codon currently uses ASCII strings unlike Python's unicode strings."</t>
<t tx="tom.20230505073154.72">:title: GitHub - exaloop/codon: A high-performance, zero-overhead, extensible Python compiler using LLVM
:ref: https://github.com/exaloop/codon
:date-added: 2023-03-19
</t>
<t tx="tom.20230505073154.73">:title: Numba: A High Performance Python Compiler
:ref: https://numba.pydata.org
:date-added: 2023-03-19
</t>
<t tx="tom.20230505073154.74"></t>
<t tx="tom.20230505073154.75">:title: dB-API modules
:ref: http://home.t-online.de/home/err666/
</t>
<t tx="tom.20230505073154.76"></t>
<t tx="tom.20230505073154.77">:title: setup.py vs requirements.txt · caremad
:ref: https://caremad.io/posts/2013/07/setup-vs-requirement/
:date-added: 2022-04-26
</t>
<t tx="tom.20230505073154.78"></t>
<t tx="tom.20230505073154.79"></t>
<t tx="tom.20230505073154.8">:title: pycco
:ref: http://fitzgen.github.com/pycco/
</t>
<t tx="tom.20230505073154.80">:title: Leo's Home Page
:ref: http://www.leoeditor.com/
</t>
<t tx="tom.20230505073154.81">:title: Google Groups - Leo - How did we ever live without mypy?
:ref: https://groups.google.com/g/leo-editor/c/2CYrw4CWenU
:date-added: 2022-08-18

How to configure and use mypy with Leo.
</t>
<t tx="tom.20230505073154.82"></t>
<t tx="tom.20230505073154.83">:title: Python Journal thru 3(1), Volume 3, Issue 1, c. 2002
:ref: http://pythonjournal.cognizor.com/
</t>
<t tx="tom.20230505073154.84"></t>
<t tx="tom.20230505073154.85">:title: Evangelizing Java
:ref: http://www.freeroller.net/page/alexkrut/20030518#using_jython_to_define_cocoon
</t>
<t tx="tom.20230505073154.86">:title: Jython Interactive Servlet Console
:ref: http://vgoenka.tripod.com/jython/jython_index.html
</t>
<t tx="tom.20230505073154.87">:title: Introduction to Jython
:ref: http://www.developer.com/open/article.php/10930_2170111_1
</t>
<t tx="tom.20230505073154.88"></t>
<t tx="tom.20230505073154.89">:title: Things I Wish They Told Me About Multiprocessing in Python
:ref: https://www.cloudcity.io/blog/2019/02/27/things-i-wish-they-told-me-about-multiprocessing-in-python/
:date-added: 2022-06-03
</t>
<t tx="tom.20230505073154.9"></t>
<t tx="tom.20230505073154.90"></t>
<t tx="tom.20230505073154.91">:title: Packaging Python Projects — Python Packaging User Guide
:ref: https://packaging.python.org/en/latest/tutorials/packaging-projects/
:date-added: 2023-02-06
</t>
<t tx="tom.20230505073154.92">:title: pipx
:ref: https://pypa.github.io/pipx/
:date-added: 2023-02-06
</t>
<t tx="tom.20230505073154.93"></t>
<t tx="tom.20230505073154.94">:title: Home — Spyder IDE
:ref: https://www.spyder-ide.org
:date-added: 2023-03-20

"Spyder is a free and open source scientific environment written in Python, for Python, and designed by and for scientists, engineers and data analysts. It features a unique combination of the advanced editing, analysis, debugging, and profiling functionality of a comprehensive development tool with the data exploration, interactive execution, deep inspection, and beautiful visualization capabilities of a scientific package."</t>
<t tx="tom.20230505073154.95">:title: CodraFT | The Codra Filtering Tool, an open-source Signal and Image Processing Software
:ref: https://codra-ingenierie-informatique.github.io/CodraFT/
:date-added: 2023-03-20
</t>
<t tx="tom.20230505073154.96">:title: A ~5 minute guide to Numba
:ref: https://numba.readthedocs.io/en/0.56.0/user/5minguide.html
:date-added: 2022-08-19
</t>
<t tx="tom.20230505073154.97"></t>
<t tx="tom.20230505073154.98">:title: pandas.Series — pandas 1.4.2 documentation
:ref: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.html
:date-added: 2022-05-02
</t>
<t tx="tom.20230505073154.99">:title: DataFrame — pandas 1.4.2 documentation
:ref: https://pandas.pydata.org/pandas-docs/stable/reference/frame.html
:date-added: 2022-05-02
</t>
<t tx="tom.20230505073354.1"></t>
<t tx="tom.20230505073354.10"></t>
<t tx="tom.20230505073354.11">@language python
"""A command to create a new bookmark node from a URL in the clipboard.

Gets the page title from the &lt;TITLE&gt; element, or from the first
&lt;H1&gt; element.  The title becomes the headline of the new node,
and is also written into the node body.  The URL of the page is
written into the node body.

Note that some pages write the title into the page 
using a script, and these titles cannot be found.

This procedure does not follow 301 redirects.
"""
import re
from urllib.request import urlopen, Request, HTTPError, URLError
from http.client import IncompleteRead
from html import unescape
from urllib.parse import quote
import os.path

ENCODING = 'utf-8'
UA = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'  # Some sites reject requests without an approved User Agent.
MAX_CHUNK =  0#2 * 8192  # If title is more than this far past the start,
                      # we won't find it.
UNKNOWN_URL_TYPE = '[unknown url type]'

@others

page_title = ''
url = g.app.gui.getTextFromClipboard()
page_title = getTitle(url)

if page_title:
    if page_title == UNKNOWN_URL_TYPE:
        url = url.replace('"', '')
        if os.path.exists(url):
            page_title = url
            url = 'file:///' + quote(url)
        else:
            page_title = None
    else:
        page_title = unescape(page_title)
else:
    page_title = '[make up your own title]'

if not page_title:
    g.es('Cannot understand this url')
else:
    c.executeMinibufferCommand('insert-node')
    date = gnx2date(c.p.gnx)
    c.p.b = (f':title: {page_title}\n'
             + f':ref: {url}\n'
             + f':date-added: {date}\n')
    c.p.h = page_title
    c.redraw()
</t>
<t tx="tom.20230505073354.12">def getTitle(url):
    """Return URL's page title from server.
    
    Get title from HTML header, ot from the first H1
    element with and attribute whose name includes "title", 
    otherwise from the first H1 element. Return the title 
    text as a string.
    
    If the URL is for a .pdf file, return "[make up your own title]"
    without reading the URL.
    """
    if url.endswith('pdf'):
        return "[make up your own title]"

    TITLEre = '&lt;title[^?]*&gt;(?P&lt;title1&gt;.+)&lt;/title&gt;'
    TITLE_H1re = '&lt;h1[^&gt;]*&gt;(?P&lt;title2&gt;.+)&lt;/h1&gt;'
    TITLE_H1_TITLEre = '&lt;h1[^&gt;]*title[^&gt;]*&gt;(?P&lt;title3&gt;.+)&lt;/h1&gt;' 
    BOTHre = f'{TITLEre}|{TITLE_H1_TITLEre}|{TITLE_H1re}'

    try:
        req = Request(url, headers = {'User-Agent': UA})
    except ValueError as e:
        g.es(f'{e}', color = 'red')
        return None

    try:
        f = urlopen(req)
    except URLError as e:
        return UNKNOWN_URL_TYPE
    except (HTTPError, OSError) as e:
        g.es(e, f'for "{url}"', color='yellow')
        return None

    content = None
    &lt;&lt; if status OK &gt;&gt;
    &lt;&lt; else handle errors &gt;&gt;
    f.close()

    if content:
        try:
            content_str = content.decode(ENCODING)
        except UnicodeDecodeError as e:
            g.es(e, color = 'red')
            return ''

        m = re.search(BOTHre, content_str, re.IGNORECASE)
        if not m:
            return ''
        return m.group('title1') or m.group('title3') or m.group('title3')

</t>
<t tx="tom.20230505073354.13">if f.status == 200:
    try:
        # content = f.read(MAX_CHUNK)
        content = f.read()
    except IncompleteRead as e:
        g.es(e, color='red')
</t>
<t tx="tom.20230505073354.14">elif f.status == 301:
    g.es(f'301 error: {f.reason}', color = 'red')
elif f.status == 404:
    g.es(f'404 - missing page for {url}', color = 'red')
else:
    g.es(f'{f.status}: "{f.reason}"', color = 'red')
</t>
<t tx="tom.20230505073354.15">def gnx2date(gnx):
    _, datecode, _ = gnx.split('.')
    year = datecode[:4]
    month = datecode[4:6]
    day = datecode[6:8]
    return f'{year}-{month}-{day}'

</t>
<t tx="tom.20230505073354.16">@language python
"""Check the URL of a page to see if it is working.

The URL is extracted from the line starting with ":ref:".
The host address is checked first, and if that works,
the entire URL is tried.
"""

from urllib.request import urlopen, Request, HTTPError, URLError
from urllib import parse
from http.client import IncompleteRead

ENCODING = 'utf-8'
UA = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'  # Some sites reject requests without an approved User Agent.
MAX_CHUNK = 8192

url = ''
&lt;&lt; def check_url &gt;&gt;
&lt;&lt; get url from node &gt;&gt;

succeeded = False
exists = False
msg = ''

if not url:
    g.es('Missing url')
else:
    succeeded, msg = check_url(url)
    if succeeded:
        g.es(f'OK: {url}')
    else:
        g.es(f'Bad url: {url}, checking host; {msg}')
        msg = ''
        &lt;&lt; check host &gt;&gt;
        if not exists:
            # Some servers return a 502 Bad Gateway status code for the bare host name.
            # You have to use an actual existing URL.
            g.es(f'Host problem: {host}, {msg}', color = 'red')
        else:
            g.es(f'Host url {host} works')

</t>
<t tx="tom.20230505073354.17">def check_url(url):
    """Check url and return (OK, error) tuple."""
    f = None
    try:
        req = Request(url, headers = {'User-Agent': UA})
    except ValueError as e:
        return False, e

    try:
        f = urlopen(req, timeout = 10)
    except (HTTPError, OSError, URLError) as e:
        return False, e

    content = None
    &lt;&lt; if status OK &gt;&gt;
    &lt;&lt; else handle errors &gt;&gt;
    f.close()
    if content:
        return True, None
    else:
        return False, f'Broken url: {url}'
</t>
<t tx="tom.20230505073354.18">if f.status == 200:
    try:
        content = f.read(MAX_CHUNK)
    except IncompleteRead as e:
        g.es(e, color='red')
    except Exception as e:
        g.es('Could not read content:', e)
</t>
<t tx="tom.20230505073354.19">elif f.status == 301:
    g.es(f'301 error: {f.reason}', color = 'red')
elif f.status == 404:
    g.es(f'404 - missing page for {url}', color = 'red')
else:
    g.es(f'{f.status}: "{f.reason}"', color = 'red')
</t>
<t tx="tom.20230505073354.2"></t>
<t tx="tom.20230505073354.20">lines = c.p.b.split('\n')
for line in lines:
    if line.startswith(':ref'):
        fields = line.split()
        url = fields[1] if len(fields) &gt; 1 else url
        break
</t>
<t tx="tom.20230505073354.21">parsed_parts = parse.urlparse(url)
host = parsed_parts.netloc
scheme = parsed_parts.scheme
exists, msg = check_url(f'{scheme}://{host}')
</t>
<t tx="tom.20230505073354.22">@language python
"""Find most recently created bookmark nodes.

For the Bookmarks subtree, sort by date, latest first.
"""
BOOKMARKS_HOME = '@bookmark-collection'
def move_to_bk_start():
    """Find and move to the top node of the bookmarks tree.
    
    RETURNS
    the top node, or None if not found
    """
    global BOOKMARKS_HOME_ACTUAL
    bk_root = None
    p = c.rootPosition()
    while p:
        if p.h.startswith(f'{BOOKMARKS_HOME}'):
            bk_root = p
            break
        p.moveToThreadNext()
    return bk_root

def get_pos_by_gnx(c, gnx):
    pos = None
    for p in c.all_unique_positions():
        if p.v.gnx == gnx:
            return p
    return pos

def gnx2date(gnx):
    _, datecode, _ = gnx.split('.')
    year = datecode[:4]
    month = datecode[4:6]
    day = datecode[6:8]
    return f'{year}-{month}-{day}'

bk_root = move_to_bk_start()
head = bk_root.h
ids = set()

p1 = c.p

for px in bk_root.subtree():
    ids.add((px.gnx, px.h))
id_list = sorted(list(ids))
id_list.reverse()

n = 0
for id_ in id_list[:30]:
    n += 1
    if n % 6 == 0:
        g.es()

    p0 = get_pos_by_gnx(c, id_[0])
    g.es_clickable_link(c, p0, 1, f'{gnx2date(id_[0])} {id_[1]}') 

</t>
<t tx="tom.20230505073354.23">"""Count bookmarks and subjects."""
BOOKMARKS_HOME = '@bookmark-collection'

def move_to_bk_start():
    """Find and move to the top node of the bookmarks tree.
    
    RETURNS
    the top node, or None if not found
    """
    bk_root = None
    p = c.rootPosition()
    while p:
        if p.h.startswith(f'{BOOKMARKS_HOME}'):
            bk_root = p
            break
        p.moveToThreadNext()
    return bk_root

def count_all():
    """Return counts of all subject terms and resource nodes.
    
    RETURNS
    a tuple (subject_counts, resource_counts)
    """
    res_counts = subj_counts = 0
    bk_root = move_to_bk_start()
    if bk_root:
        for p1 in bk_root.subtree():
            if ':ref: ' in p1.b:
                res_counts += 1
            else:
                subj_counts += 1
    else:
        g.es('No bookmark tree found')

    return res_counts, subj_counts

r, s = count_all()
g.es(f'{s} subject terms, {r} bookmarks')
</t>
<t tx="tom.20230505073354.24">import webbrowser

me = c.mFileName
mydir, _ = g.os_path_split(me)
docs = g.os_path_join(mydir, r'docs/html/Bookmarks_manager_Users_Guide.html')

webbrowser.open_new(docs)</t>
<t tx="tom.20230505073354.3"></t>
<t tx="tom.20230505073354.4">&amp;Toggle Bookmark Tab</t>
<t tx="tom.20230505073354.5">&amp;Toggle Bookmark Tab</t>
<t tx="tom.20230505073354.6">&amp;Create Bookmark</t>
<t tx="tom.20230505073354.7">&amp;Check Bookmark URL</t>
<t tx="tom.20230505073354.8">&amp;Open Docs
</t>
<t tx="tom.20230505073354.9">c.k.simulateCommand('bk-toggle-tab')</t>
<t tx="tom.20230505075418.1"></t>
<t tx="tom.20230505075418.10">def gnx2date(gnx):
    _, datecode, _ = gnx.split('.')
    year = datecode[:4]
    month = datecode[4:6]
    day = datecode[6:8]
    return f'{year}-{month}-{day}'
</t>
<t tx="tom.20230505075418.2">"""Import a JSON-format browser bookmarks file and convert to object(s).

This script works for Chrome-derived browsers (Chrome, Vivaldi, Brave, etc.).
It does not work for Firefox.

Turns out that the JSON module somehow uses some 700 MB of memory in
ingesting this bookmark file, and that makes it sluggish in responding
to user interactions.  So we need another approach.

It turns out that using eval() produces a dictionary directly from
the JSON data file.  This may not always be so, but apparently for the bookmarks
files it is.
"""
DATAFILE = r"C:\Users\tom\AppData\Local\Vivaldi\User Data\Default\Bookmarks"
@others

json = None
with open(DATAFILE, encoding = 'utf-8') as f:
    json = f.read()
d:dict = eval(json)

roots = d['roots']
bk = roots['bookmark_bar']
kids = bk['children']
bookmarks = kids[2]['children']  # a list of folder dicts

def walk(root, folders):
    for b in folders:
        name = b['name']
        if b['type'] == 'folder':
            url_list, folder_list = get_children(b)
            fol = root.insertAsLastChild()
            fol.h = name
            for u in url_list:
                name, url = u
                pu = fol.insertAsLastChild()
                date = gnx2date(pu.v.gnx)
                pu.h = name
                pu.b = f':title: {name}\n:ref: {url}\n:date-added: {date}'
            walk(fol, folder_list)

target = create_head_node('@bookmark-collection')
walk(target, bookmarks)
c.redraw()</t>
<t tx="tom.20230505075418.3">def get_children(folder_dict, indent = 0):
    """get child folders and urls from a dictionary representing a folder.
    
    RETURNS
    a tuple (url_list, folder_list) where
    url_list -- a list of (name, url) pairs;
    folder_list -- a list of child folder dicts.
    """
    kids: list = folder_dict.get('children', {})
    url_list = []
    folder_list = []
    for k in kids:
        name, kind = k['name'], k['type']
        if kind == 'url':
            url_list.append((name, k['url']))
        elif kind == 'folder':
            folder_list.append(k)
    return url_list, folder_list
</t>
<t tx="tom.20230505075418.4">def create_head_node(headline):
    """Create and return a new node with headline h at the end of the outline.
    
    The node will not be indented.
    """
    # Create and select target node
    p_last = c.lastVisible()
    target = p_last.insertAfter()
    target.h = headline
    target.setDirty()
    c.selectPosition(target)
    while c.canMoveOutlineLeft():
        c.executeMinibufferCommand('move-outline-left')
    c.redraw()
    return target
</t>
<t tx="tom.20230505075418.5">def gnx2date(gnx):
    _, datecode, _ = gnx.split('.')
    year = datecode[:4]
    month = datecode[4:6]
    day = datecode[6:8]
    return f'{year}-{month}-{day}'
</t>
<t tx="tom.20230505075418.6">"""Import a Firefox JSON-format browser bookmarks file and convert to object(s).

The bookmarks file must be a .json (or .jsonlz4) Firefox file.
"""
# Compessed backup:
# MOZ = r"C:\Users\tom\AppData\Roaming\Mozilla\Firefox\Profiles\pkljqg5z.default-release\bookmarkbackups\bookmarks-2023-03-25_5503_jJORXjwLWYsiZZFNviJuOw==.jsonlz4"

# Uncompressed, from using the Bookmark "Backup" menu item
MOZ = r"C:\Users\tom\Downloads\bookmarks-2023-03-27.json"

def is_container(dict_):
    return dict_['typeCode'] == 2

@others

json = ''
# Only for Firefox compressed backups:
# import lz4
# json = mozlz4_to_text(MOZ).decode('utf-8')

# For Firefox bookmarks saved with "Backup":
with open(MOZ, encoding = 'utf-8') as f:
    json = f.read()

d:dict = eval(json)
bookmarks:list = d['children'][0]['children']

def walk(root, folders):
    for b in folders:
        name = b['title']
        if is_container(b):
            url_list, folder_list = get_children(b)
            fol = root.insertAsLastChild()
            fol.h = name
            for u in url_list:
                name, url = u
                pu = fol.insertAsLastChild()
                date = gnx2date(pu.v.gnx)
                pu.h = name
                pu.b = f':title: {name}\n:ref: {url}\n:date-added: {date}'
            walk(fol, folder_list)

target = create_head_node('@bookmark-collection')
walk(target, bookmarks)
c.redraw()
</t>
<t tx="tom.20230505075418.7">"""Decompress Firefox JSON compressed backup bookmark files.

These files are located in the Firefox profile directory.

Thanks to Samuel Henderson on https://unix.stackexchange.com/questions/326897/how-to-decompress-jsonlz4-files-firefox-bookmark-backups-using-the-command-lin
"""

def mozlz4_to_text(filepath):
    # Given the path to a "mozlz4", "jsonlz4", "baklz4" etc. file, 
    # return the uncompressed text.  Returns a bytes object.
    import lz4.block
    bytestream = open(filepath, "rb")
    bytestream.read(8)  # skip past the b"mozLz40\0" header
    valid_bytes = bytestream.read()
    text = lz4.block.decompress(valid_bytes)
    return text

</t>
<t tx="tom.20230505075418.8">def get_children(folder_dict, indent = 0):
    """get child folders and urls from a dictionary representing a folder.
    
    RETURNS
    a tuple (url_list, folder_list) where
    url_list -- a list of (name, url) pairs;
    folder_list -- a list of child folder dicts.
    """
    kids: list = folder_dict.get('children', [])
    url_list = []
    folder_list = []
    for k in kids:
        name = k['title']
        kind = 'folder' if is_container(k) else 'url'
        if kind == 'url':
            url_list.append((name, k['uri']))
        elif kind == 'folder':
            folder_list.append(k)
    return url_list, folder_list
</t>
<t tx="tom.20230505075418.9">def create_head_node(headline):
    """Create and return a new node with headline h at the end of the outline.
    
    The node will not be indented.
    """
    # Create and select target node
    p_last = c.lastVisible()
    target = p_last.insertAfter()
    target.h = headline
    target.setDirty()
    c.selectPosition(target)
    while c.canMoveOutlineLeft():
        c.executeMinibufferCommand('move-outline-left')
    c.redraw()
    return target
</t>
<t tx="tom.20230505075508.1">@nocolor</t>
<t tx="tom.20230505075508.10">In the browser's bookmark manager, bookmarks are organized as trees, with some nodes being the organizing nodes and the others the actual bookmark records.  After the bookmarks have been imported into your Leo outline, there will be the same organizer and URL nodes in the same order.

Organizer nodes have a headline but normally the body will not contain any text. It is not harmful to have text in their bodies, but the bookmark manager will not make use of it.

URL (or "resource") nodes contain the actual bookmarks.  Their bodies contain at least a title, url, and data as in the following example::

    :title: Leftover Skillet Turkey Pasta
    :ref: https://anitalianinmykitchen.com/turkey-pasta-skillet/
    :date-added: 2022-12-01

The colons around the keywords *title* and *ref* are essential for the bookmark manager code.  They are inserted automatically when new bookmark nodes are created.  You can add any notes you like to the body as long as you leave the :title: and :ref: lines in place (although you can edit their contents).</t>
<t tx="tom.20230505075508.11">Here is a fragment from a bookmark tree after import into Leo.  It only shows the headlines::

    Pasta
        Pasta Alla Gricia
            Pasta Alla Gricia Recipe - NYT Cooking
            Salami Pasta Alla Gricia Recipe - NYT Cooking
        Cacio e Pepe
            Cacio e Pepe Recipe - NYT Cooking
            Cacio e Pepe (Spaghetti With Black Pepper and Pecorino Romano) Recipe
            Cacio e Pepe [GEOFFREY ZAKARIAN]
            Farro e Pepe Recipe - NYT Cooking
        Leftover Skillet Turkey Pasta
        A French onion pasta recipe that turns the soup into a one-pot meal - The Washington Post
        Buttery Lemon Pasta With Almonds and Arugula Recipe - NYT Cooking
        Chile Crisp Fettuccine Alfredo With Spinach Recipe - NYT Cooking
        Creamy Asparagus Pasta Recipe - NYT Cooking
        Seared Scallop Pasta With Burst Tomatoes and Herbs Recipe - NYT Cooking
        Crème Fraîche Pasta With Peas and Scallions Recipe - NYT Cooking</t>
<t tx="tom.20230505075508.12">@nocolor

</t>
<t tx="tom.20230505075508.13">The bookmark manager can help you find resources that you have bookmarked.  At least as important, it can help you find things you had forgotten about (or misplaced). It can help you notice connections between things that you had not realized.

The bookmark manager understands *file:///* URLs, so you can have bookmarks into your file system.  Linked files will get opened by whatever application your OS thinks it should use for that file type.

The bookmark manager understands Leo's *unl:*  links, so you can have bookmarks into Leo outlines.


</t>
<t tx="tom.20230505075508.14">If you do not want to experiment with the starter set of bookmarks that came with this outline, then import your bookmarks if you haven't already (see :ref:`Importing Bookmarks`). After a successful import, delete the starter set.  Otherwise walk through the examples in the :ref:`Finding Bookmarks` section before you import them.

**NOTE** - you can import your bookmarks now if you want.  They will be created in a top-level node below the bookmarks supplied with the outline.  The TBM will not find your bookmarks until you delete the starter set or move it below your own imported collection.

Next, open the Bookmarks menu and click on *Toggle Bookmark Tab* [f2]_.  A new tab labeled *Bookmarks* should appear in the Log pane. 

.. [f2] Or click on the *Bookmarks* button.

The new tab has a text entry box for a search string, a "Search" button, a display panel, and three buttons that act like tabs although they look a little different.  You may want to enlarge the Log pane, or even change the layout.  You will not need much vertical space for the node bodies because a bookmark's body usually has very little text.

You can move around the collection using links in the Bookmarks tab, or using Leo's own navigation commands.  You can open a bookmark's URL in a browser, or go to its node.  From a bookmark node, you can open the link using Leo's standard &lt;CTRL-Click&gt; on its URL.
</t>
<t tx="tom.20230505075508.15">This outline comes with a small collection of bookmarks  that you can use to follow along with the documentation examples.  If you want to do this, don't import your own bookmarks until you go through the section on *Finding Bookmarks*.

The starter set contains some very old bookmarks.  Some of them no longer exist.  They have been left in the starter set because it is useful to see how to check and handle them.
</t>
<t tx="tom.20230505075508.16">The bookmark collection must be stored as a subtree under a top-level node having a  headline that starts with *@bookmark-collection*.  The bookmark manager will use the **first** node with such a headline.  If you have other top-level nodes starting with *@bookmark-collection* below the first one, TBM will not search them.
</t>
<t tx="tom.20230505075508.17">
</t>
<t tx="tom.20230505075508.18">A bookmark node normally does not have any children - it is a "leaf" node.  It contains the title and URL of the bookmarked page.  The bookmark manager calls a bookmark node a "resource" node.  This comes from the name _URL_, standing for *Uniform Resource Locator*.  The bookmarked page is the "resource".

A resource node *must* contain a line starting with *:ref:*, followed by a URL.
</t>
<t tx="tom.20230505075508.19">Resource nodes are the children of what Leo users tend to call *organizer* nodes.  They usually do not have any content, but their names are hints about what kinds of concepts their children contain.  The headline of one of these nodes is called a *subject Term*.  There are also *compound subject terms*.  These are path expressions that flatten the path to the node.  For example, a hierarchy like this::

    Food
        Fruit
            Apples

would be flattened to `Food/Fruit/Apples`.  This is a compound subject term.  Each step of the path would be considered an *atomic* subject term.  Searches display both the resources and subject terms that are found.

A subject term node *must not* contain a line starting with *:ref:*.  The bookmark manager discovers whether a node is a resource or a subject term node by looking for a line starting with *:ref:*</t>
<t tx="tom.20230505075508.2">@color
@language python
from sys import executable
import subprocess
import os

# Move to the start of the document
# NOTE - selected node must be within the @path docs tree
target = None
HEAD = '@path docs'
p0 = c.p
for p in c.all_unique_positions():
    if p.h.startswith(HEAD):
        target = p
        c.selectPosition(target)
        break
if target:
    c.k.simulateCommand('rst3')
    # Thw rst3 command writes to correct (@path) directory
    # but Sphinx will look in current directory, which may
    # not be the same.  So -
    # if we start from a selected node outside the
    # @path docs tree, temporarily cd to the docs directory.
    cwd = os.getcwd()
    if not cwd.endswith('docs'):
        temp_cwd = os.path.join(cwd, 'docs')
        os.chdir(temp_cwd)

    # Other likely themes: 
    #'-D', 'html_theme=sphinx_book_theme',
    #'-D', 'html_theme=bizstyle',
    # '-D', 'html_theme=sphinx-rtd-theme',

    cmd = [executable, '-m', 'sphinx', '-C',
            '-b', 'html',
            '-D', r"master_doc=Bookmarks_manager_Users_Guide",
            '-D', 'source_suffix=.rst',
            '-D', 'html_theme=pyramid',
            '-D', 'project="Leo Bookmarks Manager"',
            '-D', 'extensions=sphinx.ext.autosectionlabel',
            '-D', "html_theme_options.sidebarwidth=25em",
            '-D', "html_title=Bookmarks Manager User's Guide",
            # sourcedir, outputdir:
            r'.', r'.\html']

    subprocess.call(cmd)
    c.selectPosition(p0)
    os.chdir(cwd)
else:
    g.es('Cannot find the @rst tree to process', color = 'red')</t>
<t tx="tom.20230505075508.20">Here is a suggested layout of Leo frames that works well for using the bookmark manager (CTRL-CLICK on the link):

.. image:: images/leo-screenshot-bookmarks.png

It would be a good idea to save the layout you decide is best.</t>
<t tx="tom.20230505075508.21">Import your bookmarks from the browser by using the *bookmarks.json* file that the browser can export.  They can be imported from Firefox and from the Chrome family of browser, which includes Chrome, Vivaldi, Brave and other browsers based on Chrome.

The two kinds of browsers use different json formats, so there are two import scripts.  They are located in the nodes *Import Chrome-family JSON Bookmarks File* and *Import Firefox Bookmarks File*.

To import your bookmarks file, select the right script for your browser type.  In the line near the top of the node, change the path to the bookmarks file to match yours::

    MOZ = r"C:\Users\tom\Downloads\bookmarks-2023-03-27.json"

Then run the script with CTRL-b. A top-level node named *@bookmark-collection* will appear in a second or less.  This is the parent node of your bookmarks.

DO NOT CHANGE THE NAME OF THIS NODE. The bookmarks code finds the bookmarks by looking for a node whose headline starts with *@bookmark-collection*.

If you run the script a second time, a new *@bookmark-collection* subtree will be created after the previous one. This will not be harmful in the sense of damaging data or making the bookmark manager fail to run. But it may be confusing when you use the bookmarks manager.  If you do this, then delete one of the two *@bookmark-collection* nodes.</t>
<t tx="tom.20230505075508.22">The mechanics for exporting bookmarks from the browser differ from one type to another.
</t>
<t tx="tom.20230505075508.23">1. Open the bookmarks management dialog using the *Bookmarks/Manage Bookmarks* menu item.
2. In the dialog, select the menu item *Import and Backup/Backup*
3. In the File/save dialog that opened, navigate to the target output directory (usually *Downloads*) and save the file as a *.json* file.
</t>
<t tx="tom.20230505075508.24">Vivaldi and other Chrome based browser do not have a menu item to export as JSON.  But they store a bookmark backup file in JSON format.  Normally, this file (on Windows) is *"%USERPROFILE%\AppData\Local\Vivaldi\User Data\Default\Bookmarks"*  On Linux, the file will be *~/.config/vivaldi/Default/Bookmarks*. (It is possible that this location may differ for different Linux distributions).

For other Chrome family browser types, the path is similar but with *vivaldi* replaced by the browser type. For example, the backup JSON file for the Brave browser has its Windows bookmark backup file at *"C:\Users\tom\AppData\Local\BraveSoftware\Brave-Browser\User Data\Default\Bookmarks"*.</t>
<t tx="tom.20230505075508.25">To save a new bookmark, copy its address (its URL) to the clipboard.  Navigate to where in the bookmarks collection you want to put it.  Then select the *Bookmarks/Create Bookmark* menu item.  This might take a few seconds if the page is large, since the TBM needs to download and examine the page to find its title.

A new node will be created containing the title, URL, and date.  You may want to use Leo's tree commands to move the new node to the right, depending on whether it was created indented or not.  Later you can move the node around if you decide you want it somewhere else, or you can clone it into some other location if that seems to make sense.

The Bookmark Manager may be unable to find a page's title.  This could happen because of poor page design.  It is not possible for the Bookmark Manager to find the title of a PDF file , and the TBM does not even try to download the file to find its title.

If no title has been found, a dummy title will be used.  You will need to edit the title and headline to change the title to something sensible.

If the string in the clipboard is not a legal URL, the TBM will try to interpret it as the path to a file in the file system.  If this succeeds, a new file:/// bookmark to the file will be created.  The bookmark will be properly URL-quoted and escaped so that it can be opened by the operating system.

</t>
<t tx="tom.20230505075508.26">To create a new bookmark by hand, Create a new Leo node where you want, and add a line starting with *:title:* and another starting with *:ref:*. Type in the title and URL respectively after the two keywords, with a space after the trailing colon (:).

You could do this to create a unl: link into another Leo outline.</t>
<t tx="tom.20230505075508.27">This outline includes a small collection of bookmarks for you to play with and follow along with the examples to come.  Screen shots can be opened by CNTL-CLICKing on their links.  They will open in whatever file association the operating system chooses to use.

Remember that some of these bookmarks are so old that they no longer exist.  This situation will be covered later.

</t>
<t tx="tom.20230505075508.28">The search box with its button are marked in this image:

.. image:: images/searchbox.png

Type a word or phrase in the search box.  It will be searched for when you click on the *Search* button or press the &lt;ENTER&gt; key.  The search is not case-sensitive. Normally the TBM will search for each space-separated part of the entry.   So the phrase *python literate* will find hits on both *python* and *literate*.

To search for the phrase as is - verbatim - surround it with double quotes.

Normally the search will find hits if the search phrase is contained in the target.  So "pyth" will also find *pytho*, *python*, and so on.  To make the TBM find matches to the exact string, prefix it with *w:* -

*w:pyth*

This will only find the word *pyth*.  The exact word prefix, *w:* can be combined with double quotes.

</t>
<t tx="tom.20230505075508.29"></t>
<t tx="tom.20230505075508.3">:tocdepth: 4

================================
Bookmarks Manager User's Guide
================================
</t>
<t tx="tom.20230505075508.30">There are two kinds of nodes in a bookmark collection: *resources* and *subjects*.  These are described in the *Terminology* section.  A *resource* is a node that contains a URL (or UNL).  A *subject* refers to the concept of *subject terms*, and can either be what is called an *organizing node* in Leo, or a flattened path to one, which is called a *compound term* in the *Terminology* section.

Resources and subjects are searched separately.  Resource results are displayed in the *Resources* tab and subject term results in the *Subjects* tab.
</t>
<t tx="tom.20230505075508.31">To begin, type "programming" into the search box (without the quotes), then click on the *Search* button or press the *&lt;Enter&gt;* key.  The results will look like the linked image:

.. image:: images/search1-resources.png

Notice that the *Resources* tab has been focused.  If there had been no resource hits but only subject hits, the *Subjects* tab would have been focused instead.

</t>
<t tx="tom.20230505075508.32">The Resource Hits
--------------------
Resource results (the actual bookmarks found) display in a normal typeface, as shown below: 

.. image:: images/search1-resources-1.png

Clicking on the name of a bookmark will open the link in the system browser or, if it is a "file:" url - pointing to a file on the computer - the operating system will open it.

Clicking on the question mark *(?)* will navigate the Leo bookmarks tree to the node for that bookmark. You can make notes, correct typos, or do any other maintenance or editing you want in the body of that node.

The Boldfaced Subject Terms
-------------------------------
The boldfaced lines give the names of the subject terms that the found resources are under.  Notice that one is a simple term and the other is a compound term indicating the flattened hierarchy of the subject terms leading to the resources.  Each step of the boldfaced steps can be clicked on and the tree will navigate to the corresponding node.  This is depicted below:

.. image:: images/search1-resources-2.png

For example, clicking on "Python" takes you to the top of the *Python* tree, and clicking on *Techniques* takes you to its node - this part of the bookmark tree has the structure::

    - Python
        -Techniques

This structure has been flattened to ``Python/Techniques`` in the search results.

**Note** The boldfaced subject headings may or may not include the search phrase - *Python/Techniques* does not include the phrase *programming*.  This is because the hits displayed here were found by searching resources, not subjects.  

</t>
<t tx="tom.20230505075508.33">Now select the *Subjects* tab.  There are two results, as shown in this screen shot:

.. image:: images/search1-subjects.png

These results are hits on simple subject nodes that contain the search phrase.  However, there might be several compound  subject terms that match.  Click on one of the results to find out

In this example, click on *Network Programming*.  The *Related Terms* tab will display.

There is only one result (often there will be several), and it shows the full (flattened) location in the bookmarks tree. This screen shot depicts this view of the bookmarks manager after selecting a subject term:

.. image:: images/search1-subjects-1.png

The word *Context* refers to the path to the node, which is considered to be the "context" of the bookmark.  In the future other kinds of relationships may be added.

Click on one of the results (this time there is only one choice).  The display will activate the *Resources tab* and list all the resources (bookmarks) under that organizing node.  These links will open when clicked.  Here is a screenshot:
 
.. image:: images/search1-subjects-2.png
 
In the future, this display will be enhanced to add the *(?)* links to navigate to the actual bookmark's node, and to make each step in the "Links For" path clickable.</t>
<t tx="tom.20230505075508.34">You can also search the bookmark collection using Leo's own tools.  Let's compare the results with those of the bookmark manager's own searches.

Leo's *Find* tab presents hits one at a time, and this is usually not very helpful because it's usually important to be able to scan through a range of similar hits.  Stepping through one by one is not so helpful.  There is also the *find-all* command but its listing is hard to read, and ungrouped.

By contrast, the *Nav* tab search is quite good.  Open the tab and type the same example search phrase, "programming".  Do not press the &lt;ENTER&gt; key yet.  Here is a screen shot of the results:

.. image:: images/search-1-navtab-1.png

The Nav tab shows headlines of all nodes that matched the search phrase, whether they are bookmarks or subject terms.  Compare with the bookmark manager's Resource tab display:

.. image:: images/search1-resources.png

Next, press the &lt;ENTER&gt; key in the Nav pane. The result is a listing of body lines that match, listed under their headlines in boldface, and all grouped under their nearest organizing node.  Here is a screenshot:

.. image:: images/search-1-navtab-2.png

These results are fairly useful.  To open a bookmark, we click on its link in the Nav tab to navigate to its node. Then in its node we &lt;CTRL-CLICK&gt; on the URL in the "ref" line to open it.

Although this is a useful display, the bookmark manager offers these improvements:

    - A less cluttered, more targeted display;
    - Clicking opens the resource in the browser;
    - Harder to navigate to the organizing nodes;
    - Hard to find related subject terms;
    - Harder to scan for results of interest;
    - Harder to notice unexpected results and relationships.

A search using the Nav panel will also find hits in the bookmark code, scripts, and this documentation material, even though they are not part of the bookmarks collection.



</t>
<t tx="tom.20230505075508.35">Some bookmarks become unavailable, especially older ones.  Here is how to deal with them.

A bookmark may not work because it now uses an *https* URL instead of the original *http* protocol.  To see if this is the case, navigate to the bookmark's node and add an "s" to the "http". TBM has a command to test a bookmark, *bk-chk-url*.  This command can be run from the *Bookmarks/Check Bookmark* URL menu item. This is shown in the screenshot:

.. image:: images/bk-check.png

If changing to *https* does not work, then the page might have moved.  You will have to do internet searches to find it.  If you do, you can just edit the URL in the body of the bookmark's node.  Otherwise you might just as well delete the node.
</t>
<t tx="tom.20230505075508.36">The bookmark manager installs some commands that are specific to the bookmark outline.  Their names all start with *bk-*, so that you can list them all using minibuffer tab completion.  Enter the minibuffer with &lt;CTRL-x&gt; or by clicking in it.  Type "bk-", then press the &lt;TAB&gt; key.

Here are the commands:

    1. bk-chk-url -- check a bookmark's URL.  Available from the *Bookmarks* menu.
    2. bk-count -- count the bookmarks and subject terms.  Displays counts in the Log pane.
    3.    bk-create-bookmark -- Create a new bookmark node at the selected tree position.  Available from the *Bookmarks* menu.
    4. bk-delete-tab -- close the Bookmarks tab.  It can be reopened, and will keep its state.
    5. bk-open-tab -- Open the Bookmark tab if close, close it if open. 
    6. bk-find-latest -- list the 30 most recent added bookmarks in the Log pane.
    7. bk-open-docs -- Open the Sphinx User's Guide in the browser.
</t>
<t tx="tom.20230505075508.4"></t>
<t tx="tom.20230505075508.5">The Tabbed Bookmarks Manager (TBM) is a browser bookmarks manager that improves on the bookmark managers that come with web browsers.  It provides

1. Much better abilities for finding bookmarks;
2. Much better ability for organizing and reorganizing your bookmarks, thanks to Leo's tree functionality;
3. A capability for seeing your bookmarks in context;
4. Much better abilities for discovering bookmarks that you had forgotten about;
5. The change to discover a relationship between various bookmarks and their categories that you had not realized.
6. The ability to include bookmarks to files in your file system.
7. The ability to write notes in your bookmark nodes.

The TBM imports your bookmarks from your browser, and also creates new ones when you want to store them.  It has its own GUI, which opens in a new tab in Leo's Log pane.  The TBM has search and display capabilities, and you can also also use Leo's own search and tree organization commands.

The TBM consists of a python script that creates a top-level class, a number of new Leo commands, scripts for importing bookmarks from the browser, and a tree that contains the actual bookmarks.  The entire application is contained within a single Leo outline.

The outline also includes the source for this Sphinx document itself, along with code for re-creating it.
</t>
<t tx="tom.20230505075508.6">The node with the headline *Bookmark Search Panel* (BSP) contains the core code for the Bookmark Manager. In combination with a small set of scripts, the BSP provides a browser bookmark manager that displays inside a tab in Leo's Log frame.

When the Bookmarks outline is loaded, it creates a new menu named *Bookmarks* and a new button in the Icon bar also named *Bookmarks*. The new controls are shown in this screenshot of the BSP after activating the bookmarks tab:
    
.. image:: images/bk-overall-view.png

In addition, the typeface for Leo's body editor changes from mono-spaced to proportional, non-monospaced.  When the *Bookmarks* tab is toggled off again, the typeface changes back to Leo's usual monospaced font [f1]_.

.. [f1]  The font change can be prevented by commenting out a few lines in the script that toggles the *Bookmarks* tab.
</t>
<t tx="tom.20230505075508.7">The bookmarks themselves are contained in this outline.  The top of the bookmarks tree must be a top-level node whose headline starts with *@bookmark-collection*.  The bookmark code will use the first node it finds whose headline starts with the identifying string.
</t>
<t tx="tom.20230505075508.8">No installation is necessary.  Just open the bookmark's outline in Leo. 

To open the *Bookmarks* tab, either click the *Bookmarks* button or the *Bookmarks/Toggle Bookmarks Tab* menu item.</t>
<t tx="tom.20230505075508.9">The bookmark manager scripts, settings, and the actual bookmark collection have this organization::

    browser_bookmarks.leo
        - @settings
            - @menuat before
                - @menu &amp;Bookmarks
                    - @item bk-open-tab
                    - @item bk-create-bookmark
                    - @item bk-chk-url
                - Commands
                    - @command bk-chk-url
                    - @command bk-count
                    - @command bk-create-bookmark
                    - @command bk-delete-tab
                    - @command bk-find-latest
                    - @command bk-open-tab
                    - @command bk-open-docs
        - Bookmark Search Panel
            - @command bk-toggle-tab
        - Bookmark Import Scripts
            - Import JSON Bookmarks File
            - Import Firefox Bookmarks File
        - Docs
                - @button Build HTML
                - @rst Bookmarks_manager_Users_Guide
                    [text source for the User's Guide]
        - @bookmark-collection (starter set)
                [sample organizer nodes and bookmarks]

The bookmark import scripts will create an *@bookmark-collection* subtree at the end of the outline.</t>
</tnodes>
</leo_file>
