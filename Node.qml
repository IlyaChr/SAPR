import QtQuick 2.0

Item {
    id: root
    height: 15
    width: 15
    property int number: 0


    Column{
        //anchors.fill: parent
        spacing: 10


        Rectangle{
            Text {
                text: number.toString()
                color: "blue"
                font.pixelSize: 10
            }
        }

        Rectangle{
            width: 10
            height: 10
            color: "#00000000"
            radius: 10
            border.color: "#fc0f0f"

        }
    }




    function hasInterseption(point){
        if (point.x > x && point.x < x+width  &&
                point.y > y && point.y < y+height   ){
            return true;
        }
        return false;
    }

    function showNumber(){

    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
