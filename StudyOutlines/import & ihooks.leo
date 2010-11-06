<?xml version="1.0" encoding="UTF-8"?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="155" clone_windows="0"/>
<globals body_outline_ratio="0.5">
	<global_window_position top="384" left="371" height="600" width="800"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences>
</preferences>
<find_panel_settings>
	<find_string></find_string>
	<change_string></change_string>
</find_panel_settings>
<vnodes>
<v t="ekr.20040711141351.1" a="TV"><vh>ihooks &amp; imp</vh>
<v t="ekr.20040711141351.2"><vh>@url http://docs.python.org/lib/module-imp.html</vh></v>
<v t="ekr.20040711141351.3"><vh>@url http://aspn.activestate.com/ASPN/Cookbook/Python/Recipe/59867</vh></v>
<v t="ekr.20040711141351.4"><vh>Python23/Lib/ihooks.py</vh>
<v t="ekr.20040711141351.5"><vh>&lt;&lt; ihooks declarations &gt;&gt;</vh></v>
<v t="ekr.20040711141351.6"><vh>class _Verbose</vh>
<v t="ekr.20040711141351.7"><vh>__init__</vh></v>
<v t="ekr.20040711141351.8"><vh>get_verbose</vh></v>
<v t="ekr.20040711141351.9"><vh>set_verbose</vh></v>
<v t="ekr.20040711141351.10"><vh>note</vh></v>
<v t="ekr.20040711141351.11"><vh>message</vh></v>
</v>
<v t="ekr.20040711141351.12"><vh>class Hooks (_Verbose)</vh>
<v t="ekr.20040711141351.13"><vh>imp interface</vh>
<v t="ekr.20040711141351.14"><vh>get_suffixes</vh></v>
<v t="ekr.20040711141351.15"><vh>new_module</vh></v>
<v t="ekr.20040711141351.16"><vh>is_builtin</vh></v>
<v t="ekr.20040711141351.17"><vh>init_builtin</vh></v>
<v t="ekr.20040711141351.18"><vh>is_frozen</vh></v>
<v t="ekr.20040711141351.19"><vh>init_frozen</vh></v>
<v t="ekr.20040711141351.20"><vh>get_frozen_object</vh></v>
<v t="ekr.20040711141351.21" a="M"><vh>load_source  (do I want ot override this?)</vh></v>
<v t="ekr.20040711141351.22"><vh>load_compiled</vh></v>
<v t="ekr.20040711141351.23"><vh>load_dynamic</vh></v>
<v t="ekr.20040711141351.24"><vh>load_package</vh></v>
<v t="ekr.20040711141351.25"><vh>add_module</vh></v>
</v>
<v t="ekr.20040711141351.26"><vh>sys interface</vh>
<v t="ekr.20040711141351.27"><vh>modules_dict</vh></v>
<v t="ekr.20040711141351.28"><vh>default_path</vh></v>
<v t="ekr.20040711141351.29"><vh>path_split</vh></v>
<v t="ekr.20040711141351.30"><vh>path_join</vh></v>
<v t="ekr.20040711141351.31"><vh>path_isabs</vh></v>
<v t="ekr.20040711141351.32"><vh>path_exists</vh></v>
<v t="ekr.20040711141351.33"><vh>path_isdir</vh></v>
<v t="ekr.20040711141351.34"><vh>path_isfile</vh></v>
<v t="ekr.20040711141351.35"><vh>path_islink</vh></v>
</v>
<v t="ekr.20040711141351.36"><vh>openfile</vh></v>
<v t="ekr.20040711141351.37"><vh>listdir</vh></v>
</v>
<v t="ekr.20040711141351.38"><vh>Loaders...</vh>
<v t="ekr.20040711141351.39"><vh>class BasicModuleLoader (_Verbose)</vh>
<v t="ekr.20040711141351.40"><vh>find_module</vh></v>
<v t="ekr.20040711141351.41"><vh>default_path</vh></v>
<v t="ekr.20040711141351.42"><vh>find_module_in_dir</vh></v>
<v t="ekr.20040711141351.43"><vh>find_builtin_module</vh></v>
<v t="ekr.20040711141351.44"><vh>load_module</vh></v>
</v>
<v t="ekr.20040711141351.45"><vh>class ModuleLoader (BasicModuleLoader)</vh>
<v t="ekr.20040711141351.46"><vh>__init__</vh></v>
<v t="ekr.20040711141351.47"><vh>default_path</vh></v>
<v t="ekr.20040711141351.48"><vh>modules_dict</vh></v>
<v t="ekr.20040711141351.49"><vh>get_hooks</vh></v>
<v t="ekr.20040711141351.50"><vh>set_hooks</vh></v>
<v t="ekr.20040711141351.51"><vh>find_builtin_module</vh></v>
<v t="ekr.20040711141351.52"><vh>find_module_in_dir</vh></v>
<v t="ekr.20040711141351.53" a="M"><vh>load_module</vh></v>
</v>
<v t="ekr.20040711141351.54"><vh>class FancyModuleLoader (ModuleLoader)</vh>
<v t="ekr.20040711141351.55"><vh>load_module</vh></v>
</v>
</v>
<v t="ekr.20040711141351.56"><vh>Importers...</vh>
<v t="ekr.20040711141351.57"><vh>class BasicModuleImporter (_Verbose)</vh>
<v t="ekr.20040711141351.58"><vh>__init__</vh></v>
<v t="ekr.20040711141351.59"><vh>getters/settesr</vh>
<v t="ekr.20040711141351.60"><vh>get_loader</vh></v>
<v t="ekr.20040711141351.61"><vh>set_loader</vh></v>
<v t="ekr.20040711141351.62"><vh>get_hooks</vh></v>
<v t="ekr.20040711141351.63"><vh>set_hooks</vh></v>
</v>
<v t="ekr.20040711141351.64"><vh>import_module</vh></v>
<v t="ekr.20040711141351.65"><vh>reload</vh></v>
<v t="ekr.20040711141351.66"><vh>unload</vh></v>
<v t="ekr.20040711141351.67"><vh>install</vh></v>
<v t="ekr.20040711141351.68"><vh>uninstall</vh></v>
</v>
<v t="ekr.20040711141351.69"><vh>class ModuleImporter (BasicModuleImporter)</vh>
<v t="ekr.20040711141351.70"><vh>import_module</vh></v>
<v t="ekr.20040711141351.71"><vh>determine_parent</vh></v>
<v t="ekr.20040711141351.72"><vh>find_head_package</vh></v>
<v t="ekr.20040711141351.73"><vh>load_tail</vh></v>
<v t="ekr.20040711141351.74"><vh>ensure_fromlist</vh></v>
<v t="ekr.20040711141351.75"><vh>import_it</vh></v>
<v t="ekr.20040711141351.76"><vh>reload</vh></v>
</v>
</v>
<v t="ekr.20040711141351.77"><vh>install</vh></v>
<v t="ekr.20040711141351.78"><vh>uninstall</vh></v>
</v>
<v t="ekr.20040711141351.79"><vh>import.c (contains imp module)</vh>
<v t="ekr.20040711141351.80"><vh>&lt;&lt; import #includes &gt;&gt;</vh></v>
<v t="ekr.20040711141351.81"><vh>&lt;&lt; import declarations &gt;&gt;</vh></v>
<v t="ekr.20040711141351.82"><vh>_PyImport_Init</vh></v>
<v t="ekr.20040711141351.83"><vh>_PyImportHooks_Init</vh></v>
<v t="ekr.20040711141351.84"><vh>_PyImport_Fini</vh></v>
<v t="ekr.20040711141351.85"><vh>Locks...</vh>
<v t="ekr.20040711141351.86"><vh>lock_import</vh></v>
<v t="ekr.20040711141351.87"><vh>unlock_import</vh></v>
<v t="ekr.20040711141351.88"><vh>imp_lock_held</vh></v>
<v t="ekr.20040711141351.89"><vh>imp_acquire_lock</vh></v>
<v t="ekr.20040711141351.90"><vh>imp_release_lock</vh></v>
</v>
<v t="ekr.20040711141351.91"><vh>PyImport_GetModuleDict</vh></v>
<v t="ekr.20040711141351.92"><vh>PyImport_Cleanup</vh></v>
<v t="ekr.20040711141351.93"><vh>PyImport_GetMagicNumber</vh></v>
<v t="ekr.20040711141351.94"><vh>_PyImport_FixupExtension</vh></v>
<v t="ekr.20040711141351.95"><vh>_PyImport_FindExtension</vh></v>
<v t="ekr.20040711141351.96"><vh>PyImport_AddModule</vh></v>
<v t="ekr.20040711141351.97"><vh>PyImport_ExecCodeModule</vh></v>
<v t="ekr.20040711141351.98"><vh>PyImport_ExecCodeModuleEx</vh></v>
<v t="ekr.20040711141351.99"><vh>make_compiled_pathname</vh></v>
<v t="ekr.20040711141351.100"><vh>check_compiled_module</vh></v>
<v t="ekr.20040711141351.101"><vh>read_compiled_module</vh></v>
<v t="ekr.20040711141351.102"><vh>load_compiled_module</vh></v>
<v t="ekr.20040711141351.103"><vh>parse_source_module</vh></v>
<v t="ekr.20040711141351.104"><vh>open_exclusive</vh></v>
<v t="ekr.20040711141351.105"><vh>write_compiled_module</vh></v>
<v t="ekr.20040711141351.106"><vh>load_source_module</vh></v>
<v t="ekr.20040711141351.107"><vh>load_package</vh></v>
<v t="ekr.20040711141351.108"><vh>is_builtin</vh></v>
<v t="ekr.20040711141351.109"><vh>get_path_importer</vh></v>
<v t="ekr.20040711141351.110"><vh>find_module</vh></v>
<v t="ekr.20040711141351.111"><vh>case_ok</vh></v>
<v t="ekr.20040711141351.112"><vh>find_init_module</vh></v>
<v t="ekr.20040711141351.113" a="M"><vh>load_module</vh></v>
<v t="ekr.20040711141351.114"><vh>init_builtin</vh></v>
<v t="ekr.20040711141351.115"><vh>find_frozen</vh></v>
<v t="ekr.20040711141351.116"><vh>get_frozen_object</vh></v>
<v t="ekr.20040711141351.117"><vh>PyImport_ImportFrozenModule</vh></v>
<v t="ekr.20040711141351.118"><vh>PyImport_ImportModule</vh></v>
<v t="ekr.20040711141351.119"><vh>import_module_ex</vh></v>
<v t="ekr.20040711141351.120"><vh>PyImport_ImportModuleEx</vh></v>
<v t="ekr.20040711141351.121"><vh>get_parent</vh></v>
<v t="ekr.20040711141351.122"><vh>load_next</vh></v>
<v t="ekr.20040711141351.123"><vh>mark_miss</vh></v>
<v t="ekr.20040711141351.124"><vh>ensure_fromlist</vh></v>
<v t="ekr.20040711141351.125"><vh>add_submodule</vh></v>
<v t="ekr.20040711141351.126"><vh>import_submodule</vh></v>
<v t="ekr.20040711141351.127"><vh>PyImport_ReloadModule</vh></v>
<v t="ekr.20040711141351.128"><vh>PyImport_Import</vh></v>
<v t="ekr.20040711141351.129"><vh>imp...</vh>
<v t="ekr.20040711141351.130"><vh>imp_get_magic</vh></v>
<v t="ekr.20040711141351.131"><vh>imp_get_suffixes</vh></v>
<v t="ekr.20040711141351.132"><vh>call_find_module</vh></v>
<v t="ekr.20040711141351.133"><vh>imp_find_module</vh></v>
<v t="ekr.20040711141351.134"><vh>imp_init_builtin</vh></v>
<v t="ekr.20040711141351.135"><vh>imp_init_frozen</vh></v>
<v t="ekr.20040711141351.136"><vh>imp_get_frozen_object</vh></v>
<v t="ekr.20040711141351.137"><vh>imp_is_builtin</vh></v>
<v t="ekr.20040711141351.138"><vh>imp_is_frozen</vh></v>
<v t="ekr.20040711141351.139" a="M"><vh>get_file (called from imp_load_module)</vh></v>
<v t="ekr.20040711141351.140"><vh>imp_load_compiled</vh></v>
<v t="ekr.20040711141351.141"><vh>imp_load_dynamic</vh></v>
<v t="ekr.20040711141351.142" a="M"><vh>imp_load_source</vh></v>
<v t="ekr.20040711141351.143" a="M"><vh>imp_load_module:calls load_module</vh></v>
<v t="ekr.20040711141351.144"><vh>imp_load_package</vh></v>
<v t="ekr.20040711141351.145"><vh>imp_new_module</vh></v>
</v>
<v t="ekr.20040711141351.146"><vh>doc strings</vh></v>
<v t="ekr.20040711141351.147"><vh>module table</vh></v>
<v t="ekr.20040711141351.148"><vh>setint</vh></v>
<v t="ekr.20040711141351.149"><vh>initimp</vh></v>
<v t="ekr.20040711141351.150"><vh>PyImport_ExtendInittab</vh></v>
<v t="ekr.20040711141351.151"><vh>PyImport_AppendInittab</vh></v>
</v>
<v t="ekr.20040711141351.152"><vh>Python23/Lib/test/test_imp.py (just checks locks)</vh>
<v t="ekr.20040711141351.153"><vh>verify_lock_state</vh></v>
<v t="ekr.20040711141351.154"><vh>testLock</vh></v>
<v t="ekr.20040711141351.155"><vh>test_main</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20040711141351.1"></t>
<t tx="ekr.20040711141351.2"></t>
<t tx="ekr.20040711141351.3"></t>
<t tx="ekr.20040711141351.4">@ignore
@language python
&lt;&lt; ihooks declarations &gt;&gt;
@others
</t>
<t tx="ekr.20040711141351.5">"""Import hook support.

Consistent use of this module will make it possible to change the
different mechanisms involved in loading modules independently.

While the built-in module imp exports interfaces to the built-in
module searching and loading algorithm, and it is possible to replace
the built-in function __import__ in order to change the semantics of
the import statement, until now it has been difficult to combine the
effect of different __import__ hacks, like loading modules from URLs
by rimport.py, or restricted execution by rexec.py.

This module defines three new concepts:

1) A "file system hooks" class provides an interface to a filesystem.

One hooks class is defined (Hooks), which uses the interface provided
by standard modules os and os.path.  It should be used as the base
class for other hooks classes.

2) A "module loader" class provides an interface to search for a
module in a search path and to load it.  It defines a method which
searches for a module in a single directory; by overriding this method
one can redefine the details of the search.  If the directory is None,
built-in and frozen modules are searched instead.

Two module loader class are defined, both implementing the search
strategy used by the built-in __import__ function: ModuleLoader uses
the imp module's find_module interface, while HookableModuleLoader
uses a file system hooks class to interact with the file system.  Both
use the imp module's load_* interfaces to actually load the module.

3) A "module importer" class provides an interface to import a
module, as well as interfaces to reload and unload a module.  It also
provides interfaces to install and uninstall itself instead of the
default __import__ and reload (and unload) functions.

One module importer class is defined (ModuleImporter), which uses a
module loader instance passed in (by default HookableModuleLoader is
instantiated).

The classes defined here should be used as base classes for extended
functionality along those lines.

If a module importer class supports dotted names, its import_module()
must return a different value depending on whether it is called on
behalf of a "from ... import ..." statement or not.  (This is caused
by the way the __import__ hook is used by the Python interpreter.)  It
would also do wise to install a different version of reload().

"""

import __builtin__
import imp
import os
import sys

__all__ = ["BasicModuleLoader","Hooks","ModuleLoader","FancyModuleLoader",
           "BasicModuleImporter","ModuleImporter","install","uninstall"]

VERBOSE = 0

from imp import C_EXTENSION, PY_SOURCE, PY_COMPILED
from imp import C_BUILTIN, PY_FROZEN, PKG_DIRECTORY
BUILTIN_MODULE = C_BUILTIN
FROZEN_MODULE = PY_FROZEN</t>
<t tx="ekr.20040711141351.6">class _Verbose:
    
	@others</t>
<t tx="ekr.20040711141351.7">def __init__(self, verbose = VERBOSE):
    self.verbose = verbose
</t>
<t tx="ekr.20040711141351.8">def get_verbose(self):
    return self.verbose
</t>
<t tx="ekr.20040711141351.9">def set_verbose(self, verbose):
    self.verbose = verbose
</t>
<t tx="ekr.20040711141351.10"># XXX The following is an experimental interface

def note(self, *args):
    if self.verbose:
        self.message(*args)
</t>
<t tx="ekr.20040711141351.11">def message(self, format, *args):
    if args:
        print format%args
    else:
        print format
</t>
<t tx="ekr.20040711141351.12">class Hooks(_Verbose):

    """Hooks into the filesystem and interpreter.

    By deriving a subclass you can redefine your filesystem interface,
    e.g. to merge it with the URL space.

    This base class behaves just like the native filesystem.

    """
    
	@others

    listdir_error = os.error</t>
<t tx="ekr.20040711141351.13"></t>
<t tx="ekr.20040711141351.14">def get_suffixes(self): return imp.get_suffixes()
</t>
<t tx="ekr.20040711141351.15">def new_module(self, name): return imp.new_module(name)
</t>
<t tx="ekr.20040711141351.16">def is_builtin(self, name): return imp.is_builtin(name)
</t>
<t tx="ekr.20040711141351.17">def init_builtin(self, name): return imp.init_builtin(name)
</t>
<t tx="ekr.20040711141351.18">def is_frozen(self, name): return imp.is_frozen(name)
</t>
<t tx="ekr.20040711141351.19">def init_frozen(self, name): return imp.init_frozen(name)
</t>
<t tx="ekr.20040711141351.20">def get_frozen_object(self, name): return imp.get_frozen_object(name)
</t>
<t tx="ekr.20040711141351.21">def load_source(self, name, filename, file=None):

    return imp.load_source(name, filename, file)
</t>
<t tx="ekr.20040711141351.22">def load_compiled(self, name, filename, file=None):
    return imp.load_compiled(name, filename, file)
</t>
<t tx="ekr.20040711141351.23">def load_dynamic(self, name, filename, file=None):
    return imp.load_dynamic(name, filename, file)
</t>
<t tx="ekr.20040711141351.24">def load_package(self, name, filename, file=None):
    return imp.load_module(name, file, filename, ("", "", PKG_DIRECTORY))
</t>
<t tx="ekr.20040711141351.25">def add_module(self, name):
    d = self.modules_dict()
    if name in d: return d[name]
    d[name] = m = self.new_module(name)
    return m
</t>
<t tx="ekr.20040711141351.26"></t>
<t tx="ekr.20040711141351.27">def modules_dict(self): return sys.modules
</t>
<t tx="ekr.20040711141351.28">def default_path(self): return sys.path
</t>
<t tx="ekr.20040711141351.29">def path_split(self, x): return os.path.split(x)
</t>
<t tx="ekr.20040711141351.30">def path_join(self, x, y): return os.path.join(x, y)
</t>
<t tx="ekr.20040711141351.31">def path_isabs(self, x): return os.path.isabs(x)
</t>
<t tx="ekr.20040711141351.32">def path_exists(self, x): return os.path.exists(x)
</t>
<t tx="ekr.20040711141351.33">def path_isdir(self, x): return os.path.isdir(x)
</t>
<t tx="ekr.20040711141351.34">def path_isfile(self, x): return os.path.isfile(x)
</t>
<t tx="ekr.20040711141351.35">def path_islink(self, x): return os.path.islink(x)
</t>
<t tx="ekr.20040711141351.36">def openfile(self, *x): return open(*x)

openfile_error = IOError</t>
<t tx="ekr.20040711141351.37">def listdir(self, x): return os.listdir(x)
</t>
<t tx="ekr.20040711141351.38"></t>
<t tx="ekr.20040711141351.39">class BasicModuleLoader(_Verbose):

    """Basic module loader.

    This provides the same functionality as built-in import.  It
    doesn't deal with checking sys.modules -- all it provides is
    find_module() and a load_module(), as well as find_module_in_dir()
    which searches just one directory, and can be overridden by a
    derived class to change the module search algorithm when the basic
    dependency on sys.path is unchanged.

    The interface is a little more convenient than imp's:
    find_module(name, [path]) returns None or 'stuff', and
    load_module(name, stuff) loads the module.

    """

    @others
</t>
<t tx="ekr.20040711141351.40">def find_module(self, name, path = None):

    if path is None:
        path = [None] + self.default_path()

    for dir in path:
        stuff = self.find_module_in_dir(name, dir)
        if stuff: return stuff

    return None
</t>
<t tx="ekr.20040711141351.41">def default_path(self):

    return sys.path
</t>
<t tx="ekr.20040711141351.42">def find_module_in_dir(self, name, dir):

    if dir is None:
        return self.find_builtin_module(name)
    else:
        try:
            return imp.find_module(name, [dir])
        except ImportError:
            return None
</t>
<t tx="ekr.20040711141351.43">def find_builtin_module(self, name):

    # XXX frozen packages?
    if imp.is_builtin(name):
        return None, '', ('', '', BUILTIN_MODULE)

    if imp.is_frozen(name):
        return None, '', ('', '', FROZEN_MODULE)

    return None
</t>
<t tx="ekr.20040711141351.44">def load_module(self, name, stuff):

    file, filename, info = stuff

    try:
        return imp.load_module(name, file, filename, info)
    finally:
        if file: file.close()
</t>
<t tx="ekr.20040711141351.45">class ModuleLoader(BasicModuleLoader):

    """Default module loader; uses file system hooks.

    By defining suitable hooks, you might be able to load modules from
    other sources than the file system, e.g. from compressed or
    encrypted files, tar files or (if you're brave!) URLs.

    """
	@others
</t>
<t tx="ekr.20040711141351.46">def __init__(self, hooks = None, verbose = VERBOSE):
    BasicModuleLoader.__init__(self, verbose)
    self.hooks = hooks or Hooks(verbose)
</t>
<t tx="ekr.20040711141351.47">def default_path(self):

    return self.hooks.default_path()
</t>
<t tx="ekr.20040711141351.48">def modules_dict(self):

    return self.hooks.modules_dict()
</t>
<t tx="ekr.20040711141351.49">def get_hooks(self):

    return self.hooks
</t>
<t tx="ekr.20040711141351.50">def set_hooks(self, hooks):

    self.hooks = hooks
</t>
<t tx="ekr.20040711141351.51">def find_builtin_module(self, name):

    # XXX frozen packages?
    if self.hooks.is_builtin(name):
        return None, '', ('', '', BUILTIN_MODULE)

    if self.hooks.is_frozen(name):
        return None, '', ('', '', FROZEN_MODULE)

    return None
</t>
<t tx="ekr.20040711141351.52">def find_module_in_dir(self, name, dir, allow_packages=1):

    if dir is None:
        return self.find_builtin_module(name)

    if allow_packages:
        fullname = self.hooks.path_join(dir, name)
        if self.hooks.path_isdir(fullname):
            stuff = self.find_module_in_dir("__init__", fullname, 0)
            if stuff:
                file = stuff[0]
                if file: file.close()
                return None, fullname, ('', '', PKG_DIRECTORY)

    for info in self.hooks.get_suffixes():
        suff, mode, type = info
        fullname = self.hooks.path_join(dir, name+suff)
        try:
            fp = self.hooks.openfile(fullname, mode)
            return fp, fullname, info
        except self.hooks.openfile_error:
            pass

    return None
</t>
<t tx="ekr.20040711141351.53">def load_module(self, name, stuff):
    file, filename, info = stuff
    (suff, mode, type) = info
    try:
        if type == BUILTIN_MODULE:
            return self.hooks.init_builtin(name)
        if type == FROZEN_MODULE:
            return self.hooks.init_frozen(name)
        if type == C_EXTENSION:
            m = self.hooks.load_dynamic(name, filename, file)
        elif type == PY_SOURCE:
            m = self.hooks.load_source(name, filename, file)
        elif type == PY_COMPILED:
            m = self.hooks.load_compiled(name, filename, file)
        elif type == PKG_DIRECTORY:
            m = self.hooks.load_package(name, filename, file)
        else:
            raise ImportError, "Unrecognized module type (%s) for %s" % \
                  (`type`, name)
    finally:
        if file: file.close()
    m.__file__ = filename
    return m
</t>
<t tx="ekr.20040711141351.54">class FancyModuleLoader(ModuleLoader):

    """Fancy module loader -- parses and execs the code itself."""

	@others
</t>
<t tx="ekr.20040711141351.55">def load_module(self, name, stuff):
    file, filename, (suff, mode, type) = stuff
    realfilename = filename
    path = None

    if type == PKG_DIRECTORY:
        initstuff = self.find_module_in_dir("__init__", filename, 0)
        if not initstuff:
            raise ImportError, "No __init__ module in package %s" % name
        initfile, initfilename, initinfo = initstuff
        initsuff, initmode, inittype = initinfo
        if inittype not in (PY_COMPILED, PY_SOURCE):
            if initfile: initfile.close()
            raise ImportError, \
                "Bad type (%s) for __init__ module in package %s" % (
                `inittype`, name)
        path = [filename]
        file = initfile
        realfilename = initfilename
        type = inittype

    if type == FROZEN_MODULE:
        code = self.hooks.get_frozen_object(name)
    elif type == PY_COMPILED:
        import marshal
        file.seek(8)
        code = marshal.load(file)
    elif type == PY_SOURCE:
        data = file.read()
        code = compile(data, realfilename, 'exec')
    else:
        return ModuleLoader.load_module(self, name, stuff)

    m = self.hooks.add_module(name)
    if path:
        m.__path__ = path
    m.__file__ = filename
    exec code in m.__dict__
    return m</t>
<t tx="ekr.20040711141351.56"></t>
<t tx="ekr.20040711141351.57">class BasicModuleImporter(_Verbose):

    """Basic module importer; uses module loader.

    This provides basic import facilities but no package imports.

    """
	@others
</t>
<t tx="ekr.20040711141351.58">def __init__(self, loader = None, verbose = VERBOSE):

    _Verbose.__init__(self, verbose)
    self.loader = loader or ModuleLoader(None, verbose)
    self.modules = self.loader.modules_dict()
</t>
<t tx="ekr.20040711141351.59"></t>
<t tx="ekr.20040711141351.60">def get_loader(self):
    return self.loader
</t>
<t tx="ekr.20040711141351.61">def set_loader(self, loader):
    self.loader = loader
</t>
<t tx="ekr.20040711141351.62">def get_hooks(self):
    return self.loader.get_hooks()
</t>
<t tx="ekr.20040711141351.63">def set_hooks(self, hooks):
    return self.loader.set_hooks(hooks)
</t>
<t tx="ekr.20040711141351.64">def import_module(self, name, globals={}, locals={}, fromlist=[]):
    
    name = str(name)
    if name in self.modules:
        return self.modules[name] # Fast path

    stuff = self.loader.find_module(name)
    if not stuff:
        raise ImportError, "No module named %s" % name

    return self.loader.load_module(name, stuff)
</t>
<t tx="ekr.20040711141351.65">def reload(self, module, path = None):

    name = str(module.__name__)
    stuff = self.loader.find_module(name, path)
    if not stuff:
        raise ImportError, "Module %s not found for reload" % name
    return self.loader.load_module(name, stuff)
</t>
<t tx="ekr.20040711141351.66">def unload(self, module):

    del self.modules[str(module.__name__)]
</t>
<t tx="ekr.20040711141351.67"># XXX Should this try to clear the module's namespace?

def install(self):
    
    self.save_import_module = __builtin__.__import__
    self.save_reload = __builtin__.reload
    
    if not hasattr(__builtin__, 'unload'):
        __builtin__.unload = None
        
    self.save_unload = __builtin__.unload
    
    __builtin__.__import__ = self.import_module
    __builtin__.reload = self.reload
    __builtin__.unload = self.unload
</t>
<t tx="ekr.20040711141351.68">def uninstall(self):
    
    __builtin__.__import__ = self.save_import_module
    __builtin__.reload = self.save_reload
    __builtin__.unload = self.save_unload

    if not __builtin__.unload:
        del __builtin__.unload
</t>
<t tx="ekr.20040711141351.69">class ModuleImporter(BasicModuleImporter):

    """A module importer that supports packages."""
	@others
</t>
<t tx="ekr.20040711141351.70">def import_module(self, name, globals=None, locals=None, fromlist=None):
    parent = self.determine_parent(globals)
    q, tail = self.find_head_package(parent, str(name))
    m = self.load_tail(q, tail)
    if not fromlist:
        return q
    if hasattr(m, "__path__"):
        self.ensure_fromlist(m, fromlist)
    return m
</t>
<t tx="ekr.20040711141351.71">def determine_parent(self, globals):
    if not globals or not "__name__" in globals:
        return None
    pname = globals['__name__']
    if "__path__" in globals:
        parent = self.modules[pname]
        assert globals is parent.__dict__
        return parent
    if '.' in pname:
        i = pname.rfind('.')
        pname = pname[:i]
        parent = self.modules[pname]
        assert parent.__name__ == pname
        return parent
    return None
</t>
<t tx="ekr.20040711141351.72">def find_head_package(self, parent, name):
    if '.' in name:
        i = name.find('.')
        head = name[:i]
        tail = name[i+1:]
    else:
        head = name
        tail = ""
    if parent:
        qname = "%s.%s" % (parent.__name__, head)
    else:
        qname = head
    q = self.import_it(head, qname, parent)
    if q: return q, tail
    if parent:
        qname = head
        parent = None
        q = self.import_it(head, qname, parent)
        if q: return q, tail
    raise ImportError, "No module named " + qname
</t>
<t tx="ekr.20040711141351.73">def load_tail(self, q, tail):
    m = q
    while tail:
        i = tail.find('.')
        if i &lt; 0: i = len(tail)
        head, tail = tail[:i], tail[i+1:]
        mname = "%s.%s" % (m.__name__, head)
        m = self.import_it(head, mname, m)
        if not m:
            raise ImportError, "No module named " + mname
    return m
</t>
<t tx="ekr.20040711141351.74">def ensure_fromlist(self, m, fromlist, recursive=0):
    for sub in fromlist:
        if sub == "*":
            if not recursive:
                try:
                    all = m.__all__
                except AttributeError:
                    pass
                else:
                    self.ensure_fromlist(m, all, 1)
            continue
        if sub != "*" and not hasattr(m, sub):
            subname = "%s.%s" % (m.__name__, sub)
            submod = self.import_it(sub, subname, m)
            if not submod:
                raise ImportError, "No module named " + subname
</t>
<t tx="ekr.20040711141351.75">def import_it(self, partname, fqname, parent, force_load=0):
    if not partname:
        raise ValueError, "Empty module name"
    if not force_load:
        try:
            return self.modules[fqname]
        except KeyError:
            pass
    try:
        path = parent and parent.__path__
    except AttributeError:
        return None
    partname = str(partname)
    stuff = self.loader.find_module(partname, path)
    if not stuff:
        return None
    fqname = str(fqname)
    m = self.loader.load_module(fqname, stuff)
    if parent:
        setattr(parent, partname, m)
    return m
</t>
<t tx="ekr.20040711141351.76">def reload(self, module):
    name = str(module.__name__)
    if '.' not in name:
        return self.import_it(name, name, None, force_load=1)
    i = name.rfind('.')
    pname = name[:i]
    parent = self.modules[pname]
    return self.import_it(name[i+1:], name, parent, force_load=1)
</t>
<t tx="ekr.20040711141351.77">default_importer = None
current_importer = None

def install(importer = None):
    global current_importer
    current_importer = importer or default_importer or ModuleImporter()
    current_importer.install()
</t>
<t tx="ekr.20040711141351.78">def uninstall():
    global current_importer
    current_importer.uninstall()
</t>
<t tx="ekr.20040711141351.79">@ignore
@language c
/* Module definition and import implementation */

&lt;&lt; import #includes &gt;&gt;
&lt;&lt; import declarations &gt;&gt;
@others
</t>
<t tx="ekr.20040711141351.80">#include "Python.h"

#include "node.h"
#include "token.h"
#include "errcode.h"
#include "marshal.h"
#include "compile.h"
#include "eval.h"
#include "osdefs.h"
#include "importdl.h"

#ifdef HAVE_FCNTL_H
#include &lt;fcntl.h&gt;
#endif
</t>
<t tx="ekr.20040711141351.81">extern time_t PyOS_GetLastModificationTime(char *, FILE *);
						/* In getmtime.c */

/* Magic word to reject .pyc files generated by other Python versions.
   It should change for each incompatible change to the bytecode.

   The value of CR and LF is incorporated so if you ever read or write
   a .pyc file in text mode the magic number will be wrong; also, the
   Apple MPW compiler swaps their values, botching string constants.

   The magic numbers must be spaced apart atleast 2 values, as the
   -U interpeter flag will cause MAGIC+1 being used. They have been
   odd numbers for some time now.

   There were a variety of old schemes for setting the magic number.
   The current working scheme is to increment the previous value by
   10.

   Known values:
       Python 1.5:   20121
       Python 1.5.1: 20121
       Python 1.5.2: 20121
       Python 2.0:   50823
       Python 2.0.1: 50823
       Python 2.1:   60202
       Python 2.1.1: 60202
       Python 2.1.2: 60202
       Python 2.2:   60717
       Python 2.3a0: 62011
       Python 2.3a0: 62021
       Python 2.3a0: 62011 (!)
       Python 2.4a0: 62041
*/
#define MAGIC (62041 | ((long)'\r'&lt;&lt;16) | ((long)'\n'&lt;&lt;24))

/* Magic word as global; note that _PyImport_Init() can change the
   value of this global to accommodate for alterations of how the
   compiler works which are enabled by command line switches. */
static long pyc_magic = MAGIC;

/* See _PyImport_FixupExtension() below */
static PyObject *extensions = NULL;

/* This table is defined in config.c: */
extern struct _inittab _PyImport_Inittab[];

struct _inittab *PyImport_Inittab = _PyImport_Inittab;

/* these tables define the module suffixes that Python recognizes */
struct filedescr * _PyImport_Filetab = NULL;

#ifdef RISCOS
    static const struct filedescr _PyImport_StandardFiletab[] = {
        {"/py", "U", PY_SOURCE},
        {"/pyc", "rb", PY_COMPILED},
        {0, 0}
    };
#else
    static const struct filedescr _PyImport_StandardFiletab[] = {
        {".py", "U", PY_SOURCE},
    #ifdef MS_WINDOWS
        {".pyw", "U", PY_SOURCE},
    #endif
        {".pyc", "rb", PY_COMPILED},
        {0, 0}
    };
#endif</t>
<t tx="ekr.20040711141351.82">/* Initialize things */

void
_PyImport_Init(void)
{
	const struct filedescr *scan;
	struct filedescr *filetab;
	int countD = 0;
	int countS = 0;

	/* prepare _PyImport_Filetab: copy entries from
	   _PyImport_DynLoadFiletab and _PyImport_StandardFiletab.
	 */
	for (scan = _PyImport_DynLoadFiletab; scan-&gt;suffix != NULL; ++scan)
		++countD;
	for (scan = _PyImport_StandardFiletab; scan-&gt;suffix != NULL; ++scan)
		++countS;
	filetab = PyMem_NEW(struct filedescr, countD + countS + 1);
	memcpy(filetab, _PyImport_DynLoadFiletab,
	       countD * sizeof(struct filedescr));
	memcpy(filetab + countD, _PyImport_StandardFiletab,
	       countS * sizeof(struct filedescr));
	filetab[countD + countS].suffix = NULL;

	_PyImport_Filetab = filetab;

	if (Py_OptimizeFlag) {
		/* Replace ".pyc" with ".pyo" in _PyImport_Filetab */
		for (; filetab-&gt;suffix != NULL; filetab++) {
#ifndef RISCOS
			if (strcmp(filetab-&gt;suffix, ".pyc") == 0)
				filetab-&gt;suffix = ".pyo";
#else
			if (strcmp(filetab-&gt;suffix, "/pyc") == 0)
				filetab-&gt;suffix = "/pyo";
#endif
		}
	}

	if (Py_UnicodeFlag) {
		/* Fix the pyc_magic so that byte compiled code created
		   using the all-Unicode method doesn't interfere with
		   code created in normal operation mode. */
		pyc_magic = MAGIC + 1;
	}
}
</t>
<t tx="ekr.20040711141351.83">
void
_PyImportHooks_Init(void)
{
	PyObject *v, *path_hooks = NULL, *zimpimport;
	int err = 0;

	/* adding sys.path_hooks and sys.path_importer_cache, setting up
	   zipimport */

	if (Py_VerboseFlag)
		PySys_WriteStderr("# installing zipimport hook\n");

	v = PyList_New(0);
	if (v == NULL)
		goto error;
	err = PySys_SetObject("meta_path", v);
	Py_DECREF(v);
	if (err)
		goto error;
	v = PyDict_New();
	if (v == NULL)
		goto error;
	err = PySys_SetObject("path_importer_cache", v);
	Py_DECREF(v);
	if (err)
		goto error;
	path_hooks = PyList_New(0);
	if (path_hooks == NULL)
		goto error;
	err = PySys_SetObject("path_hooks", path_hooks);
	if (err) {
  error:
		PyErr_Print();
		Py_FatalError("initializing sys.meta_path, sys.path_hooks or "
			      "path_importer_cache failed");
	}
	zimpimport = PyImport_ImportModule("zipimport");
	if (zimpimport == NULL) {
		PyErr_Clear(); /* No zip import module -- okay */
		if (Py_VerboseFlag)
			PySys_WriteStderr("# can't import zipimport\n");
	}
	else {
		PyObject *zipimporter = PyObject_GetAttrString(zimpimport,
							       "zipimporter");
		Py_DECREF(zimpimport);
		if (zipimporter == NULL) {
			PyErr_Clear(); /* No zipimporter object -- okay */
			if (Py_VerboseFlag)
				PySys_WriteStderr(
				    "# can't import zipimport.zipimporter\n");
		}
		else {
			/* sys.path_hooks.append(zipimporter) */
			err = PyList_Append(path_hooks, zipimporter);
			Py_DECREF(zipimporter);
			if (err)
				goto error;
			if (Py_VerboseFlag)
				PySys_WriteStderr(
					"# installed zipimport hook\n");
		}
	}
	Py_DECREF(path_hooks);
}
</t>
<t tx="ekr.20040711141351.84">
void
_PyImport_Fini(void)
{
	Py_XDECREF(extensions);
	extensions = NULL;
	PyMem_DEL(_PyImport_Filetab);
	_PyImport_Filetab = NULL;
}
</t>
<t tx="ekr.20040711141351.85"></t>
<t tx="ekr.20040711141351.86">@ Locking primitives to prevent parallel imports of the same module  in different threads to return with a partially loaded module.  These calls are serialized by the global interpreter lock.
@c

#ifdef WITH_THREAD

#include "pythread.h"

static PyThread_type_lock import_lock = 0;
static long import_lock_thread = -1;
static int import_lock_level = 0;

static void
lock_import(void)
{
	long me = PyThread_get_thread_ident();
	if (me == -1)
		return; /* Too bad */
	if (import_lock == NULL)
		import_lock = PyThread_allocate_lock();
	if (import_lock_thread == me) {
		import_lock_level++;
		return;
	}
	if (import_lock_thread != -1 || !PyThread_acquire_lock(import_lock, 0))
	{
		PyThreadState *tstate = PyEval_SaveThread();
		PyThread_acquire_lock(import_lock, 1);
		PyEval_RestoreThread(tstate);
	}
	import_lock_thread = me;
	import_lock_level = 1;
}
</t>
<t tx="ekr.20040711141351.87">
static int
unlock_import(void)
{
	long me = PyThread_get_thread_ident();
	if (me == -1)
		return 0; /* Too bad */
	if (import_lock_thread != me)
		return -1;
	import_lock_level--;
	if (import_lock_level == 0) {
		import_lock_thread = -1;
		PyThread_release_lock(import_lock);
	}
	return 1;
}
</t>
<t tx="ekr.20040711141351.88">
#else

#define lock_import()
#define unlock_import() 0

#endif

static PyObject *
imp_lock_held(PyObject *self, PyObject *noargs)
{
#ifdef WITH_THREAD
	return PyBool_FromLong(import_lock_thread != -1);
#else
	return PyBool_FromLong(0);
#endif
}
</t>
<t tx="ekr.20040711141351.89">
static PyObject *
imp_acquire_lock(PyObject *self, PyObject *noargs)
{
#ifdef WITH_THREAD
	lock_import();
#endif
	Py_INCREF(Py_None);
	return Py_None;
}
</t>
<t tx="ekr.20040711141351.90">
static PyObject *
imp_release_lock(PyObject *self, PyObject *noargs)
{
#ifdef WITH_THREAD
	if (unlock_import() &lt; 0) {
		PyErr_SetString(PyExc_RuntimeError,
				"not holding the import lock");
		return NULL;
	}
#endif
	Py_INCREF(Py_None);
	return Py_None;
}
</t>
<t tx="ekr.20040711141351.91">@ Helper for sys
@c

PyObject *
PyImport_GetModuleDict(void)
{
	PyInterpreterState *interp = PyThreadState_GET()-&gt;interp;
	if (interp-&gt;modules == NULL)
		Py_FatalError("PyImport_GetModuleDict: no module dictionary!");
	return interp-&gt;modules;
}
</t>
<t tx="ekr.20040711141351.92">@ List of names to clear in sys
@c

static char* sys_deletes[] = {
	"path", "argv", "ps1", "ps2", "exitfunc",
	"exc_type", "exc_value", "exc_traceback",
	"last_type", "last_value", "last_traceback",
	"path_hooks", "path_importer_cache", "meta_path",
	NULL
};

static char* sys_files[] = {
	"stdin", "__stdin__",
	"stdout", "__stdout__",
	"stderr", "__stderr__",
	NULL
};


/* Un-initialize things, as good as we can */

void
PyImport_Cleanup(void)
{
	int pos, ndone;
	char *name;
	PyObject *key, *value, *dict;
	PyInterpreterState *interp = PyThreadState_GET()-&gt;interp;
	PyObject *modules = interp-&gt;modules;

	if (modules == NULL)
		return; /* Already done */

	/* Delete some special variables first.  These are common
	   places where user values hide and people complain when their
	   destructors fail.  Since the modules containing them are
	   deleted *last* of all, they would come too late in the normal
	   destruction order.  Sigh. */

	value = PyDict_GetItemString(modules, "__builtin__");
	if (value != NULL &amp;&amp; PyModule_Check(value)) {
		dict = PyModule_GetDict(value);
		if (Py_VerboseFlag)
			PySys_WriteStderr("# clear __builtin__._\n");
		PyDict_SetItemString(dict, "_", Py_None);
	}
	value = PyDict_GetItemString(modules, "sys");
	if (value != NULL &amp;&amp; PyModule_Check(value)) {
		char **p;
		PyObject *v;
		dict = PyModule_GetDict(value);
		for (p = sys_deletes; *p != NULL; p++) {
			if (Py_VerboseFlag)
				PySys_WriteStderr("# clear sys.%s\n", *p);
			PyDict_SetItemString(dict, *p, Py_None);
		}
		for (p = sys_files; *p != NULL; p+=2) {
			if (Py_VerboseFlag)
				PySys_WriteStderr("# restore sys.%s\n", *p);
			v = PyDict_GetItemString(dict, *(p+1));
			if (v == NULL)
				v = Py_None;
			PyDict_SetItemString(dict, *p, v);
		}
	}

	/* First, delete __main__ */
	value = PyDict_GetItemString(modules, "__main__");
	if (value != NULL &amp;&amp; PyModule_Check(value)) {
		if (Py_VerboseFlag)
			PySys_WriteStderr("# cleanup __main__\n");
		_PyModule_Clear(value);
		PyDict_SetItemString(modules, "__main__", Py_None);
	}

	/* The special treatment of __builtin__ here is because even
	   when it's not referenced as a module, its dictionary is
	   referenced by almost every module's __builtins__.  Since
	   deleting a module clears its dictionary (even if there are
	   references left to it), we need to delete the __builtin__
	   module last.  Likewise, we don't delete sys until the very
	   end because it is implicitly referenced (e.g. by print).

	   Also note that we 'delete' modules by replacing their entry
	   in the modules dict with None, rather than really deleting
	   them; this avoids a rehash of the modules dictionary and
	   also marks them as "non existent" so they won't be
	   re-imported. */

	/* Next, repeatedly delete modules with a reference count of
	   one (skipping __builtin__ and sys) and delete them */
	do {
		ndone = 0;
		pos = 0;
		while (PyDict_Next(modules, &amp;pos, &amp;key, &amp;value)) {
			if (value-&gt;ob_refcnt != 1)
				continue;
			if (PyString_Check(key) &amp;&amp; PyModule_Check(value)) {
				name = PyString_AS_STRING(key);
				if (strcmp(name, "__builtin__") == 0)
					continue;
				if (strcmp(name, "sys") == 0)
					continue;
				if (Py_VerboseFlag)
					PySys_WriteStderr(
						"# cleanup[1] %s\n", name);
				_PyModule_Clear(value);
				PyDict_SetItem(modules, key, Py_None);
				ndone++;
			}
		}
	} while (ndone &gt; 0);

	/* Next, delete all modules (still skipping __builtin__ and sys) */
	pos = 0;
	while (PyDict_Next(modules, &amp;pos, &amp;key, &amp;value)) {
		if (PyString_Check(key) &amp;&amp; PyModule_Check(value)) {
			name = PyString_AS_STRING(key);
			if (strcmp(name, "__builtin__") == 0)
				continue;
			if (strcmp(name, "sys") == 0)
				continue;
			if (Py_VerboseFlag)
				PySys_WriteStderr("# cleanup[2] %s\n", name);
			_PyModule_Clear(value);
			PyDict_SetItem(modules, key, Py_None);
		}
	}

	/* Next, delete sys and __builtin__ (in that order) */
	value = PyDict_GetItemString(modules, "sys");
	if (value != NULL &amp;&amp; PyModule_Check(value)) {
		if (Py_VerboseFlag)
			PySys_WriteStderr("# cleanup sys\n");
		_PyModule_Clear(value);
		PyDict_SetItemString(modules, "sys", Py_None);
	}
	value = PyDict_GetItemString(modules, "__builtin__");
	if (value != NULL &amp;&amp; PyModule_Check(value)) {
		if (Py_VerboseFlag)
			PySys_WriteStderr("# cleanup __builtin__\n");
		_PyModule_Clear(value);
		PyDict_SetItemString(modules, "__builtin__", Py_None);
	}

	/* Finally, clear and delete the modules directory */
	PyDict_Clear(modules);
	interp-&gt;modules = NULL;
	Py_DECREF(modules);
}
</t>
<t tx="ekr.20040711141351.93">@ Helper for pythonrun.c -- return magic number
@c

long
PyImport_GetMagicNumber(void)
{
	return pyc_magic;
}
</t>
<t tx="ekr.20040711141351.94">@ Magic for extension modules (built-in as well as dynamically  loaded). To prevent initializing an extension module more than  once, we keep a static dictionary 'extensions' keyed by module name  (for built-in modules) or by filename (for dynamically loaded  modules), containing these modules. A copy of the module's  dictionary is stored by calling _PyImport_FixupExtension()  immediately after the module initialization function succeeds. A  copy can be retrieved from there by calling  _PyImport_FindExtension().
@c

PyObject *
_PyImport_FixupExtension(char *name, char *filename)
{
	PyObject *modules, *mod, *dict, *copy;
	if (extensions == NULL) {
		extensions = PyDict_New();
		if (extensions == NULL)
			return NULL;
	}
	modules = PyImport_GetModuleDict();
	mod = PyDict_GetItemString(modules, name);
	if (mod == NULL || !PyModule_Check(mod)) {
		PyErr_Format(PyExc_SystemError,
		  "_PyImport_FixupExtension: module %.200s not loaded", name);
		return NULL;
	}
	dict = PyModule_GetDict(mod);
	if (dict == NULL)
		return NULL;
	copy = PyDict_Copy(dict);
	if (copy == NULL)
		return NULL;
	PyDict_SetItemString(extensions, filename, copy);
	Py_DECREF(copy);
	return copy;
}
</t>
<t tx="ekr.20040711141351.95">
PyObject *
_PyImport_FindExtension(char *name, char *filename)
{
	PyObject *dict, *mod, *mdict;
	if (extensions == NULL)
		return NULL;
	dict = PyDict_GetItemString(extensions, filename);
	if (dict == NULL)
		return NULL;
	mod = PyImport_AddModule(name);
	if (mod == NULL)
		return NULL;
	mdict = PyModule_GetDict(mod);
	if (mdict == NULL)
		return NULL;
	if (PyDict_Update(mdict, dict))
		return NULL;
	if (Py_VerboseFlag)
		PySys_WriteStderr("import %s # previously loaded (%s)\n",
			name, filename);
	return mod;
}
</t>
<t tx="ekr.20040711141351.96">@ Get the module object corresponding to a module name.  First check the modules dictionary if there's one there,  if not, create a new one and insert it in the modules dictionary.  Because the former action is most common, THIS DOES NOT RETURN A  'NEW' REFERENCE!
@c

PyObject *
PyImport_AddModule(char *name)
{
	PyObject *modules = PyImport_GetModuleDict();
	PyObject *m;

	if ((m = PyDict_GetItemString(modules, name)) != NULL &amp;&amp;
	    PyModule_Check(m))
		return m;
	m = PyModule_New(name);
	if (m == NULL)
		return NULL;
	if (PyDict_SetItemString(modules, name, m) != 0) {
		Py_DECREF(m);
		return NULL;
	}
	Py_DECREF(m); /* Yes, it still exists, in modules! */

	return m;
}
</t>
<t tx="ekr.20040711141351.97">@ Execute a code object in a module and return the module object  WITH INCREMENTED REFERENCE COUNT
@c

PyObject *
PyImport_ExecCodeModule(char *name, PyObject *co)
{
	return PyImport_ExecCodeModuleEx(name, co, (char *)NULL);
}
</t>
<t tx="ekr.20040711141351.98">
PyObject *
PyImport_ExecCodeModuleEx(char *name, PyObject *co, char *pathname)
{
	PyObject *modules = PyImport_GetModuleDict();
	PyObject *m, *d, *v;

	m = PyImport_AddModule(name);
	if (m == NULL)
		return NULL;
	/* If the module is being reloaded, we get the old module back
	   and re-use its dict to exec the new code. */
	d = PyModule_GetDict(m);
	if (PyDict_GetItemString(d, "__builtins__") == NULL) {
		if (PyDict_SetItemString(d, "__builtins__",
					 PyEval_GetBuiltins()) != 0)
			return NULL;
	}
	/* Remember the filename as the __file__ attribute */
	v = NULL;
	if (pathname != NULL) {
		v = PyString_FromString(pathname);
		if (v == NULL)
			PyErr_Clear();
	}
	if (v == NULL) {
		v = ((PyCodeObject *)co)-&gt;co_filename;
		Py_INCREF(v);
	}
	if (PyDict_SetItemString(d, "__file__", v) != 0)
		PyErr_Clear(); /* Not important enough to report */
	Py_DECREF(v);

	v = PyEval_EvalCode((PyCodeObject *)co, d, d);
	if (v == NULL)
		return NULL;
	Py_DECREF(v);

	if ((m = PyDict_GetItemString(modules, name)) == NULL) {
		PyErr_Format(PyExc_ImportError,
			     "Loaded module %.200s not found in sys.modules",
			     name);
		return NULL;
	}

	Py_INCREF(m);

	return m;
}
</t>
<t tx="ekr.20040711141351.99">@ Given a pathname for a Python source file, fill a buffer with the  pathname for the corresponding compiled file. Return the pathname  for the compiled file, or NULL if there's no space in the buffer.  Doesn't set an exception.
@c

static char *
make_compiled_pathname(char *pathname, char *buf, size_t buflen)
{
	size_t len = strlen(pathname);
	if (len+2 &gt; buflen)
		return NULL;

#ifdef MS_WINDOWS
	/* Treat .pyw as if it were .py.  The case of ".pyw" must match
	   that used in _PyImport_StandardFiletab. */
	if (len &gt;= 4 &amp;&amp; strcmp(&amp;pathname[len-4], ".pyw") == 0)
		--len;	/* pretend 'w' isn't there */
#endif
	memcpy(buf, pathname, len);
	buf[len] = Py_OptimizeFlag ? 'o' : 'c';
	buf[len+1] = '\0';

	return buf;
}
</t>
<t tx="ekr.20040711141351.100">@ Given a pathname for a Python source file, its time of last  modification, and a pathname for a compiled file, check whether the  compiled file represents the same version of the source. If so,  return a FILE pointer for the compiled file, positioned just after  the header; if not, return NULL.  Doesn't set an exception.
@c

static FILE *
check_compiled_module(char *pathname, long mtime, char *cpathname)
{
	FILE *fp;
	long magic;
	long pyc_mtime;

	fp = fopen(cpathname, "rb");
	if (fp == NULL)
		return NULL;
	magic = PyMarshal_ReadLongFromFile(fp);
	if (magic != pyc_magic) {
		if (Py_VerboseFlag)
			PySys_WriteStderr("# %s has bad magic\n", cpathname);
		fclose(fp);
		return NULL;
	}
	pyc_mtime = PyMarshal_ReadLongFromFile(fp);
	if (pyc_mtime != mtime) {
		if (Py_VerboseFlag)
			PySys_WriteStderr("# %s has bad mtime\n", cpathname);
		fclose(fp);
		return NULL;
	}
	if (Py_VerboseFlag)
		PySys_WriteStderr("# %s matches %s\n", cpathname, pathname);
	return fp;
}
</t>
<t tx="ekr.20040711141351.101">@ Read a code object from a file and check it for validity
@c

static PyCodeObject *
read_compiled_module(char *cpathname, FILE *fp)
{
	PyObject *co;

	co = PyMarshal_ReadLastObjectFromFile(fp);
	if (co == NULL)
		return NULL;
	if (!PyCode_Check(co)) {
		PyErr_Format(PyExc_ImportError,
			     "Non-code object in %.200s", cpathname);
		Py_DECREF(co);
		return NULL;
	}
	return (PyCodeObject *)co;
}
</t>
<t tx="ekr.20040711141351.102">@ Load a module from a compiled file, execute it, and return its  module object WITH INCREMENTED REFERENCE COUNT
@c

static PyObject *
load_compiled_module(char *name, char *cpathname, FILE *fp)
{
	long magic;
	PyCodeObject *co;
	PyObject *m;

	magic = PyMarshal_ReadLongFromFile(fp);
	if (magic != pyc_magic) {
		PyErr_Format(PyExc_ImportError,
			     "Bad magic number in %.200s", cpathname);
		return NULL;
	}
	(void) PyMarshal_ReadLongFromFile(fp);
	co = read_compiled_module(cpathname, fp);
	if (co == NULL)
		return NULL;
	if (Py_VerboseFlag)
		PySys_WriteStderr("import %s # precompiled from %s\n",
			name, cpathname);
	m = PyImport_ExecCodeModuleEx(name, (PyObject *)co, cpathname);
	Py_DECREF(co);

	return m;
}
</t>
<t tx="ekr.20040711141351.103">@ Parse a source file and return the corresponding code object
@c

static PyCodeObject *
parse_source_module(char *pathname, FILE *fp)
{
	PyCodeObject *co;
	node *n;

	n = PyParser_SimpleParseFile(fp, pathname, Py_file_input);
	if (n == NULL)
		return NULL;
	co = PyNode_Compile(n, pathname);
	PyNode_Free(n);

	return co;
}
</t>
<t tx="ekr.20040711141351.104">@ Helper to open a bytecode file for writing in exclusive mode
@c

static FILE *
open_exclusive(char *filename)
{
#if defined(O_EXCL)&amp;&amp;defined(O_CREAT)&amp;&amp;defined(O_WRONLY)&amp;&amp;defined(O_TRUNC)
	/* Use O_EXCL to avoid a race condition when another process tries to
	   write the same file.  When that happens, our open() call fails,
	   which is just fine (since it's only a cache).
	   XXX If the file exists and is writable but the directory is not
	   writable, the file will never be written.  Oh well.
	*/
	int fd;
	(void) unlink(filename);
	fd = open(filename, O_EXCL|O_CREAT|O_WRONLY|O_TRUNC
#ifdef O_BINARY
				|O_BINARY   /* necessary for Windows */
#endif
#ifdef __VMS
                        , 0666, "ctxt=bin", "shr=nil");
#else
                        , 0666);
#endif
	if (fd &lt; 0)
		return NULL;
	return fdopen(fd, "wb");
#else
	/* Best we can do -- on Windows this can't happen anyway */
	return fopen(filename, "wb");
#endif
}
</t>
<t tx="ekr.20040711141351.105">@ Write a compiled module to a file, placing the time of last  modification of its source into the header.  Errors are ignored, if a write error occurs an attempt is made to  remove the file.
@c

static void
write_compiled_module(PyCodeObject *co, char *cpathname, long mtime)
{
	FILE *fp;

	fp = open_exclusive(cpathname);
	if (fp == NULL) {
		if (Py_VerboseFlag)
			PySys_WriteStderr(
				"# can't create %s\n", cpathname);
		return;
	}
	PyMarshal_WriteLongToFile(pyc_magic, fp, Py_MARSHAL_VERSION);
	/* First write a 0 for mtime */
	PyMarshal_WriteLongToFile(0L, fp, Py_MARSHAL_VERSION);
	PyMarshal_WriteObjectToFile((PyObject *)co, fp, Py_MARSHAL_VERSION);
	if (fflush(fp) != 0 || ferror(fp)) {
		if (Py_VerboseFlag)
			PySys_WriteStderr("# can't write %s\n", cpathname);
		/* Don't keep partial file */
		fclose(fp);
		(void) unlink(cpathname);
		return;
	}
	/* Now write the true mtime */
	fseek(fp, 4L, 0);
	PyMarshal_WriteLongToFile(mtime, fp, Py_MARSHAL_VERSION);
	fflush(fp);
	fclose(fp);
	if (Py_VerboseFlag)
		PySys_WriteStderr("# wrote %s\n", cpathname);
}
</t>
<t tx="ekr.20040711141351.106">@ Load a source module from a given file and return its module  object WITH INCREMENTED REFERENCE COUNT. If there's a matching  byte-compiled file, use that instead.
@c

static PyObject *
load_source_module(char *name, char *pathname, FILE *fp)
{
	time_t mtime;
	FILE *fpc;
	char buf[MAXPATHLEN+1];
	char *cpathname;
	PyCodeObject *co;
	PyObject *m;

	mtime = PyOS_GetLastModificationTime(pathname, fp);
	if (mtime == (time_t)(-1))
		return NULL;
#if SIZEOF_TIME_T &gt; 4
	/* Python's .pyc timestamp handling presumes that the timestamp fits
	   in 4 bytes. This will be fine until sometime in the year 2038,
	   when a 4-byte signed time_t will overflow.
	 */
	if (mtime &gt;&gt; 32) {
		PyErr_SetString(PyExc_OverflowError,
			"modification time overflows a 4 byte field");
		return NULL;
	}
#endif
	cpathname = make_compiled_pathname(pathname, buf,
					   (size_t)MAXPATHLEN + 1);
	if (cpathname != NULL &amp;&amp;
	    (fpc = check_compiled_module(pathname, mtime, cpathname))) {
		co = read_compiled_module(cpathname, fpc);
		fclose(fpc);
		if (co == NULL)
			return NULL;
		if (Py_VerboseFlag)
			PySys_WriteStderr("import %s # precompiled from %s\n",
				name, cpathname);
		pathname = cpathname;
	}
	else {
		co = parse_source_module(pathname, fp);
		if (co == NULL)
			return NULL;
		if (Py_VerboseFlag)
			PySys_WriteStderr("import %s # from %s\n",
				name, pathname);
		write_compiled_module(co, cpathname, mtime);
	}
	m = PyImport_ExecCodeModuleEx(name, (PyObject *)co, pathname);
	Py_DECREF(co);

	return m;
}
</t>
<t tx="ekr.20040711141351.107">@ Forward
@c

static PyObject *load_module(char *, FILE *, char *, int, PyObject *);
static struct filedescr *find_module(char *, char *, PyObject *,
				     char *, size_t, FILE **, PyObject **);
static struct _frozen *find_frozen(char *name);

/* Load a package and return its module object WITH INCREMENTED
   REFERENCE COUNT */

static PyObject *
load_package(char *name, char *pathname)
{
	PyObject *m, *d, *file, *path;
	int err;
	char buf[MAXPATHLEN+1];
	FILE *fp = NULL;
	struct filedescr *fdp;

	m = PyImport_AddModule(name);
	if (m == NULL)
		return NULL;
	if (Py_VerboseFlag)
		PySys_WriteStderr("import %s # directory %s\n",
			name, pathname);
	d = PyModule_GetDict(m);
	file = PyString_FromString(pathname);
	if (file == NULL)
		return NULL;
	path = Py_BuildValue("[O]", file);
	if (path == NULL) {
		Py_DECREF(file);
		return NULL;
	}
	err = PyDict_SetItemString(d, "__file__", file);
	if (err == 0)
		err = PyDict_SetItemString(d, "__path__", path);
	if (err != 0) {
		m = NULL;
		goto cleanup;
	}
	buf[0] = '\0';
	fdp = find_module(name, "__init__", path, buf, sizeof(buf), &amp;fp, NULL);
	if (fdp == NULL) {
		if (PyErr_ExceptionMatches(PyExc_ImportError)) {
			PyErr_Clear();
			Py_INCREF(m);
		}
		else
			m = NULL;
		goto cleanup;
	}
	m = load_module(name, fp, buf, fdp-&gt;type, NULL);
	if (fp != NULL)
		fclose(fp);
  cleanup:
	Py_XDECREF(path);
	Py_XDECREF(file);
	return m;
}
</t>
<t tx="ekr.20040711141351.108">@ Helper to test for built-in module
@c

static int
is_builtin(char *name)
{
	int i;
	for (i = 0; PyImport_Inittab[i].name != NULL; i++) {
		if (strcmp(name, PyImport_Inittab[i].name) == 0) {
			if (PyImport_Inittab[i].initfunc == NULL)
				return -1;
			else
				return 1;
		}
	}
	return 0;
}
</t>
<t tx="ekr.20040711141351.109">@ Return an importer object for a sys.path/pkg.__path__ item 'p',  possibly by fetching it from the path_importer_cache dict. If it  wasn't yet cached, traverse path_hooks until it a hook is found  that can handle the path item. Return None if no hook could;  this tells our caller it should fall back to the builtin  import mechanism. Cache the result in path_importer_cache.  Returns a borrowed reference.
@c

static PyObject *
get_path_importer(PyObject *path_importer_cache, PyObject *path_hooks,
		  PyObject *p)
{
	PyObject *importer;
	int j, nhooks;

	/* These conditions are the caller's responsibility: */
	assert(PyList_Check(path_hooks));
	assert(PyDict_Check(path_importer_cache));

	nhooks = PyList_Size(path_hooks);
	if (nhooks &lt; 0)
		return NULL; /* Shouldn't happen */

	importer = PyDict_GetItem(path_importer_cache, p);
	if (importer != NULL)
		return importer;

	/* set path_importer_cache[p] to None to avoid recursion */
	if (PyDict_SetItem(path_importer_cache, p, Py_None) != 0)
		return NULL;

	for (j = 0; j &lt; nhooks; j++) {
		PyObject *hook = PyList_GetItem(path_hooks, j);
		if (hook == NULL)
			return NULL;
		importer = PyObject_CallFunction(hook, "O", p);
		if (importer != NULL)
			break;

		if (!PyErr_ExceptionMatches(PyExc_ImportError)) {
			return NULL;
		}
		PyErr_Clear();
	}
	if (importer == NULL)
		importer = Py_None;
	else if (importer != Py_None) {
		int err = PyDict_SetItem(path_importer_cache, p, importer);
		Py_DECREF(importer);
		if (err != 0)
			return NULL;
	}
	return importer;
}
</t>
<t tx="ekr.20040711141351.110">@ Search the path (default sys.path) for a module. Return the  corresponding filedescr struct, and (via return arguments) the  pathname and an open file. Return NULL if the module is not found.
@c

#ifdef MS_COREDLL
extern FILE *PyWin_FindRegisteredModule(const char *, struct filedescr **,
					char *, int);
#endif

static int case_ok(char *, int, int, char *);
static int find_init_module(char *); /* Forward */
static struct filedescr importhookdescr = {"", "", IMP_HOOK};

static struct filedescr *
find_module(char *fullname, char *subname, PyObject *path, char *buf,
	    size_t buflen, FILE **p_fp, PyObject **p_loader)
{
	int i, npath;
	size_t len, namelen;
	struct filedescr *fdp = NULL;
	char *filemode;
	FILE *fp = NULL;
	PyObject *path_hooks, *path_importer_cache;
#ifndef RISCOS
	struct stat statbuf;
#endif
	static struct filedescr fd_frozen = {"", "", PY_FROZEN};
	static struct filedescr fd_builtin = {"", "", C_BUILTIN};
	static struct filedescr fd_package = {"", "", PKG_DIRECTORY};
	char name[MAXPATHLEN+1];
#if defined(PYOS_OS2)
	size_t saved_len;
	size_t saved_namelen;
	char *saved_buf = NULL;
#endif
	if (p_loader != NULL)
		*p_loader = NULL;

	if (strlen(subname) &gt; MAXPATHLEN) {
		PyErr_SetString(PyExc_OverflowError,
				"module name is too long");
		return NULL;
	}
	strcpy(name, subname);

	/* sys.meta_path import hook */
	if (p_loader != NULL) {
		PyObject *meta_path;

		meta_path = PySys_GetObject("meta_path");
		if (meta_path == NULL || !PyList_Check(meta_path)) {
			PyErr_SetString(PyExc_ImportError,
					"sys.meta_path must be a list of "
					"import hooks");
			return NULL;
		}
		Py_INCREF(meta_path);  /* zap guard */
		npath = PyList_Size(meta_path);
		for (i = 0; i &lt; npath; i++) {
			PyObject *loader;
			PyObject *hook = PyList_GetItem(meta_path, i);
			loader = PyObject_CallMethod(hook, "find_module",
						     "sO", fullname,
						     path != NULL ?
						     path : Py_None);
			if (loader == NULL) {
				Py_DECREF(meta_path);
				return NULL;  /* true error */
			}
			if (loader != Py_None) {
				/* a loader was found */
				*p_loader = loader;
				Py_DECREF(meta_path);
				return &amp;importhookdescr;
			}
			Py_DECREF(loader);
		}
		Py_DECREF(meta_path);
	}

	if (path != NULL &amp;&amp; PyString_Check(path)) {
		/* The only type of submodule allowed inside a "frozen"
		   package are other frozen modules or packages. */
		if (PyString_Size(path) + 1 + strlen(name) &gt;= (size_t)buflen) {
			PyErr_SetString(PyExc_ImportError,
					"full frozen module name too long");
			return NULL;
		}
		strcpy(buf, PyString_AsString(path));
		strcat(buf, ".");
		strcat(buf, name);
		strcpy(name, buf);
		if (find_frozen(name) != NULL) {
			strcpy(buf, name);
			return &amp;fd_frozen;
		}
		PyErr_Format(PyExc_ImportError,
			     "No frozen submodule named %.200s", name);
		return NULL;
	}
	if (path == NULL) {
		if (is_builtin(name)) {
			strcpy(buf, name);
			return &amp;fd_builtin;
		}
		if ((find_frozen(name)) != NULL) {
			strcpy(buf, name);
			return &amp;fd_frozen;
		}

#ifdef MS_COREDLL
		fp = PyWin_FindRegisteredModule(name, &amp;fdp, buf, buflen);
		if (fp != NULL) {
			*p_fp = fp;
			return fdp;
		}
#endif
		path = PySys_GetObject("path");
	}
	if (path == NULL || !PyList_Check(path)) {
		PyErr_SetString(PyExc_ImportError,
				"sys.path must be a list of directory names");
		return NULL;
	}

	path_hooks = PySys_GetObject("path_hooks");
	if (path_hooks == NULL || !PyList_Check(path_hooks)) {
		PyErr_SetString(PyExc_ImportError,
				"sys.path_hooks must be a list of "
				"import hooks");
		return NULL;
	}
	path_importer_cache = PySys_GetObject("path_importer_cache");
	if (path_importer_cache == NULL ||
	    !PyDict_Check(path_importer_cache)) {
		PyErr_SetString(PyExc_ImportError,
				"sys.path_importer_cache must be a dict");
		return NULL;
	}

	npath = PyList_Size(path);
	namelen = strlen(name);
	for (i = 0; i &lt; npath; i++) {
		PyObject *copy = NULL;
		PyObject *v = PyList_GetItem(path, i);
#ifdef Py_USING_UNICODE
		if (PyUnicode_Check(v)) {
			copy = PyUnicode_Encode(PyUnicode_AS_UNICODE(v),
				PyUnicode_GET_SIZE(v), Py_FileSystemDefaultEncoding, NULL);
			if (copy == NULL)
				return NULL;
			v = copy;
		}
		else
#endif
		if (!PyString_Check(v))
			continue;
		len = PyString_Size(v);
		if (len + 2 + namelen + MAXSUFFIXSIZE &gt;= buflen) {
			Py_XDECREF(copy);
			continue; /* Too long */
		}
		strcpy(buf, PyString_AsString(v));
		if (strlen(buf) != len) {
			Py_XDECREF(copy);
			continue; /* v contains '\0' */
		}

		/* sys.path_hooks import hook */
		if (p_loader != NULL) {
			PyObject *importer;

			importer = get_path_importer(path_importer_cache,
						     path_hooks, v);
			if (importer == NULL)
				return NULL;
			/* Note: importer is a borrowed reference */
			if (importer != Py_None) {
				PyObject *loader;
				loader = PyObject_CallMethod(importer,
							     "find_module",
							     "s", fullname);
				if (loader == NULL)
					return NULL;  /* error */
				if (loader != Py_None) {
					/* a loader was found */
					*p_loader = loader;
					return &amp;importhookdescr;
				}
				Py_DECREF(loader);
			}
			/* no hook was successful, use builtin import */
		}

		if (len &gt; 0 &amp;&amp; buf[len-1] != SEP
#ifdef ALTSEP
		    &amp;&amp; buf[len-1] != ALTSEP
#endif
		    )
			buf[len++] = SEP;
		strcpy(buf+len, name);
		len += namelen;

		/* Check for package import (buf holds a directory name,
		   and there's an __init__ module in that directory */
#ifdef HAVE_STAT
		if (stat(buf, &amp;statbuf) == 0 &amp;&amp;         /* it exists */
		    S_ISDIR(statbuf.st_mode) &amp;&amp;         /* it's a directory */
		    find_init_module(buf) &amp;&amp;            /* it has __init__.py */
		    case_ok(buf, len, namelen, name)) { /* and case matches */
			Py_XDECREF(copy);
			return &amp;fd_package;
		}
#else
		/* XXX How are you going to test for directories? */
#ifdef RISCOS
		if (isdir(buf) &amp;&amp;
		    find_init_module(buf) &amp;&amp;
		    case_ok(buf, len, namelen, name)) {
			Py_XDECREF(copy);
			return &amp;fd_package;
		}
#endif
#endif
#if defined(PYOS_OS2)
		/* take a snapshot of the module spec for restoration
		 * after the 8 character DLL hackery
		 */
		saved_buf = strdup(buf);
		saved_len = len;
		saved_namelen = namelen;
#endif /* PYOS_OS2 */
		for (fdp = _PyImport_Filetab; fdp-&gt;suffix != NULL; fdp++) {
#if defined(PYOS_OS2)
			/* OS/2 limits DLLs to 8 character names (w/o
			   extension)
			 * so if the name is longer than that and its a
			 * dynamically loaded module we're going to try,
			 * truncate the name before trying
			 */
			if (strlen(subname) &gt; 8) {
				/* is this an attempt to load a C extension? */
				const struct filedescr *scan;
				scan = _PyImport_DynLoadFiletab;
				while (scan-&gt;suffix != NULL) {
					if (!strcmp(scan-&gt;suffix, fdp-&gt;suffix))
						break;
					else
						scan++;
				}
				if (scan-&gt;suffix != NULL) {
					/* yes, so truncate the name */
					namelen = 8;
					len -= strlen(subname) - namelen;
					buf[len] = '\0';
				}
			}
#endif /* PYOS_OS2 */
			strcpy(buf+len, fdp-&gt;suffix);
			if (Py_VerboseFlag &gt; 1)
				PySys_WriteStderr("# trying %s\n", buf);
			filemode = fdp-&gt;mode;
			if (filemode[0] == 'U') 
				filemode = "r" PY_STDIOTEXTMODE;
			fp = fopen(buf, filemode);
			if (fp != NULL) {
				if (case_ok(buf, len, namelen, name))
					break;
				else {	 /* continue search */
					fclose(fp);
					fp = NULL;
				}
			}
#if defined(PYOS_OS2)
			/* restore the saved snapshot */
			strcpy(buf, saved_buf);
			len = saved_len;
			namelen = saved_namelen;
#endif
		}
#if defined(PYOS_OS2)
		/* don't need/want the module name snapshot anymore */
		if (saved_buf)
		{
			free(saved_buf);
			saved_buf = NULL;
		}
#endif
		Py_XDECREF(copy);
		if (fp != NULL)
			break;
	}
	if (fp == NULL) {
		PyErr_Format(PyExc_ImportError,
			     "No module named %.200s", name);
		return NULL;
	}
	*p_fp = fp;
	return fdp;
}
</t>
<t tx="ekr.20040711141351.111">@ case_ok(char* buf, int len, int namelen, char* name) * The arguments here are tricky, best shown by example: *  /a/b/c/d/e/f/g/h/i/j/k/some_long_module_name.py\0 *  ^           ^          ^  ^ *  |--------------------- buf ---------------------| *  |------------------- len ------------------| *              |------ name -------| *              |----- namelen -----| * buf is the full path, but len only counts up to (&amp; exclusive of) the * extension. name is the module name, also exclusive of extension. * * We've already done a successful stat() or fopen() on buf, so know that * there's some match, possibly case-insensitive. * * case_ok() is to return 1 if there's a case-sensitive match for * name, else 0. case_ok() is also to return 1 if envar PYTHONCASEOK * exists. * * case_ok() is used to implement case-sensitive import semantics even * on platforms with case-insensitive filesystems. It's trivial to implement * for case-sensitive filesystems. It's pretty much a cross-platform * nightmare for systems with case-insensitive filesystems.
First we may need a pile of platform-specific header files; the sequence * of #if's here should match the sequence in the body of case_ok().
@c

#if defined(MS_WINDOWS) || defined(__CYGWIN__)
#include &lt;windows.h&gt;
#ifdef __CYGWIN__
#include &lt;sys/cygwin.h&gt;
#endif

#elif defined(DJGPP)
#include &lt;dir.h&gt;

#elif defined(__MACH__) &amp;&amp; defined(__APPLE__) &amp;&amp; defined(HAVE_DIRENT_H)
#include &lt;sys/types.h&gt;
#include &lt;dirent.h&gt;

#elif defined(PYOS_OS2)
#define INCL_DOS
#define INCL_DOSERRORS
#define INCL_NOPMAPI
#include &lt;os2.h&gt;

#elif defined(RISCOS)
#include "oslib/osfscontrol.h"
#endif

static int
case_ok(char *buf, int len, int namelen, char *name)
{
/* Pick a platform-specific implementation; the sequence of #if's here should
 * match the sequence just above.
 */

/* MS_WINDOWS || __CYGWIN__ */
#if defined(MS_WINDOWS) || defined(__CYGWIN__)
	WIN32_FIND_DATA data;
	HANDLE h;
#ifdef __CYGWIN__
	char tempbuf[MAX_PATH];
#endif

	if (Py_GETENV("PYTHONCASEOK") != NULL)
		return 1;

#ifdef __CYGWIN__
	cygwin32_conv_to_win32_path(buf, tempbuf);
	h = FindFirstFile(tempbuf, &amp;data);
#else
	h = FindFirstFile(buf, &amp;data);
#endif
	if (h == INVALID_HANDLE_VALUE) {
		PyErr_Format(PyExc_NameError,
		  "Can't find file for module %.100s\n(filename %.300s)",
		  name, buf);
		return 0;
	}
	FindClose(h);
	return strncmp(data.cFileName, name, namelen) == 0;

/* DJGPP */
#elif defined(DJGPP)
	struct ffblk ffblk;
	int done;

	if (Py_GETENV("PYTHONCASEOK") != NULL)
		return 1;

	done = findfirst(buf, &amp;ffblk, FA_ARCH|FA_RDONLY|FA_HIDDEN|FA_DIREC);
	if (done) {
		PyErr_Format(PyExc_NameError,
		  "Can't find file for module %.100s\n(filename %.300s)",
		  name, buf);
		return 0;
	}
	return strncmp(ffblk.ff_name, name, namelen) == 0;

/* new-fangled macintosh (macosx) */
#elif defined(__MACH__) &amp;&amp; defined(__APPLE__) &amp;&amp; defined(HAVE_DIRENT_H)
	DIR *dirp;
	struct dirent *dp;
	char dirname[MAXPATHLEN + 1];
	const int dirlen = len - namelen - 1; /* don't want trailing SEP */

	if (Py_GETENV("PYTHONCASEOK") != NULL)
		return 1;

	/* Copy the dir component into dirname; substitute "." if empty */
	if (dirlen &lt;= 0) {
		dirname[0] = '.';
		dirname[1] = '\0';
	}
	else {
		assert(dirlen &lt;= MAXPATHLEN);
		memcpy(dirname, buf, dirlen);
		dirname[dirlen] = '\0';
	}
	/* Open the directory and search the entries for an exact match. */
	dirp = opendir(dirname);
	if (dirp) {
		char *nameWithExt = buf + len - namelen;
		while ((dp = readdir(dirp)) != NULL) {
			const int thislen =
#ifdef _DIRENT_HAVE_D_NAMELEN
						dp-&gt;d_namlen;
#else
						strlen(dp-&gt;d_name);
#endif
			if (thislen &gt;= namelen &amp;&amp;
			    strcmp(dp-&gt;d_name, nameWithExt) == 0) {
				(void)closedir(dirp);
				return 1; /* Found */
			}
		}
		(void)closedir(dirp);
	}
	return 0 ; /* Not found */

/* RISC OS */
#elif defined(RISCOS)
	char canon[MAXPATHLEN+1]; /* buffer for the canonical form of the path */
	char buf2[MAXPATHLEN+2];
	char *nameWithExt = buf+len-namelen;
	int canonlen;
	os_error *e;

	if (Py_GETENV("PYTHONCASEOK") != NULL)
		return 1;

	/* workaround:
	   append wildcard, otherwise case of filename wouldn't be touched */
	strcpy(buf2, buf);
	strcat(buf2, "*");

	e = xosfscontrol_canonicalise_path(buf2,canon,0,0,MAXPATHLEN+1,&amp;canonlen);
	canonlen = MAXPATHLEN+1-canonlen;
	if (e || canonlen&lt;=0 || canonlen&gt;(MAXPATHLEN+1) )
		return 0;
	if (strcmp(nameWithExt, canon+canonlen-strlen(nameWithExt))==0)
		return 1; /* match */

	return 0;

/* OS/2 */
#elif defined(PYOS_OS2)
	HDIR hdir = 1;
	ULONG srchcnt = 1;
	FILEFINDBUF3 ffbuf;
	APIRET rc;

	if (getenv("PYTHONCASEOK") != NULL)
		return 1;

	rc = DosFindFirst(buf,
			  &amp;hdir,
			  FILE_READONLY | FILE_HIDDEN | FILE_SYSTEM | FILE_DIRECTORY,
			  &amp;ffbuf, sizeof(ffbuf),
			  &amp;srchcnt,
			  FIL_STANDARD);
	if (rc != NO_ERROR)
		return 0;
	return strncmp(ffbuf.achName, name, namelen) == 0;

/* assuming it's a case-sensitive filesystem, so there's nothing to do! */
#else
	return 1;

#endif
}
</t>
<t tx="ekr.20040711141351.112">#ifdef HAVE_STAT
/* Helper to look for __init__.py or __init__.py[co] in potential package */
static int
find_init_module(char *buf)
{
	const size_t save_len = strlen(buf);
	size_t i = save_len;
	char *pname;  /* pointer to start of __init__ */
	struct stat statbuf;

/*	For calling case_ok(buf, len, namelen, name):
 *	/a/b/c/d/e/f/g/h/i/j/k/some_long_module_name.py\0
 *	^                      ^                   ^    ^
 *	|--------------------- buf ---------------------|
 *	|------------------- len ------------------|
 *	                       |------ name -------|
 *	                       |----- namelen -----|
 */
	if (save_len + 13 &gt;= MAXPATHLEN)
		return 0;
	buf[i++] = SEP;
	pname = buf + i;
	strcpy(pname, "__init__.py");
	if (stat(buf, &amp;statbuf) == 0) {
		if (case_ok(buf,
			    save_len + 9,	/* len("/__init__") */
		            8,   		/* len("__init__") */
		            pname)) {
			buf[save_len] = '\0';
			return 1;
		}
	}
	i += strlen(pname);
	strcpy(buf+i, Py_OptimizeFlag ? "o" : "c");
	if (stat(buf, &amp;statbuf) == 0) {
		if (case_ok(buf,
			    save_len + 9,	/* len("/__init__") */
		            8,   		/* len("__init__") */
		            pname)) {
			buf[save_len] = '\0';
			return 1;
		}
	}
	buf[save_len] = '\0';
	return 0;
}

#else

#ifdef RISCOS
static int
find_init_module(buf)
	char *buf;
{
	int save_len = strlen(buf);
	int i = save_len;

	if (save_len + 13 &gt;= MAXPATHLEN)
		return 0;
	buf[i++] = SEP;
	strcpy(buf+i, "__init__/py");
	if (isfile(buf)) {
		buf[save_len] = '\0';
		return 1;
	}

	if (Py_OptimizeFlag)
		strcpy(buf+i, "o");
	else
		strcpy(buf+i, "c");
	if (isfile(buf)) {
		buf[save_len] = '\0';
		return 1;
	}
	buf[save_len] = '\0';
	return 0;
}

#endif /*RISCOS*/

#endif /* HAVE_STAT */
</t>
<t tx="ekr.20040711141351.113">static int init_builtin(char *); /* Forward */

/* Load an external module using the default search path and return
   its module object WITH INCREMENTED REFERENCE COUNT */

static PyObject *
load_module(char *name, FILE *fp, char *buf, int type, PyObject *loader)
{
	PyObject *modules;
	PyObject *m;
	int err;

	/* First check that there's an open file (if we need one)  */
	switch (type) {
	case PY_SOURCE:
	case PY_COMPILED:
		if (fp == NULL) {
			PyErr_Format(PyExc_ValueError,
			   "file object required for import (type code %d)",
				     type);
			return NULL;
		}
	}

	switch (type) {

	case PY_SOURCE:
		m = load_source_module(name, buf, fp);
		break;

	case PY_COMPILED:
		m = load_compiled_module(name, buf, fp);
		break;

#ifdef HAVE_DYNAMIC_LOADING
	case C_EXTENSION:
		m = _PyImport_LoadDynamicModule(name, buf, fp);
		break;
#endif

	case PKG_DIRECTORY:
		m = load_package(name, buf);
		break;

	case C_BUILTIN:
	case PY_FROZEN:
		if (buf != NULL &amp;&amp; buf[0] != '\0')
			name = buf;
		if (type == C_BUILTIN)
			err = init_builtin(name);
		else
			err = PyImport_ImportFrozenModule(name);
		if (err &lt; 0)
			return NULL;
		if (err == 0) {
			PyErr_Format(PyExc_ImportError,
				     "Purported %s module %.200s not found",
				     type == C_BUILTIN ?
						"builtin" : "frozen",
				     name);
			return NULL;
		}
		modules = PyImport_GetModuleDict();
		m = PyDict_GetItemString(modules, name);
		if (m == NULL) {
			PyErr_Format(
				PyExc_ImportError,
				"%s module %.200s not properly initialized",
				type == C_BUILTIN ?
					"builtin" : "frozen",
				name);
			return NULL;
		}
		Py_INCREF(m);
		break;

	case IMP_HOOK: {
		if (loader == NULL) {
			PyErr_SetString(PyExc_ImportError,
					"import hook without loader");
			return NULL;
		}
		m = PyObject_CallMethod(loader, "load_module", "s", name);
		break;
	}

	default:
		PyErr_Format(PyExc_ImportError,
			     "Don't know how to import %.200s (type code %d)",
			      name, type);
		m = NULL;

	}

	return m;
}
</t>
<t tx="ekr.20040711141351.114">@ Initialize a built-in module.  Return 1 for succes, 0 if the module is not found, and -1 with  an exception set if the initialization failed.
@c

static int
init_builtin(char *name)
{
	struct _inittab *p;

	if (_PyImport_FindExtension(name, name) != NULL)
		return 1;

	for (p = PyImport_Inittab; p-&gt;name != NULL; p++) {
		if (strcmp(name, p-&gt;name) == 0) {
			if (p-&gt;initfunc == NULL) {
				PyErr_Format(PyExc_ImportError,
				    "Cannot re-init internal module %.200s",
				    name);
				return -1;
			}
			if (Py_VerboseFlag)
				PySys_WriteStderr("import %s # builtin\n", name);
			(*p-&gt;initfunc)();
			if (PyErr_Occurred())
				return -1;
			if (_PyImport_FixupExtension(name, name) == NULL)
				return -1;
			return 1;
		}
	}
	return 0;
}
</t>
<t tx="ekr.20040711141351.115">@ Frozen modules
@c

static struct _frozen *
find_frozen(char *name)
{
	struct _frozen *p;

	for (p = PyImport_FrozenModules; ; p++) {
		if (p-&gt;name == NULL)
			return NULL;
		if (strcmp(p-&gt;name, name) == 0)
			break;
	}
	return p;
}
</t>
<t tx="ekr.20040711141351.116">
static PyObject *
get_frozen_object(char *name)
{
	struct _frozen *p = find_frozen(name);
	int size;

	if (p == NULL) {
		PyErr_Format(PyExc_ImportError,
			     "No such frozen object named %.200s",
			     name);
		return NULL;
	}
	if (p-&gt;code == NULL) {
		PyErr_Format(PyExc_ImportError,
			     "Excluded frozen object named %.200s",
			     name);
		return NULL;
	}
	size = p-&gt;size;
	if (size &lt; 0)
		size = -size;
	return PyMarshal_ReadObjectFromString((char *)p-&gt;code, size);
}
</t>
<t tx="ekr.20040711141351.117">@ Initialize a frozen module.  Return 1 for succes, 0 if the module is not found, and -1 with  an exception set if the initialization failed.  This function is also used from frozenmain.c
@c

int
PyImport_ImportFrozenModule(char *name)
{
	struct _frozen *p = find_frozen(name);
	PyObject *co;
	PyObject *m;
	int ispackage;
	int size;

	if (p == NULL)
		return 0;
	if (p-&gt;code == NULL) {
		PyErr_Format(PyExc_ImportError,
			     "Excluded frozen object named %.200s",
			     name);
		return -1;
	}
	size = p-&gt;size;
	ispackage = (size &lt; 0);
	if (ispackage)
		size = -size;
	if (Py_VerboseFlag)
		PySys_WriteStderr("import %s # frozen%s\n",
			name, ispackage ? " package" : "");
	co = PyMarshal_ReadObjectFromString((char *)p-&gt;code, size);
	if (co == NULL)
		return -1;
	if (!PyCode_Check(co)) {
		Py_DECREF(co);
		PyErr_Format(PyExc_TypeError,
			     "frozen object %.200s is not a code object",
			     name);
		return -1;
	}
	if (ispackage) {
		/* Set __path__ to the package name */
		PyObject *d, *s;
		int err;
		m = PyImport_AddModule(name);
		if (m == NULL)
			return -1;
		d = PyModule_GetDict(m);
		s = PyString_InternFromString(name);
		if (s == NULL)
			return -1;
		err = PyDict_SetItemString(d, "__path__", s);
		Py_DECREF(s);
		if (err != 0)
			return err;
	}
	m = PyImport_ExecCodeModuleEx(name, co, "&lt;frozen&gt;");
	Py_DECREF(co);
	if (m == NULL)
		return -1;
	Py_DECREF(m);
	return 1;
}
</t>
<t tx="ekr.20040711141351.118">@ Import a module, either built-in, frozen, or external, and return  its module object WITH INCREMENTED REFERENCE COUNT
@c

PyObject *
PyImport_ImportModule(char *name)
{
	PyObject *pname;
	PyObject *result;

	pname = PyString_FromString(name);
	if (pname == NULL)
		return NULL;
	result = PyImport_Import(pname);
	Py_DECREF(pname);
	return result;
}
</t>
<t tx="ekr.20040711141351.119">@ Forward declarations for helper routines
@c

static PyObject *get_parent(PyObject *globals, char *buf, int *p_buflen);
static PyObject *load_next(PyObject *mod, PyObject *altmod,
			   char **p_name, char *buf, int *p_buflen);
static int mark_miss(char *name);
static int ensure_fromlist(PyObject *mod, PyObject *fromlist,
			   char *buf, int buflen, int recursive);
static PyObject * import_submodule(PyObject *mod, char *name, char *fullname);

/* The Magnum Opus of dotted-name import :-) */

static PyObject *
import_module_ex(char *name, PyObject *globals, PyObject *locals,
		 PyObject *fromlist)
{
	char buf[MAXPATHLEN+1];
	int buflen = 0;
	PyObject *parent, *head, *next, *tail;

	parent = get_parent(globals, buf, &amp;buflen);
	if (parent == NULL)
		return NULL;

	head = load_next(parent, Py_None, &amp;name, buf, &amp;buflen);
	if (head == NULL)
		return NULL;

	tail = head;
	Py_INCREF(tail);
	while (name) {
		next = load_next(tail, tail, &amp;name, buf, &amp;buflen);
		Py_DECREF(tail);
		if (next == NULL) {
			Py_DECREF(head);
			return NULL;
		}
		tail = next;
	}

	if (fromlist != NULL) {
		if (fromlist == Py_None || !PyObject_IsTrue(fromlist))
			fromlist = NULL;
	}

	if (fromlist == NULL) {
		Py_DECREF(tail);
		return head;
	}

	Py_DECREF(head);
	if (!ensure_fromlist(tail, fromlist, buf, buflen, 0)) {
		Py_DECREF(tail);
		return NULL;
	}

	return tail;
}
</t>
<t tx="ekr.20040711141351.120">
PyObject *
PyImport_ImportModuleEx(char *name, PyObject *globals, PyObject *locals,
			PyObject *fromlist)
{
	PyObject *result;
	lock_import();
	result = import_module_ex(name, globals, locals, fromlist);
	if (unlock_import() &lt; 0) {
		Py_XDECREF(result);
		PyErr_SetString(PyExc_RuntimeError,
				"not holding the import lock");
		return NULL;
	}
	return result;
}
</t>
<t tx="ekr.20040711141351.121">@ Return the package that an import is being performed in. If globals comes  from the module foo.bar.bat (not itself a package), this returns the  sys.modules entry for foo.bar. If globals is from a package's __init__.py,  the package's entry in sys.modules is returned.   The *name* of the returned package is returned in buf, with the length of  the name in *p_buflen.   If globals doesn't come from a package or a module in a package, or a  corresponding entry is not found in sys.modules, Py_None is returned.
@c

static PyObject *
get_parent(PyObject *globals, char *buf, int *p_buflen)
{
	static PyObject *namestr = NULL;
	static PyObject *pathstr = NULL;
	PyObject *modname, *modpath, *modules, *parent;

	if (globals == NULL || !PyDict_Check(globals))
		return Py_None;

	if (namestr == NULL) {
		namestr = PyString_InternFromString("__name__");
		if (namestr == NULL)
			return NULL;
	}
	if (pathstr == NULL) {
		pathstr = PyString_InternFromString("__path__");
		if (pathstr == NULL)
			return NULL;
	}

	*buf = '\0';
	*p_buflen = 0;
	modname = PyDict_GetItem(globals, namestr);
	if (modname == NULL || !PyString_Check(modname))
		return Py_None;

	modpath = PyDict_GetItem(globals, pathstr);
	if (modpath != NULL) {
		int len = PyString_GET_SIZE(modname);
		if (len &gt; MAXPATHLEN) {
			PyErr_SetString(PyExc_ValueError,
					"Module name too long");
			return NULL;
		}
		strcpy(buf, PyString_AS_STRING(modname));
		*p_buflen = len;
	}
	else {
		char *start = PyString_AS_STRING(modname);
		char *lastdot = strrchr(start, '.');
		size_t len;
		if (lastdot == NULL)
			return Py_None;
		len = lastdot - start;
		if (len &gt;= MAXPATHLEN) {
			PyErr_SetString(PyExc_ValueError,
					"Module name too long");
			return NULL;
		}
		strncpy(buf, start, len);
		buf[len] = '\0';
		*p_buflen = len;
	}

	modules = PyImport_GetModuleDict();
	parent = PyDict_GetItemString(modules, buf);
	if (parent == NULL)
		parent = Py_None;
	return parent;
	/* We expect, but can't guarantee, if parent != None, that:
	   - parent.__name__ == buf
	   - parent.__dict__ is globals
	   If this is violated...  Who cares? */
}
</t>
<t tx="ekr.20040711141351.122">@ altmod is either None or same as mod
@c

static PyObject *
load_next(PyObject *mod, PyObject *altmod, char **p_name, char *buf,
	  int *p_buflen)
{
	char *name = *p_name;
	char *dot = strchr(name, '.');
	size_t len;
	char *p;
	PyObject *result;

	if (dot == NULL) {
		*p_name = NULL;
		len = strlen(name);
	}
	else {
		*p_name = dot+1;
		len = dot-name;
	}
	if (len == 0) {
		PyErr_SetString(PyExc_ValueError,
				"Empty module name");
		return NULL;
	}

	p = buf + *p_buflen;
	if (p != buf)
		*p++ = '.';
	if (p+len-buf &gt;= MAXPATHLEN) {
		PyErr_SetString(PyExc_ValueError,
				"Module name too long");
		return NULL;
	}
	strncpy(p, name, len);
	p[len] = '\0';
	*p_buflen = p+len-buf;

	result = import_submodule(mod, p, buf);
	if (result == Py_None &amp;&amp; altmod != mod) {
		Py_DECREF(result);
		/* Here, altmod must be None and mod must not be None */
		result = import_submodule(altmod, p, p);
		if (result != NULL &amp;&amp; result != Py_None) {
			if (mark_miss(buf) != 0) {
				Py_DECREF(result);
				return NULL;
			}
			strncpy(buf, name, len);
			buf[len] = '\0';
			*p_buflen = len;
		}
	}
	if (result == NULL)
		return NULL;

	if (result == Py_None) {
		Py_DECREF(result);
		PyErr_Format(PyExc_ImportError,
			     "No module named %.200s", name);
		return NULL;
	}

	return result;
}
</t>
<t tx="ekr.20040711141351.123">
static int
mark_miss(char *name)
{
	PyObject *modules = PyImport_GetModuleDict();
	return PyDict_SetItemString(modules, name, Py_None);
}
</t>
<t tx="ekr.20040711141351.124">
static int
ensure_fromlist(PyObject *mod, PyObject *fromlist, char *buf, int buflen,
		int recursive)
{
	int i;

	if (!PyObject_HasAttrString(mod, "__path__"))
		return 1;

	for (i = 0; ; i++) {
		PyObject *item = PySequence_GetItem(fromlist, i);
		int hasit;
		if (item == NULL) {
			if (PyErr_ExceptionMatches(PyExc_IndexError)) {
				PyErr_Clear();
				return 1;
			}
			return 0;
		}
		if (!PyString_Check(item)) {
			PyErr_SetString(PyExc_TypeError,
					"Item in ``from list'' not a string");
			Py_DECREF(item);
			return 0;
		}
		if (PyString_AS_STRING(item)[0] == '*') {
			PyObject *all;
			Py_DECREF(item);
			/* See if the package defines __all__ */
			if (recursive)
				continue; /* Avoid endless recursion */
			all = PyObject_GetAttrString(mod, "__all__");
			if (all == NULL)
				PyErr_Clear();
			else {
				int ret = ensure_fromlist(mod, all, buf, buflen, 1);
				Py_DECREF(all);
				if (!ret)
					return 0;
			}
			continue;
		}
		hasit = PyObject_HasAttr(mod, item);
		if (!hasit) {
			char *subname = PyString_AS_STRING(item);
			PyObject *submod;
			char *p;
			if (buflen + strlen(subname) &gt;= MAXPATHLEN) {
				PyErr_SetString(PyExc_ValueError,
						"Module name too long");
				Py_DECREF(item);
				return 0;
			}
			p = buf + buflen;
			*p++ = '.';
			strcpy(p, subname);
			submod = import_submodule(mod, subname, buf);
			Py_XDECREF(submod);
			if (submod == NULL) {
				Py_DECREF(item);
				return 0;
			}
		}
		Py_DECREF(item);
	}

	/* NOTREACHED */
}
</t>
<t tx="ekr.20040711141351.125">
static int
add_submodule(PyObject *mod, PyObject *submod, char *fullname, char *subname,
	      PyObject *modules)
{
	if (mod == Py_None)
		return 1;
	/* Irrespective of the success of this load, make a
	   reference to it in the parent package module.  A copy gets
	   saved in the modules dictionary under the full name, so get a
	   reference from there, if need be.  (The exception is when the
	   load failed with a SyntaxError -- then there's no trace in
	   sys.modules.  In that case, of course, do nothing extra.) */
	if (submod == NULL) {
		submod = PyDict_GetItemString(modules, fullname);
		if (submod == NULL)
			return 1;
	}
	if (PyModule_Check(mod)) {
		/* We can't use setattr here since it can give a
		 * spurious warning if the submodule name shadows a
		 * builtin name */
		PyObject *dict = PyModule_GetDict(mod);
		if (!dict)
			return 0;
		if (PyDict_SetItemString(dict, subname, submod) &lt; 0)
			return 0;
	}
	else {
		if (PyObject_SetAttrString(mod, subname, submod) &lt; 0)
			return 0;
	}
	return 1;
}
</t>
<t tx="ekr.20040711141351.126">
static PyObject *
import_submodule(PyObject *mod, char *subname, char *fullname)
{
	PyObject *modules = PyImport_GetModuleDict();
	PyObject *m = NULL;

	/* Require:
	   if mod == None: subname == fullname
	   else: mod.__name__ + "." + subname == fullname
	*/

	if ((m = PyDict_GetItemString(modules, fullname)) != NULL) {
		Py_INCREF(m);
	}
	else {
		PyObject *path, *loader = NULL;
		char buf[MAXPATHLEN+1];
		struct filedescr *fdp;
		FILE *fp = NULL;

		if (mod == Py_None)
			path = NULL;
		else {
			path = PyObject_GetAttrString(mod, "__path__");
			if (path == NULL) {
				PyErr_Clear();
				Py_INCREF(Py_None);
				return Py_None;
			}
		}

		buf[0] = '\0';
		fdp = find_module(fullname, subname, path, buf, MAXPATHLEN+1,
				  &amp;fp, &amp;loader);
		Py_XDECREF(path);
		if (fdp == NULL) {
			if (!PyErr_ExceptionMatches(PyExc_ImportError))
				return NULL;
			PyErr_Clear();
			Py_INCREF(Py_None);
			return Py_None;
		}
		m = load_module(fullname, fp, buf, fdp-&gt;type, loader);
		Py_XDECREF(loader);
		if (fp)
			fclose(fp);
		if (!add_submodule(mod, m, fullname, subname, modules)) {
			Py_XDECREF(m);
			m = NULL;
		}
	}

	return m;
}
</t>
<t tx="ekr.20040711141351.127">@ Re-import a module of any kind and return its module object, WITH  INCREMENTED REFERENCE COUNT
@c

PyObject *
PyImport_ReloadModule(PyObject *m)
{
	PyObject *modules = PyImport_GetModuleDict();
	PyObject *path = NULL;
	char *name, *subname;
	char buf[MAXPATHLEN+1];
	struct filedescr *fdp;
	FILE *fp = NULL;

	if (m == NULL || !PyModule_Check(m)) {
		PyErr_SetString(PyExc_TypeError,
				"reload() argument must be module");
		return NULL;
	}
	name = PyModule_GetName(m);
	if (name == NULL)
		return NULL;
	if (m != PyDict_GetItemString(modules, name)) {
		PyErr_Format(PyExc_ImportError,
			     "reload(): module %.200s not in sys.modules",
			     name);
		return NULL;
	}
	subname = strrchr(name, '.');
	if (subname == NULL)
		subname = name;
	else {
		PyObject *parentname, *parent;
		parentname = PyString_FromStringAndSize(name, (subname-name));
		if (parentname == NULL)
			return NULL;
		parent = PyDict_GetItem(modules, parentname);
		Py_DECREF(parentname);
		if (parent == NULL) {
			PyErr_Format(PyExc_ImportError,
			    "reload(): parent %.200s not in sys.modules",
			    name);
			return NULL;
		}
		subname++;
		path = PyObject_GetAttrString(parent, "__path__");
		if (path == NULL)
			PyErr_Clear();
	}
	buf[0] = '\0';
	fdp = find_module(name, subname, path, buf, MAXPATHLEN+1, &amp;fp, NULL);
	Py_XDECREF(path);
	if (fdp == NULL)
		return NULL;
	m = load_module(name, fp, buf, fdp-&gt;type, NULL);
	if (fp)
		fclose(fp);
	return m;
}
</t>
<t tx="ekr.20040711141351.128">@ Higher-level import emulator which emulates the "import" statement  more accurately -- it invokes the __import__() function from the  builtins of the current globals. This means that the import is  done using whatever import hooks are installed in the current  environment, e.g. by "rexec".  A dummy list ["__doc__"] is passed as the 4th argument so that  e.g. PyImport_Import(PyString_FromString("win32com.client.gencache"))  will return &lt;module "gencache"&gt; instead of &lt;module "win32com"&gt;.
@c

PyObject *
PyImport_Import(PyObject *module_name)
{
	static PyObject *silly_list = NULL;
	static PyObject *builtins_str = NULL;
	static PyObject *import_str = NULL;
	PyObject *globals = NULL;
	PyObject *import = NULL;
	PyObject *builtins = NULL;
	PyObject *r = NULL;

	/* Initialize constant string objects */
	if (silly_list == NULL) {
		import_str = PyString_InternFromString("__import__");
		if (import_str == NULL)
			return NULL;
		builtins_str = PyString_InternFromString("__builtins__");
		if (builtins_str == NULL)
			return NULL;
		silly_list = Py_BuildValue("[s]", "__doc__");
		if (silly_list == NULL)
			return NULL;
	}

	/* Get the builtins from current globals */
	globals = PyEval_GetGlobals();
	if (globals != NULL) {
	        Py_INCREF(globals);
		builtins = PyObject_GetItem(globals, builtins_str);
		if (builtins == NULL)
			goto err;
	}
	else {
		/* No globals -- use standard builtins, and fake globals */
		PyErr_Clear();

		builtins = PyImport_ImportModuleEx("__builtin__",
						   NULL, NULL, NULL);
		if (builtins == NULL)
			return NULL;
		globals = Py_BuildValue("{OO}", builtins_str, builtins);
		if (globals == NULL)
			goto err;
	}

	/* Get the __import__ function from the builtins */
	if (PyDict_Check(builtins)) {
		import = PyObject_GetItem(builtins, import_str);
		if (import == NULL)
			PyErr_SetObject(PyExc_KeyError, import_str);
	}
	else
		import = PyObject_GetAttr(builtins, import_str);
	if (import == NULL)
		goto err;

	/* Call the _import__ function with the proper argument list */
	r = PyObject_CallFunction(import, "OOOO",
				  module_name, globals, globals, silly_list);

  err:
	Py_XDECREF(globals);
	Py_XDECREF(builtins);
	Py_XDECREF(import);

	return r;
}
</t>
<t tx="ekr.20040711141351.129"></t>
<t tx="ekr.20040711141351.130">@ Module 'imp' provides Python access to the primitives used for  importing modules.
@c

static PyObject *
imp_get_magic(PyObject *self, PyObject *noargs)
{
	char buf[4];

	buf[0] = (char) ((pyc_magic &gt;&gt;  0) &amp; 0xff);
	buf[1] = (char) ((pyc_magic &gt;&gt;  8) &amp; 0xff);
	buf[2] = (char) ((pyc_magic &gt;&gt; 16) &amp; 0xff);
	buf[3] = (char) ((pyc_magic &gt;&gt; 24) &amp; 0xff);

	return PyString_FromStringAndSize(buf, 4);
}
</t>
<t tx="ekr.20040711141351.131">
static PyObject *
imp_get_suffixes(PyObject *self, PyObject *noargs)
{
	PyObject *list;
	struct filedescr *fdp;

	list = PyList_New(0);
	if (list == NULL)
		return NULL;
	for (fdp = _PyImport_Filetab; fdp-&gt;suffix != NULL; fdp++) {
		PyObject *item = Py_BuildValue("ssi",
				       fdp-&gt;suffix, fdp-&gt;mode, fdp-&gt;type);
		if (item == NULL) {
			Py_DECREF(list);
			return NULL;
		}
		if (PyList_Append(list, item) &lt; 0) {
			Py_DECREF(list);
			Py_DECREF(item);
			return NULL;
		}
		Py_DECREF(item);
	}
	return list;
}
</t>
<t tx="ekr.20040711141351.132">
static PyObject *
call_find_module(char *name, PyObject *path)
{
	extern int fclose(FILE *);
	PyObject *fob, *ret;
	struct filedescr *fdp;
	char pathname[MAXPATHLEN+1];
	FILE *fp = NULL;

	pathname[0] = '\0';
	if (path == Py_None)
		path = NULL;
	fdp = find_module(NULL, name, path, pathname, MAXPATHLEN+1, &amp;fp, NULL);
	if (fdp == NULL)
		return NULL;
	if (fp != NULL) {
		fob = PyFile_FromFile(fp, pathname, fdp-&gt;mode, fclose);
		if (fob == NULL) {
			fclose(fp);
			return NULL;
		}
	}
	else {
		fob = Py_None;
		Py_INCREF(fob);
	}
	ret = Py_BuildValue("Os(ssi)",
		      fob, pathname, fdp-&gt;suffix, fdp-&gt;mode, fdp-&gt;type);
	Py_DECREF(fob);
	return ret;
}
</t>
<t tx="ekr.20040711141351.133">
static PyObject *
imp_find_module(PyObject *self, PyObject *args)
{
	char *name;
	PyObject *path = NULL;
	if (!PyArg_ParseTuple(args, "s|O:find_module", &amp;name, &amp;path))
		return NULL;
	return call_find_module(name, path);
}
</t>
<t tx="ekr.20040711141351.134">
static PyObject *
imp_init_builtin(PyObject *self, PyObject *args)
{
	char *name;
	int ret;
	PyObject *m;
	if (!PyArg_ParseTuple(args, "s:init_builtin", &amp;name))
		return NULL;
	ret = init_builtin(name);
	if (ret &lt; 0)
		return NULL;
	if (ret == 0) {
		Py_INCREF(Py_None);
		return Py_None;
	}
	m = PyImport_AddModule(name);
	Py_XINCREF(m);
	return m;
}
</t>
<t tx="ekr.20040711141351.135">
static PyObject *
imp_init_frozen(PyObject *self, PyObject *args)
{
	char *name;
	int ret;
	PyObject *m;
	if (!PyArg_ParseTuple(args, "s:init_frozen", &amp;name))
		return NULL;
	ret = PyImport_ImportFrozenModule(name);
	if (ret &lt; 0)
		return NULL;
	if (ret == 0) {
		Py_INCREF(Py_None);
		return Py_None;
	}
	m = PyImport_AddModule(name);
	Py_XINCREF(m);
	return m;
}
</t>
<t tx="ekr.20040711141351.136">
static PyObject *
imp_get_frozen_object(PyObject *self, PyObject *args)
{
	char *name;

	if (!PyArg_ParseTuple(args, "s:get_frozen_object", &amp;name))
		return NULL;
	return get_frozen_object(name);
}
</t>
<t tx="ekr.20040711141351.137">
static PyObject *
imp_is_builtin(PyObject *self, PyObject *args)
{
	char *name;
	if (!PyArg_ParseTuple(args, "s:is_builtin", &amp;name))
		return NULL;
	return PyInt_FromLong(is_builtin(name));
}
</t>
<t tx="ekr.20040711141351.138">
static PyObject *
imp_is_frozen(PyObject *self, PyObject *args)
{
	char *name;
	struct _frozen *p;
	if (!PyArg_ParseTuple(args, "s:is_frozen", &amp;name))
		return NULL;
	p = find_frozen(name);
	return PyBool_FromLong((long) (p == NULL ? 0 : p-&gt;size));
}
</t>
<t tx="ekr.20040711141351.139">static FILE *
get_file(char *pathname, PyObject *fob, char *mode)
{
	FILE *fp;
	if (fob == NULL) {
		if (mode[0] == 'U') 
			mode = "r" PY_STDIOTEXTMODE;
		fp = fopen(pathname, mode);
		if (fp == NULL)
			PyErr_SetFromErrno(PyExc_IOError);
	}
	else {
		fp = PyFile_AsFile(fob);
		if (fp == NULL)
			PyErr_SetString(PyExc_ValueError,
					"bad/closed file object");
	}
	return fp;
}
</t>
<t tx="ekr.20040711141351.140">static PyObject *
imp_load_compiled(PyObject *self, PyObject *args)
{
	char *name;
	char *pathname;
	PyObject *fob = NULL;
	PyObject *m;
	FILE *fp;
	if (!PyArg_ParseTuple(args, "ss|O!:load_compiled", &amp;name, &amp;pathname,
			      &amp;PyFile_Type, &amp;fob))
		return NULL;
	fp = get_file(pathname, fob, "rb");
	if (fp == NULL)
		return NULL;
	m = load_compiled_module(name, pathname, fp);
	if (fob == NULL)
		fclose(fp);
	return m;
}
</t>
<t tx="ekr.20040711141351.141">
#ifdef HAVE_DYNAMIC_LOADING

static PyObject *
imp_load_dynamic(PyObject *self, PyObject *args)
{
	char *name;
	char *pathname;
	PyObject *fob = NULL;
	PyObject *m;
	FILE *fp = NULL;
	if (!PyArg_ParseTuple(args, "ss|O!:load_dynamic", &amp;name, &amp;pathname,
			      &amp;PyFile_Type, &amp;fob))
		return NULL;
	if (fob) {
		fp = get_file(pathname, fob, "r");
		if (fp == NULL)
			return NULL;
	}
	m = _PyImport_LoadDynamicModule(name, pathname, fp);
	return m;
}

#endif /* HAVE_DYNAMIC_LOADING */</t>
<t tx="ekr.20040711141351.142">static PyObject *
imp_load_source(PyObject *self, PyObject *args)
{
	char *name;
	char *pathname;
	PyObject *fob = NULL;
	PyObject *m;
	FILE *fp;
	if (!PyArg_ParseTuple(args, "ss|O!:load_source", &amp;name, &amp;pathname,
			      &amp;PyFile_Type, &amp;fob))
		return NULL;
	fp = get_file(pathname, fob, "r");
	if (fp == NULL)
		return NULL;
	m = load_source_module(name, pathname, fp);
	if (fob == NULL)
		fclose(fp);
	return m;
}
</t>
<t tx="ekr.20040711141351.143">static PyObject *
imp_load_module(PyObject *self, PyObject *args)
{
	char *name;
	PyObject *fob;
	char *pathname;
	char *suffix; /* Unused */
	char *mode;
	int type;
	FILE *fp;

	if (!PyArg_ParseTuple(args, "sOs(ssi):load_module",
			      &amp;name, &amp;fob, &amp;pathname,
			      &amp;suffix, &amp;mode, &amp;type))
		return NULL;
	if (*mode) {
		/* Mode must start with 'r' or 'U' and must not contain '+'.
		   Implicit in this test is the assumption that the mode
		   may contain other modifiers like 'b' or 't'. */

		if (!(*mode == 'r' || *mode == 'U') || strchr(mode, '+')) {
			PyErr_Format(PyExc_ValueError,
				     "invalid file open mode %.200s", mode);
			return NULL;
		}
	}
	if (fob == Py_None)
		fp = NULL;
	else {
		if (!PyFile_Check(fob)) {
			PyErr_SetString(PyExc_ValueError,
				"load_module arg#2 should be a file or None");
			return NULL;
		}
		fp = get_file(pathname, fob, mode);
		if (fp == NULL)
			return NULL;
	}
	return load_module(name, fp, pathname, type, NULL);
}</t>
<t tx="ekr.20040711141351.144">
static PyObject *
imp_load_package(PyObject *self, PyObject *args)
{
	char *name;
	char *pathname;
	if (!PyArg_ParseTuple(args, "ss:load_package", &amp;name, &amp;pathname))
		return NULL;
	return load_package(name, pathname);
}
</t>
<t tx="ekr.20040711141351.145">
static PyObject *
imp_new_module(PyObject *self, PyObject *args)
{
	char *name;
	if (!PyArg_ParseTuple(args, "s:new_module", &amp;name))
		return NULL;
	return PyModule_New(name);
}
</t>
<t tx="ekr.20040711141351.146">@ Doc strings
@c

PyDoc_STRVAR(doc_imp,
"This module provides the components needed to build your own\n\
__import__ function.  Undocumented functions are obsolete.");

PyDoc_STRVAR(doc_find_module,
"find_module(name, [path]) -&gt; (file, filename, (suffix, mode, type))\n\
Search for a module.  If path is omitted or None, search for a\n\
built-in, frozen or special module and continue search in sys.path.\n\
The module name cannot contain '.'; to search for a submodule of a\n\
package, pass the submodule name and the package's __path__.");

PyDoc_STRVAR(doc_load_module,
"load_module(name, file, filename, (suffix, mode, type)) -&gt; module\n\
Load a module, given information returned by find_module().\n\
The module name must include the full package name, if any.");

PyDoc_STRVAR(doc_get_magic,
"get_magic() -&gt; string\n\
Return the magic number for .pyc or .pyo files.");

PyDoc_STRVAR(doc_get_suffixes,
"get_suffixes() -&gt; [(suffix, mode, type), ...]\n\
Return a list of (suffix, mode, type) tuples describing the files\n\
that find_module() looks for.");

PyDoc_STRVAR(doc_new_module,
"new_module(name) -&gt; module\n\
Create a new module.  Do not enter it in sys.modules.\n\
The module name must include the full package name, if any.");

PyDoc_STRVAR(doc_lock_held,
"lock_held() -&gt; 0 or 1\n\
Return 1 if the import lock is currently held.\n\
On platforms without threads, return 0.");

PyDoc_STRVAR(doc_acquire_lock,
"acquire_lock() -&gt; None\n\
Acquires the interpreter's import lock for the current thread.\n\
This lock should be used by import hooks to ensure thread-safety\n\
when importing modules.\n\
On platforms without threads, this function does nothing.");

PyDoc_STRVAR(doc_release_lock,
"release_lock() -&gt; None\n\
Release the interpreter's import lock.\n\
On platforms without threads, this function does nothing.");
</t>
<t tx="ekr.20040711141351.147">static PyMethodDef imp_methods[] = {
	{"find_module",	 imp_find_module,  METH_VARARGS, doc_find_module},
	{"get_magic",	 imp_get_magic,	   METH_NOARGS,  doc_get_magic},
	{"get_suffixes", imp_get_suffixes, METH_NOARGS,  doc_get_suffixes},
	{"load_module",	 imp_load_module,  METH_VARARGS, doc_load_module},
	{"new_module",	 imp_new_module,   METH_VARARGS, doc_new_module},
	{"lock_held",	 imp_lock_held,	   METH_NOARGS,  doc_lock_held},
	{"acquire_lock", imp_acquire_lock, METH_NOARGS,  doc_acquire_lock},
	{"release_lock", imp_release_lock, METH_NOARGS,  doc_release_lock},
	/* The rest are obsolete */
	{"get_frozen_object",	imp_get_frozen_object,	METH_VARARGS},
	{"init_builtin",	imp_init_builtin,	METH_VARARGS},
	{"init_frozen",		imp_init_frozen,	METH_VARARGS},
	{"is_builtin",		imp_is_builtin,		METH_VARARGS},
	{"is_frozen",		imp_is_frozen,		METH_VARARGS},
	{"load_compiled",	imp_load_compiled,	METH_VARARGS},
#ifdef HAVE_DYNAMIC_LOADING
	{"load_dynamic",	imp_load_dynamic,	METH_VARARGS},
#endif
	{"load_package",	imp_load_package,	METH_VARARGS},
	{"load_source",		imp_load_source,	METH_VARARGS},
	{NULL,			NULL}		/* sentinel */
};
</t>
<t tx="ekr.20040711141351.148">

static int
setint(PyObject *d, char *name, int value)
{
	PyObject *v;
	int err;

	v = PyInt_FromLong((long)value);
	err = PyDict_SetItemString(d, name, v);
	Py_XDECREF(v);
	return err;
}</t>
<t tx="ekr.20040711141351.149">PyMODINIT_FUNC
initimp(void)
{
	PyObject *m, *d;

	m = Py_InitModule4("imp", imp_methods, doc_imp,
			   NULL, PYTHON_API_VERSION);
	d = PyModule_GetDict(m);

	if (setint(d, "SEARCH_ERROR", SEARCH_ERROR) &lt; 0) goto failure;
	if (setint(d, "PY_SOURCE", PY_SOURCE) &lt; 0) goto failure;
	if (setint(d, "PY_COMPILED", PY_COMPILED) &lt; 0) goto failure;
	if (setint(d, "C_EXTENSION", C_EXTENSION) &lt; 0) goto failure;
	if (setint(d, "PY_RESOURCE", PY_RESOURCE) &lt; 0) goto failure;
	if (setint(d, "PKG_DIRECTORY", PKG_DIRECTORY) &lt; 0) goto failure;
	if (setint(d, "C_BUILTIN", C_BUILTIN) &lt; 0) goto failure;
	if (setint(d, "PY_FROZEN", PY_FROZEN) &lt; 0) goto failure;
	if (setint(d, "PY_CODERESOURCE", PY_CODERESOURCE) &lt; 0) goto failure;
	if (setint(d, "IMP_HOOK", IMP_HOOK) &lt; 0) goto failure;

  failure:
	;
}</t>
<t tx="ekr.20040711141351.150">@ API for embedding applications that want to add their own entries  to the table of built-in modules. This should normally be called  *before* Py_Initialize(). When the table resize fails, -1 is  returned and the existing table is unchanged.   After a similar function by Just van Rossum.
@c

int
PyImport_ExtendInittab(struct _inittab *newtab)
{
	static struct _inittab *our_copy = NULL;
	struct _inittab *p;
	int i, n;

	/* Count the number of entries in both tables */
	for (n = 0; newtab[n].name != NULL; n++)
		;
	if (n == 0)
		return 0; /* Nothing to do */
	for (i = 0; PyImport_Inittab[i].name != NULL; i++)
		;

	/* Allocate new memory for the combined table */
	p = our_copy;
	PyMem_RESIZE(p, struct _inittab, i+n+1);
	if (p == NULL)
		return -1;

	/* Copy the tables into the new memory */
	if (our_copy != PyImport_Inittab)
		memcpy(p, PyImport_Inittab, (i+1) * sizeof(struct _inittab));
	PyImport_Inittab = our_copy = p;
	memcpy(p+i, newtab, (n+1) * sizeof(struct _inittab));

	return 0;
}
</t>
<t tx="ekr.20040711141351.151">@ Shorthand to add a single entry given a name and a function
@c

int
PyImport_AppendInittab(char *name, void (*initfunc)(void))
{
	struct _inittab newtab[2];

	memset(newtab, '\0', sizeof newtab);

	newtab[0].name = name;
	newtab[0].initfunc = initfunc;

	return PyImport_ExtendInittab(newtab);
}
</t>
<t tx="ekr.20040711141351.152">@ignore
@language python

import imp
from test.test_support import TestFailed

@others

if __name__ == "__main__":
    test_main()
</t>
<t tx="ekr.20040711141351.153">def verify_lock_state(expected):
    
    if imp.lock_held() != expected:
        raise TestFailed("expected imp.lock_held() to be %r" % expected)

</t>
<t tx="ekr.20040711141351.154">def testLock():

    LOOPS = 50

    # The import lock may already be held, e.g. if the test suite is run
    # via "import test.autotest".
    lock_held_at_start = imp.lock_held()
    verify_lock_state(lock_held_at_start)

    for i in range(LOOPS):
        imp.acquire_lock()
        verify_lock_state(True)

    for i in range(LOOPS):
        imp.release_lock()

    # The original state should be restored now.
    verify_lock_state(lock_held_at_start)

    if not lock_held_at_start:
        try:
            imp.release_lock()
        except RuntimeError:
            pass
        else:
            raise TestFailed("release_lock() without lock should raise "
                             "RuntimeError")
</t>
<t tx="ekr.20040711141351.155">def test_main():

    testLock()
</t>
</tnodes>
</leo_file>
