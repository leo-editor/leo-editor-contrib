import QtQuick 1.0
import com.meego 1.0
import com.nokia.extras 1.0

import "priv.js" as P


Page {
    id: root

    QtObject {
        id: priv
        property int parentnodeid
        property string current_h
        property string body
        property string bodypreview
        property bool bodypreview_full        
    }


    ToolBarLayout {
        id: nodeViewTools
        ToolIcon { iconId: theme.inverted ? "icon-m-toolbar-back-white" : "icon-m-toolbar-back"; onClicked: pageStack.pop(); }
        ToolButtonRow {
            ToolButton {
                text: "..."  ;
                width: 80
                visible: !priv.bodypreview_full
                onClicked: {
                    priv.bodypreview = priv.body
                    priv.bodypreview_full = true
                }


            }
            ToolButton { text: "+"  ; width: 80 }
            ToolButton {
                text: "Edit"
                onClicked: {
                    var p = pushEditPage(P.priv(root).nodeInfo)
                    p.saved.connect(function() { setFields(P.priv(root).nodeInfo) })


                }
            }
        }
        ToolIcon { iconId: theme.inverted ? "icon-m-toolbar-view-menu-white" : "icon-m-toolbar-view-menu"; onClicked: myMenu.open(); }
    }

    tools: nodeViewTools


    ListModel {
        id: nodeList
        ListElement {
            node_id: 0
            title: "Test 1"
            subtitle: "sub"
        }
    }

    function setFields(node) {
        var body = node.b
        priv.current_h = node.h
        console.log("Body is ", body)
        var b = ""
        var nl = body.indexOf('\n', 500)
        priv.body = body

        if (nl > 0) {

            priv.bodypreview = body.substr(0, nl)
            priv.bodypreview_full = false
        } else {
            priv.bodypreview = body
            priv.bodypreview_full = true
        }

    }

    function setParent(parentid) {
        priv.parentnodeid = parentid
        var children = leoEngine.childNodes(parentid)

        nodeList.clear()
        for (var i in children) {
            var v = children[i]
            nodeList.append({
                            node_id: v.id,
                            title : v.h,
                            subtitle: "sub"
            })

        }

        var node = leoEngine.db.fetchNodeFull(priv.parentnodeid)
        P.priv(root).nodeInfo = node
        setFields(node)

    }

    ListView {
        snapMode: ListView.NoSnap
        anchors {
            top: parent.top; left: parent.left; right: parent.right; bottom: parent.bottom
        }

        model: nodeList

        delegate: ListDelegate {
            titleSize: 22
            property int titleWeight: Font.Normal
            //property color titleColor: theme.inverted ? UI.LIST_TITLE_COLOR_INVERTED : UI.LIST_TITLE_COLOR

            Image {
                source: "image://theme/icon-m-common-drilldown-arrow" + (theme.inverted ? "-inverse" : "")
                anchors.right: parent.right;

                anchors.rightMargin: 16
                anchors.verticalCenter: parent.verticalCenter
            }

            subtitleColor: "#cc6633"
            onClicked: {

                pushPage(node_id)
            }
        }

        header: Rectangle {
            height: 50
            Label {

                text: priv.current_h
                color: "blue"

            }

        }

        footer: Rectangle {
            //height: 5000
            id: fitem
            width: parent.width
            height: bodyf.height

            Label {
                //anchors.fill: parent
                id: bodyf
                text: priv.bodypreview
            }

        }
    }

}
