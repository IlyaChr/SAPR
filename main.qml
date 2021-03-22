import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15

import "nodeComponentCreation.js" as NodeScript
import QtQuick.Shapes 1.14

import com.company.FileUtils 1.0

Window {
    id: root
    visible: true
    width: 800
    height: 550
    title: qsTr("Hello World")

    property color bgcolor: "#5A6263"
    property color buttoncolor: "green"
    property color lineColor: "blue"

    FileUtils{
        id : fileUtils
    }

    Rectangle{
        id: background
        color: root.buttoncolor
        width: 110
        height: parent.height

        ToolBar{
            id: toolBar
            anchors.fill: parent
            // @disable-check M16
            clearTask.onClicked: {
                NodeScript.destroyNodes()
                canvas.clear_canvas();
            }

            // @disable-check M16
            lineButton.onClicked: {

                if (toolBar.state === toolBar.lineModeOff){
                    //delete free Node
                    if (NodeScript.nodelist.length === 1){
                        NodeScript.destroyNode(NodeScript.nodelist.length-1);
                    }
                }
            }

            // @disable-check M16
            showNumberNodes.onClicked: {
                if (toolBar.state === toolBar.lineModeOff){
                    if (NodeScript.nodelist.length === 1){
                        NodeScript.destroyNode(NodeScript.nodelist.length-1);
                    }
                }
            }


        }
    }


    Rectangle {
        id: rect
        color: root.bgcolor
        x: 110
        y: 0
        width: parent.width - x
        height: parent.height

        Canvas {
            id: canvas;
            width: 600;
            height: 480;
            antialiasing: true;
            property int wgrid: 60

            onPaint: {
                var ctx = getContext("2d")
                ctx.lineWidth = 1
                ctx.strokeStyle = "black"
                ctx.beginPath()
                var nrows = height/wgrid;
                for(var i=0; i < nrows+1; i++){
                    ctx.moveTo(wgrid, wgrid*i);
                    ctx.lineTo(width, wgrid*i);
                }

                var ncols = width/wgrid
                for(var j=0; j < ncols+1; j++){
                    ctx.moveTo(wgrid*j, wgrid);
                    ctx.lineTo(wgrid*j, height);
                }
                ctx.closePath()
                ctx.stroke()
            }

            function drawLine(node_start,node_end){
                var ctx = canvas.getContext("2d");
                ctx.beginPath();
                ctx.strokeStyle = lineColor;
                ctx.lineWidth = 3;
                ctx.moveTo(node_start.x+node_start.width/2, node_start.y+node_start.height/2);
                ctx.lineTo(node_end.x+node_end.width/2, node_end.y+node_end.height/2);
                ctx.stroke();
                canvas.requestPaint();
            }


            function clear_canvas() {
                var ctx = getContext("2d");
                ctx.clearRect(0,0,width,height);
                canvas.requestPaint();
            }

        }



        MouseArea{
            id: mouseArea
            anchors.fill: parent

            onClicked: {
                if (toolBar.state === toolBar.lineModeOn){
                    lineOnMode();
                }
            }

            function lineOnMode(){
                var existedNode = NodeScript.getExistedNode(Qt.point(mouseX, mouseY));

                if (existedNode){
                    // connect with existed Node
                    canvas.drawLine(
                                NodeScript.nodelist[NodeScript.nodelist.length-1],
                                existedNode);


                }else{
                    //create new Node
                    var obj = NodeScript.createSpriteObjects(mouseX-15,mouseY-15);
                    if ( NodeScript.nodelist.length >=2){
                        canvas.drawLine(
                                    NodeScript.nodelist[NodeScript.nodelist.length-2],
                                    NodeScript.nodelist[NodeScript.nodelist.length-1]);
                    }
                }
            }

        }
    }




}

/*##^##
Designer {
    D{i:5;anchors_height:200;anchors_x:133;anchors_y:189}
}
##^##*/
