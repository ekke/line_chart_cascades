import bb.cascades 1.2

Container {
    id: chart
    signal selectedValue(string originValue)
    
    property variant chartBackground: Color.LightGray
    property variant borderColor: Color.DarkGray
    property variant lineColor: Color.DarkBlue
    property variant pointColor: Color.Blue
    
    property int totalWidth: 600
    property int totalHeight: 200
    property int borderWidth: 2
    property int space: 10
    
    property int chartWidth: totalWidth - (2 * borderWidth) - (2 * space)
    property int chartHeight: totalHeight - (2 * borderWidth) - (2 * space)
    property int lineWidth: 2
    property int pointWidth: 16
    property int minDistance: 40
    property int maxPoints: chartWidth / minDistance
    
    property variant originValues: []
    property double originMax: -1
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
        },
        ComponentDefinition {
            id: pointComponent
            source: "PointContainer.qml"
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
            newValues[i] = Math.round(originValues[i] * 1000 * chartHeight / (originMax * 1000))
        }
        values = newValues
        console.debug("transformed values: "+values[0] + ", " +values[1])
    }
    
    function createRectangles(){
        var max = values.length - 1
        for (var i = 0; i < max; i++){
            var rectangle = rectangleComponent.createObject()
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
    
    function onTappedOnValue(originValue){
        selectedValue(originValue)
    }
    
    function createPoints(){
        for (var i = 0; i < values.length; i++){
            var linePoint = pointComponent.createObject()
            linePoint.originValue = originValues[i]
            linePoint.minWidth = pointWidth
            linePoint.maxWidth = pointWidth
            linePoint.minHeight = pointWidth
            linePoint.maxHeight = pointWidth
            linePoint.background = pointColor
            var b = chartWidth / (values.length - 1)
            linePoint.translationY = chartHeight - values[i] - (pointWidth / 2) + space
            linePoint.translationX = (i * b) - (pointWidth / 2) + space
            linePoint.tappedOnValue.connect(onTappedOnValue)
            innerChartContainer.add(linePoint)
        }
    }
    
    onCreationCompleted: {
        //
    }
} // chart
