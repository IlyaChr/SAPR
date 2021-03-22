import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: root

    property color color: "#e9eef5"
    property string lineModeOnText: "Линия"
    property string lineModeOffText: "Отмена"
    property string lineModeOn: "lineModeOn"
    property string lineModeOff: "lineModeOff"
    property string showNumberNodesOn: "Показать \n номера узлов"
    property string showNumberNodesOff: "Cкрыть \n номера узлов"
    property alias clearTask: clearTaskButton
    property alias lineButton: lineButton
    property alias saveTaskButton: saveTaskButton
    property alias showNumberNodes: showNumberNodes
    state: lineModeOff



    Rectangle{
        id: rectangle
        color: root.color
        height: root.height
        width: root.width


        Column {
            id: column
            spacing: 5
            anchors.fill: parent

            Button{
                id: lineButton
                text: lineModeOnText
                onClicked: {
                    root.state = (root.state == lineModeOn) ? lineModeOff : lineModeOn
                }
            }

            Button{
                id: saveTaskButton
                text: "Cохранить задачу"
            }

            Button{
                id: clearTaskButton
                text: "Очистить задачу"
            }

            Button{
                id: showNumberNodes
                text: showNumberNodesOn
            }

        }
    }

    states: [
        State {
            name: lineModeOn
            PropertyChanges {
                target: lineButton
                text: lineModeOnText
            }


        },
        State {
            name: lineModeOff
            PropertyChanges {
                target: lineButton
                text: lineModeOffText
            }

        }
    ]

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
