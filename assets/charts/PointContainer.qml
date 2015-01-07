import bb.cascades 1.2

Container {
    property string originValue: ""
    gestureHandlers: [
        TapHandler {
            onTapped: {
                console.debug(originValue)
            }
        }
    ]
}
