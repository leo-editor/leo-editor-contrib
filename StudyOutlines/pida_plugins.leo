<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet ekr_stylesheet?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="76" clone_windows="0"/>
<globals body_outline_ratio="0.602941176471">
	<global_window_position top="101" left="310" height="680" width="852"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20060421081431.1" a="E"><vh>(PIDA) plugins.py</vh>
<v t="ekr.20060421081431.2" a="E"><vh>&lt;&lt; docstring &gt;&gt;</vh></v>
<v t="ekr.20060421081431.3" a="E"><vh>Core data types</vh>
<v t="ekr.20060421081431.4"><vh>class SetsDict</vh>
<v t="ekr.20060421081431.5" a="E"><vh>__getitem__</vh></v>
<v t="ekr.20060421081431.6" a="E"><vh>add</vh></v>
<v t="ekr.20060421081431.7" a="E"><vh>remove</vh></v>
<v t="ekr.20060421081431.8" a="E"><vh>keys</vh></v>
<v t="ekr.20060421081431.9" a="E"><vh>__delitem__</vh></v>
<v t="ekr.20060421081431.10" a="E"><vh>__repr__</vh></v>
<v t="ekr.20060421081431.11" a="E"><vh>__len__</vh></v>
<v t="ekr.20060421081431.12" a="E"><vh>__iter__</vh></v>
</v>
<v t="ekr.20060421081431.13" a="E"><vh>class StrictSetsDict</vh>
<v t="ekr.20060421081431.14" a="E"><vh>__init__</vh></v>
<v t="ekr.20060421081431.15" a="E"><vh>init_key</vh></v>
<v t="ekr.20060421081431.16" a="E"><vh>__getitem__</vh></v>
<v t="ekr.20060421081431.17" a="E"><vh>add</vh></v>
<v t="ekr.20060421081431.18" a="E"><vh>remove</vh></v>
</v>
<v t="ekr.20060421081431.19" a="E"><vh>class DynSetsDict</vh>
<v t="ekr.20060421081431.20" a="E"><vh>__init__</vh></v>
<v t="ekr.20060421081431.21" a="E"><vh>__getitem__</vh></v>
<v t="ekr.20060421081431.22" a="E"><vh>remove</vh></v>
<v t="ekr.20060421081431.23" a="E"><vh>add</vh></v>
<v t="ekr.20060421081431.24" a="E"><vh>__delitem__</vh></v>
</v>
</v>
<v t="ekr.20060421081431.25" a="E"><vh>Base classes</vh>
<v t="ekr.20060421081431.26" a="E"><vh>class PluginIterator</vh>
<v t="ekr.20060421081431.27" a="E"><vh>__init__</vh></v>
<v t="ekr.20060421081431.28" a="E"><vh>next</vh></v>
<v t="ekr.20060421081431.29" a="E"><vh>__iter__</vh></v>
<v t="ekr.20060421081431.30" a="E"><vh>__repr__</vh></v>
</v>
<v t="ekr.20060421081431.31"><vh>class Plugin</vh>
<v t="ekr.20060421081431.32" a="E"><vh>__init__</vh></v>
<v t="ekr.20060421081431.33" a="E"><vh>get_instance</vh></v>
<v t="ekr.20060421081431.34" a="E"><vh>reset</vh></v>
<v t="ekr.20060421081431.35" a="E"><vh>unplug</vh></v>
</v>
</v>
<v t="ekr.20060421081431.36" a="E"><vh>Implementations</vh>
<v t="ekr.20060421081431.37" a="E"><vh>class ExtensionPointError</vh></v>
<v t="ekr.20060421081431.38" a="E"><vh>class ExtensionPoint</vh>
<v t="ekr.20060421081431.39" a="E"><vh>__init__</vh></v>
<v t="ekr.20060421081431.40" a="E"><vh>get_extender</vh></v>
<v t="ekr.20060421081431.41" a="E"><vh>init</vh></v>
<v t="ekr.20060421081431.42" a="E"><vh>add</vh></v>
<v t="ekr.20060421081431.43" a="E"><vh>__getitem__</vh></v>
<v t="ekr.20060421081431.44" a="E"><vh>has_init</vh></v>
<v t="ekr.20060421081431.45" a="E"><vh>keys</vh></v>
</v>
<v t="ekr.20060421081431.46"><vh>class PluginExtensionPoint</vh>
<v t="ekr.20060421081431.47" a="E"><vh>__init__</vh></v>
<v t="ekr.20060421081431.48" a="E"><vh>get_extender</vh></v>
</v>
<v t="ekr.20060421081431.49" a="EM"><vh>class ExtensionPointManager</vh>
<v t="ekr.20060421081431.50" a="E"><vh>__init__</vh></v>
<v t="ekr.20060421081431.51" a="E"><vh>__getitem__</vh></v>
<v t="ekr.20060421081431.52" a="E"><vh>__delitem__</vh></v>
<v t="ekr.20060421081431.53" a="E"><vh>__repr__</vh></v>
</v>
</v>
<v t="ekr.20060421081431.54" a="E"><vh>Use cases</vh>
<v t="ekr.20060421081431.55" a="E"><vh>class SingletonError</vh></v>
<v t="ekr.20060421081431.56" a="E"><vh>class PluginEntry</vh>
<v t="ekr.20060421081431.57" a="ETV"><vh>__init__</vh></v>
<v t="ekr.20060421081431.58" a="E"><vh>get_instance</vh></v>
</v>
<v t="ekr.20060421081431.59"><vh>class PluginFactoryCreator</vh>
<v t="ekr.20060421081431.60" a="E"><vh>__init__</vh></v>
<v t="ekr.20060421081431.61" a="E"><vh>__call__</vh></v>
</v>
<v t="ekr.20060421081431.62" a="E"><vh>class Registry</vh>
<v t="ekr.20060421081431.63" a="E"><vh> __init__</vh></v>
<v t="ekr.20060421081431.64" a="E"><vh> __iter__</vh></v>
<v t="ekr.20060421081431.65" a="E"><vh>_check_plugin</vh></v>
<v t="ekr.20060421081431.66"><vh>clear</vh></v>
<v t="ekr.20060421081431.67" a="E"><vh>get_extension_point</vh></v>
<v t="ekr.20060421081431.68" a="E"><vh>get_extension_point_def</vh></v>
<v t="ekr.20060421081431.69" a="E"><vh>get_features</vh></v>
<v t="ekr.20060421081431.70" a="E"><vh>get_plugin_from_singleton</vh></v>
<v t="ekr.20060421081431.71" a="E"><vh>get_singleton</vh></v>
<v t="ekr.20060421081431.72" a="E"><vh>register</vh></v>
<v t="ekr.20060421081431.73" a="E"><vh>register_plugin</vh></v>
<v t="ekr.20060421081431.74" a="E"><vh>unregister</vh></v>
<v t="ekr.20060421081431.75" a="E"><vh>unregister_feature</vh></v>
<v t="ekr.20060421081431.76" a="E"><vh>unregister_singleton</vh></v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20060421081431.1">@language python
@tabwidth -4

&lt;&lt; docstring &gt;&gt;

import weakref

@others
</t>
<t tx="ekr.20060421081431.2">"""A flexible plugin framework.

Clear your mind of any previously defined concept of a plugin.

Key components:

    * Registry: stores a set of plugins
    * Plugin: defines a set of behaviours
    * Registry key: unique behavioural identifier

Types of definable behaviour:

    1. Singleton
    2. Feature
    3. Extension Point/Extender

A plugin can register any number of the above behaviour
types.

1. Singleton

When a plugin registers as a singleton for a key, it is saying "I provide the
behaviour", so when the registry is looked up for that key, the object is
returned. At this point, please consider that an ideal registry key may be an
Interface definition (formal or otherwise), so when you ask for the behaviour
by interface you are actually returned an object implementing that interface.

2. Feature

When a plugin defines a Feature, it is again saying "I provide the behaviour",
the difference with singleton is that many plugins can define a feature, and
these plugins are aggregated and can be looked up by registry key. The look up
returns a list of objects that claim to provide the key.

3. Extension point

An extension point is identical to a feature except that the keys for it must
be predefined and are fixed. While a plugin may invent a feature and others
can join it, it is expected that whatever creates the registry formally
defines the extension points and they are then fixed. This can be used to
simulate the behaviour of traditional (Eclipse or Trac) extension points. The
plugin itself supplies the Extender (that which extends), while the registry
contains the Extension point itself (that which is to be extended).

"""

</t>
<t tx="ekr.20060421081431.3"></t>
<t tx="ekr.20060421081431.4">class SetsDict:
    """
    The theory of the plugin architecture has its foundations
    on this simple structure which is a simple dictionary of sets.
    Each key contains a set associated with it and instead of setting
    the items you add them to a certain key.
    """
	@others
</t>
<t tx="ekr.20060421081431.5">def __getitem__(self, key):
    raise NotImplementedError
</t>
<t tx="ekr.20060421081431.6">def add(self, key, value):
    raise NotImplementedError
</t>
<t tx="ekr.20060421081431.7">def remove(self, key, value):
    raise NotImplementedError
</t>
<t tx="ekr.20060421081431.8">def keys(self):
    return self.data.keys()
</t>
<t tx="ekr.20060421081431.9">def __delitem__(self, key):
    del self.data[key]
</t>
<t tx="ekr.20060421081431.10">def __repr__(self):
    return repr(self.data)
</t>
<t tx="ekr.20060421081431.11">def __len__(self):
    return len(self.data)
</t>
<t tx="ekr.20060421081431.12">def __iter__(self):
    return iter(self.data)
</t>
<t tx="ekr.20060421081431.13">class StrictSetsDict(SetsDict):
    """
    A sets dictionary, where every value is a set of values.
    It is strict because in order to access a key you have to call
    `init_key` first otherwise `add`ing an item will result in
    a `KeyError`.
    """
	@others
</t>
<t tx="ekr.20060421081431.14">def __init__(self, keys=()):
    self.data = {}
    [self.init_key(key) for key in keys]
</t>
<t tx="ekr.20060421081431.15">def init_key(self, key):
    """pre-condition: key not in self.data"""
    val = self.data[key] = set()
    return val
</t>
<t tx="ekr.20060421081431.16">def __getitem__(self, key):
    return iter(self.data[key])
</t>
<t tx="ekr.20060421081431.17">def add(self, key, value):
    self.data[key].add(value)
</t>
<t tx="ekr.20060421081431.18">def remove(self, key, value):
    return self.data[key].remove(value)
</t>
<t tx="ekr.20060421081431.19">class DynSetsDict(SetsDict):
    """
    A sets of dictionary that is dynamic. The difference between a strict
    one is that when there isn't a sets associated with a certain key
    it will be created.
    
    When you remove a value if the key associated with it does not
    exist you won't have a problem either.
    """
	default = ()
	@others
</t>
<t tx="ekr.20060421081431.20">def __init__(self):
    self.data = {}
</t>
<t tx="ekr.20060421081431.21">def __getitem__(self, key):
    return iter(self.data.get(key, self.default))
</t>
<t tx="ekr.20060421081431.22">def remove(self, key, value):
    try:
        return self.data[key].remove(value)
    except KeyError:
        pass
</t>
<t tx="ekr.20060421081431.23">def add(self, key, value):
    try:
        vals = self.data[key]
    except KeyError:
        vals = self.data[key] = set()
        
    vals.add(value)
</t>
<t tx="ekr.20060421081431.24">def __delitem__(self, key):
    try:
        del self.data[key]
    except KeyError:
        pass
</t>
<t tx="ekr.20060421081431.25"></t>
<t tx="ekr.20060421081431.26">class PluginIterator:
	@others
</t>
<t tx="ekr.20060421081431.27">def __init__(self, registry, real_iter, *args, **kwargs):
    self.registry = registry
    self.real_iter = real_iter
    self.args = args
    self.kwargs = kwargs
</t>
<t tx="ekr.20060421081431.28">def next(self):
    plugin = self.real_iter.next()
    return plugin.get_instance(self.registry, *self.args, **self.kwargs)
</t>
<t tx="ekr.20060421081431.29">def __iter__(self):
    return self
</t>
<t tx="ekr.20060421081431.30">def __repr__(self):
    return repr(self.real_iter)
</t>
<t tx="ekr.20060421081431.31">class Plugin:
	@others
</t>
<t tx="ekr.20060421081431.32">def __init__(self, instance=None, factory=None):
    if factory is not None and not callable(factory):
        raise TypeError("If you specify a factory it must be a callable object.", factory)
        
    if factory is None:
        self.instance = instance
    else:
        self.factory = factory
</t>
<t tx="ekr.20060421081431.33">def get_instance(self, registry):
    try:
        return self.instance
    except AttributeError:
        self.instance = self.factory(registry)
        return self.instance
</t>
<t tx="ekr.20060421081431.34">def reset(self):
    del self.service
</t>
<t tx="ekr.20060421081431.35">def unplug(self, registry):
    """This method is called when the service is removed from the registry"""
</t>
<t tx="ekr.20060421081431.36"></t>
<t tx="ekr.20060421081431.37">class ExtensionPointError(StandardError):
    """Raised when there's an error of some sort"""
</t>
<t tx="ekr.20060421081431.38">class ExtensionPoint:
	@others
</t>
<t tx="ekr.20060421081431.39">def __init__(self):
    self.lazy = DynSetsDict()
</t>
<t tx="ekr.20060421081431.40">def get_extender(self, extender):
    return extender
</t>
<t tx="ekr.20060421081431.41">def init(self, extension_points):
    self.data = StrictSetsDict(extension_points)
    
    for ext_pnt in self.lazy:
        try:
            for extender in self.lazy[ext_pnt]:
                self.data.add(ext_pnt, self.get_extender(extender))
            
        except KeyError:
            pass
    del self.lazy
</t>
<t tx="ekr.20060421081431.42">def add(self, key, value):
    try:
        self.data.add(key, value)
    except AttributeError:
        self.lazy.add(key, value)
</t>
<t tx="ekr.20060421081431.43">def __getitem__(self, key):
    try:
        return self.data[key]
    except AttributeError:
        raise ExtensionPointError("Not initialized, run init() first")

get_extension_point = __getitem__</t>
<t tx="ekr.20060421081431.44">def has_init(self):
    return hasattr(self, "data")
</t>
<t tx="ekr.20060421081431.45">def keys(self):
    """
    Returns the available extension points. When it was not initialized
    a ExtensionPointError exception is raised.
    """
    
    try:
        return self.data.keys()
    except:
        raise ExtensionPointError("Not initialized, run init() first")
</t>
<t tx="ekr.20060421081431.46">class PluginExtensionPoint(ExtensionPoint):
	@others
</t>
<t tx="ekr.20060421081431.47">def __init__(self, registry):
    self._registry = weakref.ref(registry)
    ExtensionPoint.__init__(self)
</t>
<t tx="ekr.20060421081431.48">def get_extender(self, extender):
    return extender.get_instance(self._registry())
</t>
<t tx="ekr.20060421081431.49">class ExtensionPointManager:
    """
    An extension point manager is a DynSetsDict that can be transformed 
    into a StrictSetsDict. This means that before transforming it you
    can add elements at any key that they will be happily insterted
    however when the transformation takes turn all the elements will be
    added on the valid keys, the others will be silently discarded.
    
    This is usefull because the definition of the set (its keys) may
    only be known long after the object is needed - to aid the usage
    of lazy objects - and therefore the need for the transformation.
    
    To extended you can use a callable object 
    """
	@others
</t>
<t tx="ekr.20060421081431.50">def __init__(self, factory=ExtensionPoint):
    self.data = {}
    self.factory = factory
</t>
<t tx="ekr.20060421081431.51">def __getitem__(self, key):
    try:
        return self.data[key]
    except KeyError:
        val = self.data[key] = self.factory()
        return val
</t>
<t tx="ekr.20060421081431.52">def __delitem__(self, key):
    try:
        del self.data[key]
    except KeyError:
        pass
</t>
<t tx="ekr.20060421081431.53">def __repr__(self):
    return repr(self.data)
</t>
<t tx="ekr.20060421081431.54"># Use case of the classes defined above.</t>
<t tx="ekr.20060421081431.55">class SingletonError(StandardError):
    """Raised when you there's a problem related to Singletons."""
</t>
<t tx="ekr.20060421081431.56">class PluginEntry:
	@others
</t>
<t tx="ekr.20060421081431.57">def __init__(self, plugin, features, singletons, extension_points, extends):
    self.plugin = plugin
    self.features = list(features)
    self.singletons = list(singletons)
    self.extends = dict(extends)
    self.extension_points = list(extension_points)
</t>
<t tx="ekr.20060421081431.58">def get_instance(self, *args, **kwargs):
    return self.plugin.get_instance(*args, **kwargs)
</t>
<t tx="ekr.20060421081431.59">class PluginFactoryCreator:
    """
    This is basically a factory of plugin factories.
    Instances of this class are the factories needed on `Registry.register`,
    where the only thing you change is the actual `Plugin` factory.
    
    This class is needed when you need to specify a class that extends from
    `Plugin`.
    """
	@others
</t>
<t tx="ekr.20060421081431.60">def __init__(self, plugin_factory):
    self.plugin_factory = plugin_factory
</t>
<t tx="ekr.20060421081431.61">def __call__(self, **kwargs):
    singletons = kwargs.pop("singletons", ())
    features = kwargs.pop("features", ())
    extends = kwargs.pop("extends", ())
    extension_points = kwargs.pop("extension_points", ())
        
    if len(singletons) == len(features) == 0:
        raise TypeError("You must specify at least one feature or one singleton key")
    plugin = self.plugin_factory(**kwargs)
    return plugin, features, singletons, extension_points, extends
</t>
<t tx="ekr.20060421081431.62"># This is the default factory that uses the class Plugin
PluginFactory = PluginFactoryCreator(Plugin)

class Registry:
	@others
</t>
<t tx="ekr.20060421081431.63">def __init__(self, plugin_factory=PluginFactory):
    self.singletons = {}
    self.plugins = {}
    
    self.plugin_factory = plugin_factory
    factory = lambda: PluginExtensionPoint(self)
    
    self.ext_points = ExtensionPointManager(factory)
    self.features = DynSetsDict()
</t>
<t tx="ekr.20060421081431.64">def __iter__(self):
    return iter(self.plugins)
</t>
<t tx="ekr.20060421081431.65">def _check_plugin(self, plugin):
    entry = self.plugins[plugin]
    if len(entry.features) == 0 and len(entry.singletons) == 0:
        self.unregister(plugin)
</t>
<t tx="ekr.20060421081431.66">def clear(self):
    self.services = {}
    self.features.clear()
    for plugin in self.plugins:
        plugin.singeltons = []
        plugin.features = []
        plugin.unplug()
    self.plugins.clear()
</t>
<t tx="ekr.20060421081431.67">def get_extension_point(self, holder_id, extension_point):
    return self.ext_points[holder_id].get_extension_point(extension_point)
</t>
<t tx="ekr.20060421081431.68">def get_extension_point_def(self, holder_id):
    return self.ext_points[holder_id].keys()
</t>
<t tx="ekr.20060421081431.69">def get_features(self, feature, *args, **kwargs):
    return PluginIterator(self, iter(self.features[feature]), *args, **kwargs)
</t>
<t tx="ekr.20060421081431.70">def get_plugin_from_singleton(self, singleton):
    try:
        return self.singletons[singleton]
    except KeyError:
        raise SingletonError(singleton)
</t>
<t tx="ekr.20060421081431.71">def get_singleton(self, singleton, *args, **kwargs):
    return self.get_plugin_from_singleton(singleton).get_instance(self, *args, **kwargs)
</t>
<t tx="ekr.20060421081431.72">def register(self, plugin, features, singletons, extension_points, extends):
    
    # Check for singletons conflicts
    # In this case we do not allow overriding an existing Singleton
    for key in singletons:
        try:
            val = self.singletons[key]
            raise SingletonError(key)
        except KeyError:
            pass

    for key in singletons:
        self.singletons[key] = plugin
    
    for feat in features:
        self.features.add(feat, plugin)
    
    for holder_id, points in extension_points:
        self.ext_points[holder_id].init(points)
    
    extension_points = [row[0] for row in extension_points]
    
    for holder_id, extension_point in extends:
        self.ext_points[holder_id].add(extension_point, plugin)
    
    self.plugins[plugin] = PluginEntry(plugin, features, singletons,extension_points, extends)
    
    return plugin</t>
<t tx="ekr.20060421081431.73">def register_plugin(self, *args, **kwargs):
    return self.register(*self.plugin_factory(*args, **kwargs))
</t>
<t tx="ekr.20060421081431.74">def unregister(self, plugin):
    entry = self.plugins[plugin]
    
    for key in entry.singletons:
        del self.singletons[key]
        
    for feat in entry.features:
        self.features.remove(feat, plugin)
        
    for holder_id in entry.extension_points:
        del self.ext_points[holder_id]
    
    for holder_id, ext_pnt in entry.extends.iteritems():
        self.ext_points[holder_id].remove(ext_point, plugin)

    del self.plugins[plugin]
    
    plugin.unplug(self)</t>
<t tx="ekr.20060421081431.75">def unregister_feature(self, feature, plugin):
    """
    In order to remove a feature u must have the associated plugin.
    """
    self.features.remove(feature, plugin)
    
    entry = self.plugins[plugin]
    entry.features.remove(feature)
    self._check_plugin(plugin)
</t>
<t tx="ekr.20060421081431.76">def unregister_singleton(self, singleton):
    try:
        plugin = self.singletons.pop(singleton)
        entry = self.plugins[plugin]
        entry.singletons.remove(singleton)
        self._check_plugin(plugin)

    except KeyError:
        raise SingletonError(singleton)
</t>
</tnodes>
</leo_file>
