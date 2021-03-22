var component;
var node;

var nodelist = []

function createSpriteObjects(x,y) {
    component = Qt.createComponent("Node.qml");
    if (component.status === Component.Ready)
        finishCreation(x,y);
    else
        component.statusChanged.connect(finishCreation(x,y));
}

function finishCreation(x,y) {
    if (component.status === Component.Ready) {
        node = component.createObject(rect, {number: nodelist.length+1, x: x, y: y});
        if (node === null) {
            // Error Handling
            console.log("Error creating object");
        }else{
            nodelist.push(node);
            return node;
        }
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}

function destroyNodes(){
    nodelist.forEach( node => node.destroy());
    nodelist = [];
}


function destroyNode(pos){
    nodelist[pos].destroy();
    nodelist.splice(pos, 1)
}


function getExistedNode(point){
    for (var i = 0; i<nodelist.length; i++){
        if (nodelist[i].hasInterseption(point)){
            return nodelist[i];
        }
    }

    return null;
}




