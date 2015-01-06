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
    property double rectangle_b: -1.0
    

    layout: DockLayout {
    }
    horizontalAlignment: HorizontalAlignment.Fill
    verticalAlignment: VerticalAlignment.Fill

    function calculateProperties() {
        var a = 1.0
        var b = rectangle_b
        console.debug("value: " + value + " next: " + nextValue)
        if (value < nextValue) {
            a = 1.0 * (nextValue - value)
        }
        if (value > nextValue) {
            a = 1.0 * (value - nextValue)
        }
        console.debug("COUNTER " + counter + " a: " + a + " b: " + b)
        var a2 = Math.pow(a, 2)
        var b2 = Math.pow(b, 2)
        var diagonal = Math.sqrt(a2 + b2 )
        console.debug("Diagonal: " + diagonal)
        pivotX = diagonal * -0.5
        minWidth = diagonal
        maxWidth = diagonal
        if (value == nextValue) {
            rotationZ = 0.0
            return 
        }
        var sinus = a / diagonal
        var grad = sinus * 180 / Math.PI
        if(a > b){
            sinus = b / diagonal
            grad = sinus * 180 / Math.PI
            grad = 90.0 - grad
        }
        if (value < nextValue) {
            rotationZ = 360 - grad
            console.debug("sinus: " + sinus + " grad: " + grad + " rotateZ: " + rotationZ)
        }
        if (value > nextValue) {
            rotationZ = grad
            console.debug("sinus: " + sinus + " grad: " + grad + " rotateZ: " + rotationZ)
        }
    } // calculateProperties

    onCreationCompleted: {
        //
    }
} // rectangle
