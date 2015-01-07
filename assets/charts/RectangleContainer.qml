import bb.cascades 1.2

Container {
    id: rectangle
    property int value: -1
    property int nextValue: -1
    property double rectangle_b: -1.0
    onRectangle_bChanged: {
        calculateProperties()
    }

    layout: DockLayout {
    }
    horizontalAlignment: HorizontalAlignment.Fill
    verticalAlignment: VerticalAlignment.Fill

    function calculateProperties() {
        var a = 1.0
        var b = rectangle_b
        if (value < nextValue) {
            a = nextValue - value
        }
        if (value > nextValue) {
            a = value - nextValue
        }
        var a2 = Math.pow(a, 2)
        var b2 = Math.pow(b, 2)
        var diagonal = Math.sqrt(a2 + b2)
        pivotX = diagonal * -0.5
        minWidth = diagonal
        maxWidth = diagonal
        if (value == nextValue) {
            rotationZ = 0.0
            return
        }
        var sinus = 0.0
        var degree = 0.0
        if (a < b) {
            sinus = a / diagonal
            degree = sinus * 180 / Math.PI
        } else {
            sinus = b / diagonal
            degree = sinus * 180 / Math.PI
            degree = 90.0 - degree
        }
        if (value < nextValue) {
            rotationZ = 360 - degree
        }
        if (value > nextValue) {
            rotationZ = degree
        }
    } // calculateProperties

    onCreationCompleted: {
        //
    }
} // rectangle
