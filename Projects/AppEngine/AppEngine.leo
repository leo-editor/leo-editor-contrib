<?xml version="1.0" encoding="utf-8"?>
<?xml-stylesheet ekr_test?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20050428172228"><vh>Startup</vh>
<v t="ekr.20100901094055.2406" a="E"><vh>@settings</vh>
<v t="ekr.20100901094055.2432"><vh>@shortcuts</vh></v>
<v t="ekr.20100901162649.2364"><vh>@bool enable-abbreviations = True</vh></v>
<v t="ekr.20101106200313.2313"><vh>@data global-abbreviations</vh></v>
<v t="ekr.20100907101816.2386"><vh>@enabled-plugins</vh></v>
</v>
</v>
<v t="ekr.20101106200313.2313"></v>
<v t="ekr.20101106071931.2103"><vh>@button start-server</vh></v>
<v t="ekr.20101106074453.2106"><vh>@button kill-server</vh></v>
<v t="ekr.20101106095827.2504"><vh>@button deploy</vh></v>
<v t="ekr.20101106204306.1391"><vh>Read me</vh></v>
<v t="ekr.20101106071931.2100" a="E"><vh>app engine</vh>
<v t="ekr.20101106071931.2101" a="O"><vh>@nosent app.yaml</vh></v>
<v t="ekr.20101106090932.2110"><vh>@nosent main.html</vh></v>
<v t="ekr.20101106071931.2102" a="E"><vh>@file my-app-engine-project.py</vh></v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20050428172228"></t>
<t tx="ekr.20100901094055.2406">@nocolor-node

The @settings tree contains all active settings. 

Settings outside this tree have no effect.</t>
<t tx="ekr.20100901094055.2432">backward-delete-word  = Ctrl-Backspace

# These may be keyboard dependent.
backward-find-character = Ctrl-1
backward-find-character-extend-selection = Ctrl-Shift-1 # works

find-character = Ctrl-2
find-character-extend-selection = Ctrl-at # works

run-all-unit-tests = Alt-6

# Disable the Insert key.  It is annoying.
insert-node = None
insert-node = Ctrl-I
</t>
<t tx="ekr.20100901162649.2364"></t>
<t tx="ekr.20100907101816.2386" lineYOffset="4b002e">@color

# Standard plugins

mod_scripting.py
nav_qt.py
plugins_menu.py
quicksearch.py
scrolledmessage.py
UNL.py

# Interesting
# leoremote.py
# todo.py
</t>
<t tx="ekr.20101106071931.2100">@path c:\leo.repo\contrib\Projects\AppEngine
</t>
<t tx="ekr.20101106071931.2101">@comment #

# Created in AppEngine.leo
application: my-app-engine-project
version: 1
runtime: python
api_version: 1

handlers:
- url: /.*
  script: my-app-engine-project.py
</t>
<t tx="ekr.20101106071931.2103">import subprocess

# C:\prog\leo-editor

server = r'C:\Program Files (x86)\Google\google_appengine\dev_appserver.py'
app = r'C:\my-app-engine-project'
cmd = 'python25 "%s" --port=8080 "%s"' % (server,app)
moz = r'"c:\Program Files (x86)\Mozilla Firefox\firefox.exe" "http://localhost:8080/"'

if hasattr(g.app,'app_server_proc'):
    g.es_print('server already active')
else:
    g.app.app_server_proc = subprocess.Popen(cmd)
    g.es_print(g.app.app_server_proc)
    
    proc2 = subprocess.Popen(moz)
    g.es_print('Mozilla process',proc2)</t>
<t tx="ekr.20101106074453.2106">if hasattr(g.app,'app_server_proc'):
    proc = g.app.app_server_proc
    g.es_print('killing',proc)
    proc.kill()
    del g.app.app_server_proc
else:
    g.es_print('no server')
</t>
<t tx="ekr.20101106090932.2110">@language html

&lt;h1&gt;The Leo Outlining Editor&lt;h1&gt;

{% for shout in shouts %}
&lt;div&gt;
    {{shout.message}}
    from
    {% ifequal shout.who None %}
        Anonymous
    {% else %}
        {{shout.who}}
    {% endifequal %}
&lt;/div&gt;
{% endfor %}

&lt;form action="main_submit" method="post" acccept-charset="utf-8"&gt;

    &lt;p&gt;From: &lt;input type="text" name="who" value="" id="who"&gt;&lt;/p&gt;

    &lt;p&gt;Message: &lt;input type="text" name="message" value="" id="message"&gt;&lt;/p&gt;

    &lt;p&gt;&lt;input type="submit" value="Shout!"&gt;&lt;/p&gt;

&lt;/form&gt;

</t>
<t tx="ekr.20101106095827.2504">import subprocess

appcfg = server = r'C:\Program Files (x86)\Google\google_appengine\appcfg.py'
app = r'C:\my-app-engine-project'
cmd = r'python25 "%s" update "%s"' % (appcfg,app)

g.es_print('command:',cmd)
g.app.app_server_proc = subprocess.Popen(cmd)
g.es_print(g.app.app_server_proc)
</t>
<t tx="ekr.20101106200313.2313">ncn=@nocolor-node\n\n
atnc=@nocolor\n
form_=&lt;form action="main_submit" method="get"\nacccept-charset="utf-8"&gt;\n\n&lt;p&gt;&lt;input type="submit"\nvalue="Continue &amp;rarr;"&gt;&lt;/p&gt;\n&lt;/form&gt;\n\n
input_=&lt;input \ntype="text/submit/hidden/button" \nname="some_name" value="" \nid="some_name"&gt; \n\n</t>
<t tx="ekr.20101106204306.1391">@nocolor-node

This File contains a demo of using Leo to develop Google App Engine applications.

- Use the start-server and kill-server buttons to start and stop serving to localhost:8080.

- Use the deploy button to deploy your app using google_appengine\appcfg.py

**Important: the scripts assume your project is in c:\my-app-engine-project.

   Change these as necessary:
       
       - The @path directive in the app engine node.
       - </t>
</tnodes>
</leo_file>
