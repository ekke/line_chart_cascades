import bb.cascades 1.2

Container {
    signal tappedOnValue(string s)
    property string originValue: ""
    gestureHandlers: [
        TapHandler {
            onTapped: {
                tappedOnValue(originValue)
            }
        }
    ]
}
