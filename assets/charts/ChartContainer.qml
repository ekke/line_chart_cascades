import bb.cascades 1.2

Container {
    id: chart
    
    property variant chartBackground: Color.White
    property variant borderColor: Color.LightGray
    property variant lineColor: Color.Blue
    
    property int totalWidth: 600
    property int totalHeight: 200
    property int borderWidth: 2
    property int space: 10
    
    property int chartWidth: totalWidth - (2 * borderWidth) - (2 * space)
    property int chartHeight: totalHeight - (2 * borderWidth) - (2 * space)
    property int lineWidth: 2
    property int minDistance: 20
    property int maxPoints: chartWidth / minDistance
    
    property variant originValues: []
    property int originMax: -1
    onOriginMaxChanged: {
        calculateValues()
        createRectangles()
        createPoints()
    }
    property variant values: [] 
    
    layout: DockLayout {
    }
    horizontalAlignment: HorizontalAlignment.Fill
    verticalAlignment: VerticalAlignment.Fill
    
    attachedObjects: [
        ComponentDefinition {
            id: rectangleComponent
            source: "RectangleContainer.qml"
        }
    ]
    
    Container {
        id: outerChartContainer
        background: borderColor
        minWidth: totalWidth
        maxWidth: totalWidth
        minHeight: totalHeight
        maxHeight: totalHeight
        layout: DockLayout {
        }
        
        Container {
            id: innerChartContainer
            background: chartBackground
            minWidth: totalWidth - (2 * borderWidth)
            maxWidth: totalWidth - (2 * borderWidth)
            minHeight: totalHeight - (2 * borderWidth)
            maxHeight: totalHeight - (2 * borderWidth)
            translationX: borderWidth
            translationY: borderWidth
            layout: DockLayout {
            }
            
            Container {
                id: valueContainer
                minWidth: chartWidth
                maxWidth: chartWidth
                minHeight: chartHeight
                maxHeight: chartHeight
                translationX: space
                translationY: space
                layout: DockLayout {
                }

            } // valueContainer
            
            
        } // innerChartContainer
        
        
    } // outerChartContainer
    
    function calculateValues(){
        // TODO check maxPoints
        var newValues = []
        for (var i = 0; i < originValues.length; i++){
            newValues[i] = Math.round(originValues[i] * chartHeight / originMax) 
        }
        values = newValues
        console.debug("transformed values: "+values[0] + ", " +values[1])
    }
    
    function createRectangles(){
        var max = values.length - 1
        for (var i = 0; i < max; i++){
            var rectangle = rectangleComponent.createObject()
            rectangle.originValue = originValues[i]
            rectangle.value = values[i]
            rectangle.nextValue = values[i+1]
            rectangle.minWidth = chartWidth // replaced later with diagonal
            rectangle.maxWidth = chartWidth // replaced later with diagonal
            rectangle.minHeight = lineWidth
            rectangle.maxHeight = lineWidth
            rectangle.background = lineColor
            var b = chartWidth / (values.length - 1)
            rectangle.translationY = chartHeight - values[i] 
            rectangle.translationX = i * b
            rectangle.rectangle_b = b
            valueContainer.add(rectangle)
        }
    }
    
    function createPoints(){
        for (var i = 0; i < values.length; i++){
            //
        }
    }
    
    onCreationCompleted: {
        //
    }
} // chart
