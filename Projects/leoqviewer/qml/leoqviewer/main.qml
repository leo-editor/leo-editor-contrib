import QtQuick 1.0
import com.meego 1.0

PageStackWindow {
    id: rootWindow
   // platformStyle: defaultStyle
    property Component nodeViewComponent
    property Component nodeEditComponent

    ToolBarLayout {
        id: commonTools
        visible: false
        ToolIcon { iconId: theme.inverted ? "icon-m-toolbar-back-white" : "icon-m-toolbar-back"; onClicked: pageStack.pop(); }
        ToolIcon { iconId: theme.inverted ? "icon-m-toolbar-view-menu-white" : "icon-m-toolbar-view-menu"; onClicked: (myMenu.status == DialogStatus.Closed) ? myMenu.open() : myMenu.close() }
    }

    NodeSearch {
        id: nodeSearch
    }


    NodeView {
        id: nodeView
    }

    function pushPage(parentid) {
        var p = pageStack.push(nodeViewComponent)
        console.log(p)
        p.setParent(parentid)

    }

    function pushEditPage(nodeinfo) {
        var p = pageStack.push(nodeEditComponent)
        p.setNodeInfo(nodeinfo)
        return p
    }

    Component.onCompleted: {
        nodeViewComponent = Qt.createComponent("NodeView.qml")
        nodeEditComponent = Qt.createComponent("NodeEdit.qml")
        leoEngine.openDb("/home/ville/treefrag.db")
        pushPage(0)


        //nodeView.setParent(0)
    }

   initialPage: nodeView

}
