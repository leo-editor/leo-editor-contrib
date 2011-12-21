import QtQuick 1.0
import com.meego 1.0
import com.nokia.extras 1.0

import "priv.js" as P

Page {
    id: root

    signal saved

    ToolBarLayout {
        id: nodeEditTools
        ToolIcon { iconId: theme.inverted ? "icon-m-toolbar-back-white" : "icon-m-toolbar-back"; onClicked: pageStack.pop(); }

        ToolIcon {
            iconId: theme.inverted ? "icon-m-toolbar-done-white" : "icon-m-toolbar-done"
            onClicked: {
                save()



            }

        }

        ToolIcon { iconId: theme.inverted ? "icon-m-toolbar-view-menu-white" : "icon-m-toolbar-view-menu"; onClicked: myMenu.open(); }
    }

    tools: nodeEditTools


    function setNodeInfo(ni) {
        P.priv(root).nodeInfo = ni
        tBody.text = ni.b
        tHeader.text = ni.h
    }

    function save() {
        console.log("h is " + tHeader.text)

        var ni = P.priv(root).nodeInfo

        ni['h'] = tHeader.text
        ni['b'] = tBody.text
        leoEngine.db.updateNode(ni)
        leoEngine.db.commit()
        saved()


    }


    QtObject {
        id: priv

    }


    Flickable {
        id: container
        anchors.fill: parent
        anchors.topMargin: 6
        anchors.leftMargin: 6
        anchors.rightMargin: 6
        anchors.bottomMargin: 6
        contentWidth: col.width
        contentHeight: col.height
        flickableDirection: Flickable.VerticalFlick
        pressDelay: 100
        Column {
            id: col
            width: container.width

            TextField {
                id: tHeader
                anchors {
                    //top: parent.top
                    left: parent.left
                    right: parent.right
                }
            }

            TextArea {
                id: tBody
                anchors {
                    left: parent.left
                    right: parent.right
                    //bottom: parent.bottom
                }
            }
        }
    }



}
