import QtQuick 1.0
import com.meego 1.0
import com.nokia.extras 1.0


Page {
    id: root
    Button {
        id: bSearch
        text: "S"
        width: 64
        anchors {
            top: parent.top
            right: parent.right

        }
        onClicked: {
            var res = leoEngine.startSearch(tSearchText.text)
            console.log(res)
            searchResultModel.clear()
            for (var i in res) {
                var v= res[i]
                console.log(v)
                var ent = { title: v['h'], subtitle: v['h'] }
                searchResultModel.append(ent)
            }

            console.log(res)
        }
    }

    Component.onCompleted: {
        console.log(leoEngine.searchModel)
        ;
    }

    TextField {
        id: tSearchText

        anchors {
            top: parent.top
            left: parent.left
            right: bSearch.left
        }

    }

    ListModel {
        id: searchResultModel
        ListElement {
            title: "Test 1"
        }
        ListElement {
            title: "Test 2"
        }
        ListElement {
            title: "Test 3"
        }
    }

    ListView {
        anchors {
            top: tSearchText.bottom; left: parent.left; right: parent.right; bottom: parent.bottom
        }


        model: searchResultModel

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
            onClicked: { openFile(model.page); }
        }
    }


}
