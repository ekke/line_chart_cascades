import bb.cascades 1.2

Container {
    id: pointContainer
    property string name: "pointContainer"
    property int index: -1
    signal tappedOnValue(string s, int n)
    property string originValue: ""
    gestureHandlers: [
        TapHandler {
            onTapped: {
                tappedOnValue(originValue, index)
            }
        }
    ]
}
