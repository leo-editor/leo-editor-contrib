<?xml version="1.0" encoding="UTF-8"?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="103" clone_windows="0"/>
<globals body_outline_ratio="0.5">
	<global_window_position top="10" left="10" height="705" width="1009"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences>
</preferences>
<find_panel_settings>
	<find_string></find_string>
	<change_string></change_string>
</find_panel_settings>
<vnodes>
<v t="rodrigob.120503222446" a="E"><vh>Test for LeoN</vh>
<v t="rodrigob.120503222446.1" a="E"><vh>@leoServer localhost:8787:/</vh></v>
<v t="rodrigob.121603130412"><vh>another node</vh></v>
<v t="rodrigob.122903010548" a="E"><vh>user2</vh>
<v t="rodrigob.122903010654" a="E"><vh>@leoServer localhost:8787:/</vh></v>
</v>
<v t="rodrigob.121303200519" a="E"><vh>Automatic execution nodes</vh>
<v t="rodrigob.121303200519.1" a="EV"><vh>Automatic connect</vh></v>
<v t="rodrigob.120803130016" a="E"><vh>Automatic connect and expand (get_outline check)</vh></v>
<v t="rodrigob.121303203452" a="E"><vh>Outline upload</vh>
<v t="rodrigob.120503222446.3" a="E"><vh>Yet another node.</vh>
<v t="rodrigob.120503222446.4"><vh>yan/\ß</vh>
<v t="rodrigob.120503222446.5" a="E"><vh>yan10</vh>
<v t="rodrigob.120503222446.6" a="E"><vh>yan2</vh>
<v t="rodrigob.120503222446.7" a="E"><vh>yan1</vh></v>
<v t="rodrigob.120503222446.8" a="E"><vh>yan3</vh>
<v t="rodrigob.120503222446.9" a="E"><vh>yan4</vh></v>
<v t="rodrigob.120503222446.10" a="E"><vh>yan5</vh>
<v t="rodrigob.120503222446.11" a="E"><vh>yan7</vh></v>
</v>
<v t="rodrigob.120503222446.12" a="E"><vh>yan6</vh></v>
</v>
<v t="rodrigob.120503222446.11" a="E"><vh>yan7</vh></v>
<v t="rodrigob.120503222446.13" a="E"><vh>yan8</vh></v>
</v>
</v>
</v>
<v t="rodrigob.120503222446.7" a="E"><vh>yan1</vh></v>
<v t="rodrigob.120503222446.6" a=""><vh>yan2</vh>
<v t="rodrigob.120503222446.7" a="E"><vh>yan1</vh></v>
<v t="rodrigob.120503222446.8" a="E"><vh>yan3</vh>
<v t="rodrigob.120503222446.9" a="E"><vh>yan4</vh></v>
<v t="rodrigob.120503222446.10" a="E"><vh>yan5</vh>
<v t="rodrigob.120503222446.11" a="E"><vh>yan7</vh></v>
</v>
<v t="rodrigob.120503222446.12" a="E"><vh>yan6</vh></v>
</v>
<v t="rodrigob.120503222446.11" a="E"><vh>yan7</vh></v>
<v t="rodrigob.120503222446.13" a="E"><vh>yan8</vh></v>
</v>
</v>
</v>
<v t="rodrigob.120803135727" a="E"><vh>Automatic Admin gui</vh></v>
<v t="rodrigob.121303200519.2" a="E"><vh>test</vh>
<v t="rodrigob.122603022129.7"><vh>delete test</vh></v>
<v t="rodrigob.120803125834" a="E"><vh>Execution test	</vh></v>
<v t="rodrigob.120803125834.1" a="E"><vh>tn1</vh>
<v t="rodrigob.120803125834.2"><vh>tn2</vh></v>
</v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="rodrigob.120503222446">@nocolor
This is the outline used for the LeoN_plugin tests.
For more information about LeoN tests, look at the LeoNtest.py file
@color</t>
<t tx="rodrigob.120503222446.1">@login user1:pass1


</t>
<t tx="rodrigob.120503222446.3"></t>
<t tx="rodrigob.120503222446.4"></t>
<t tx="rodrigob.120503222446.5"></t>
<t tx="rodrigob.120503222446.6"></t>
<t tx="rodrigob.120503222446.7">Minimal content for yan1</t>
<t tx="rodrigob.120503222446.8"></t>
<t tx="rodrigob.120503222446.9"></t>
<t tx="rodrigob.120503222446.10"></t>
<t tx="rodrigob.120503222446.11"></t>
<t tx="rodrigob.120503222446.12"></t>
<t tx="rodrigob.120503222446.13"></t>
<t tx="rodrigob.120803125834">@color
@language python

from leoGlobals import *

t_node = top().currentVnode().threadNext()

es(t_node.headString())
es(t_node.bodyString())
es(type(t_node.headString()))</t>
<t tx="rodrigob.120803125834.1">test node 1</t>
<t tx="rodrigob.120803125834.2">tn2 text node 2</t>
<t tx="rodrigob.120803130016">from leoGlobals import *
from twisted.internet import reactor

c = top()
t_vnode = c.rootVnode().threadNext()

#es(t_vnode.headString()); es(t_vnode.bodyString())

assert t_vnode.headString().startswith("@leoServer") # ensure we found the correct node

# Simulate a double click
c.selectVnode(t_vnode) # select the @leoServer node
doHook("icondclick2",c=top(),v=t_vnode) # not exactly a simulation, but enough for this case.

reactor.callLater(1.0, c.expandToLevel, 9) # wait a second  # show the downloaded heirarchy

</t>
<t tx="rodrigob.120803135727">@color
@language python

from leoGlobals import *
from twisted.internet import reactor

c = top()
t_vnode = c.rootVnode().threadNext()

#es(t_vnode.headString()); es(t_vnode.bodyString())

assert t_vnode.headString().startswith("@leoServer") # ensure we found the correct node

# Simulate a double click
c.selectVnode(t_vnode) # select the @leoServer node
doHook("icondclick2",c=top(),v=t_vnode) # not exactly a simulation, but enough for this case.

# wait a reactor delay # &lt;&lt;&lt; HOW TO DO THIS ?

reactor.callLater(1.0, t_vnode.client.OnAdmin, event=None, v=t_vnode) # wait two seconds
</t>
<t tx="rodrigob.121303200519">@nocolor
Each node of this outline, when executed, perform automatically an action over the @leoServer outline.
Some of them do simple repetitive actions, others do simple tests.

The nodes are executed with the "Ctrl+E" shortcut (Edit-&gt;Execute Script)

(I have not yet figured how to do complex tests (required to recuper the Deferred objects))


@color
@language python
</t>
<t tx="rodrigob.121303200519.1">from leoGlobals import *
from twisted.internet import reactor

#import pdb ; pdb.set_trace()# could but does not work yet

c = top()
t_vnode = c.rootVnode().threadNext()

#es(t_vnode.headString()); es(t_vnode.bodyString())

assert t_vnode.headString().startswith("@leoServer") # ensure we found the correct node

# Simulate a double click
c.selectVnode(t_vnode) # select the @leoServer node
doHook("icondclick2",c=top(),v=t_vnode) # not exactly a simulation, but enough for this case.

reactor.callLater(0.5, lambda *args:c.selectVnode(t_vnode.threadNext().threadNext())) 
</t>
<t tx="rodrigob.121303200519.2"></t>
<t tx="rodrigob.121303203452">from leoGlobals import *
from twisted.internet import reactor

c = top()
original_vnode =  c.currentVnode()
t_vnode = original_vnode.threadNext() # should obtain the "Yet another node"

assert t_vnode.headString().startswith("Yet another") # ensure we found the correct node

# copy the outline
c.selectVnode(t_vnode) # select the node
c.copyOutline()
es("Copied the '%s' outline" % t_vnode.headString())
c.selectVnode(original_vnode)


# connect
t_vnode = c.rootVnode().threadNext().threadNext().threadNext()
assert t_vnode.isOnline(), "The client require to be already connected to run this test"
assert t_vnode.headString() == "test_node1", "Error when reaching the node 'test_node1'. Reached %s" % t_vnode.headString().encode("utf-8") 

c.selectVnode(t_vnode) # select the node
c.pasteOutline()

# put back the selection
c.selectVnode(original_vnode) # select the node

@c

</t>
<t tx="rodrigob.121603130412"></t>
<t tx="rodrigob.122603022129.7">@color
@language python
# run in a clone !

from leoGlobals import *


c = top()
t_vnode = c.currentVnode()
assert t_vnode.isCloned(), "Not a clone, will not delete the code, test in a clone"
t_vnode.doDelete(t_vnode.parent())</t>
<t tx="rodrigob.122903010548"></t>
<t tx="rodrigob.122903010654">@login user2:pass2


</t>
</tnodes>
</leo_file>
