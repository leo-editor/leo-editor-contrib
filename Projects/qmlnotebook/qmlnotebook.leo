<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo (http://webpages.charter.net/edreamleo/front.html) -->
<?xml-stylesheet ekr_test?>
<leo_file xmlns:leo="http://www.leo-editor.org/2011/leo" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ville.20120429101639.1371" a="E"><vh>@auto notebooktest.py</vh></v>
<v t="ville.20120429101639.1363" a="E"><vh>Root level</vh>
<v t="ville.20120429101639.1364" a="E"><vh>ch1</vh>
<v t="ville.20120429101639.1366"><vh>ch1.1</vh></v>
<v t="ville.20120429101639.1367"><vh>ch1.2</vh></v>
</v>
<v t="ville.20120429101639.1365"><vh>ch2</vh></v>
</v>
<v t="ville.20120427233328.1348"><vh>Terrys qmlshower</vh></v>
<v t="ville.20120427234823.1353"><vh>try qwrappers</vh></v>
<v t="ville.20120428225125.1361"><vh>standarditemmodel</vh></v>
</vnodes>
<tnodes>
<t tx="ville.20120427233328.1348">from PyQt4.QtCore import QUrl, QObject

from PyQt4.QtDeclarative import QDeclarativeView
class QMLShower:
   def __init__(self, c):
       self.c = c
       c._qml_shower = self
       self.w = None
       c.free_layout.get_top_splitter().register_provider(self)
   def ns_provider_id(self):  # allow for re-registering, mainly for dev.
       return '__qml_shower'
   def ns_provides(self):  # what we can provide
       return [("Add QML shower", '__add_qml_shower')]
   def ns_provide(self, id_):  # provide it
       if id_ == '__add_qml_shower':
           g.unregisterHandler('select2', self.update)
           g.registerHandler('select2', self.update)
           if not self.w:
               self.w = self.make_widget()
           return self.w
   def make_widget(self):
       view = QDeclarativeView()
       path = g.os_path_join(g.computeLeoDir(), 'plugins', 'qmlnb', 'qml', 'leonbmain.qml')
       view.setSource(QUrl(path))
       view.setResizeMode(QDeclarativeView.SizeRootObjectToView)
       # Display the user interface and allow the user to interact with it.
       view.setGeometry(100, 100, 400, 240)
       view.show()
       #rootObject = view.rootObject()
       #rootobject.leo_c = self.c
       return view
   def update(self, tag, kwords):
       pass
   def closed(self, event):
       g.unregisterHandler('select2', self.update)

QMLShower(c)</t>
<t tx="ville.20120427234823.1353">import leo.core.leoqwrappers
reload(leo.core.leoqwrappers)
from leo.core.leoqwrappers import *
n = NodeWrapper(c, p.v)
print n
print n.children()</t>
<t tx="ville.20120428225125.1361">from PyQt4.QtGui import QStandardItemModel,QStandardItem



</t>
<t tx="ville.20120429101639.1363">Root level content</t>
<t tx="ville.20120429101639.1364">Ch 1 content</t>
<t tx="ville.20120429101639.1365">Ch 2 content</t>
<t tx="ville.20120429101639.1366">Level 2</t>
<t tx="ville.20120429101639.1367">Also level 2</t>
</tnodes>
</leo_file>
