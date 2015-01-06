import bb.cascades 1.2

Container {
    id: rectangle
    property int originValue: -1
    property int value: -1
    property int nextValue: -1
    property bool lastValue: false
    property int counter: -1
    onCounterChanged: {
        calculateProperties()
    }
    property int rectangle_b: -1
    property int rectangle_a: -1
    property int diagonal: -1
    
    layout: DockLayout {
    }
    horizontalAlignment: HorizontalAlignment.Fill
    verticalAlignment: VerticalAlignment.Fill
    
    function calculateProperties(){
        console.debug("value: "+value+ " next: "+nextValue)
        if(value < nextValue){
            rectangle_a = nextValue - value
        }
        if(value > nextValue){
            rectangle_a = value - nextValue
        }
        console.debug("Rectangle a: "+rectangle_a+" b: "+rectangle_b)
        diagonal = Math.sqrt((rectangle_a * rectangle_a)+(rectangle_b*rectangle_b))
        console.debug("Diagonal: "+diagonal)
        pivotX = -(diagonal / 2)
        minWidth = diagonal
        maxWidth = diagonal
        if(value == nextValue){
            rotationZ = 0.0
        }
        if(value < nextValue){
            // rotationZ = 315.0
            var sinus = rectangle_a / diagonal
            var grad = sinus * (180 / Math.PI)
            rotationZ = 360 - grad
        }
        if(value > nextValue){
            // rotationZ = 45.0
            var sinus = rectangle_a / diagonal
            var grad = sinus * (180 / Math.PI)
            rotationZ = grad
        }
    } // calculateProperties
    
    onCreationCompleted: {
        //
    }
} // rectangle
