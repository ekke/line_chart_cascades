/*
 * Copyright (c) 2011-2014 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2
import "charts"

NavigationPane {
    id: rootPane
    
    
    Page {
        id: rootPage
        property string selectedValue: ""
        
        titleBar: TitleBar {
            id: titleBar
            title: "LineChart Demo"
        }
        
        actions: [
            ActionItem {
                title: "Create Charts"
                imageSource: "asset:///images/ic_diagnostics.png"
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    rootPage.createChart()
                }
            }
        ]
        
        attachedObjects: [
            ComponentDefinition {
                id: chartComponentDefinition
                source: "charts/ChartContainer.qml"
            },
            ComponentDefinition {
                id: labelComponentDefinition
                Container {
                    id: labelContainer
                    topPadding: 40
                    bottomPadding: 40
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    Label {
                        text: qsTr("Selected Value: ")
                    }
                    Label {
                        text: rootPage.selectedValue
                    }
                }
            }
        ]
        ScrollView {
            id: scrollView
            Container {
                id: outerContainer
                topPadding: 40
                leftPadding: 40
                layout: StackLayout {
                }
                
            
            
            } // outerContainer
        }
        
        
        function onSelectedValue(originValue){
            rootPage.selectedValue = originValue
        }
        
        function createChart(){
            
            rootPage.selectedValue = ""
            outerContainer.removeAll()
            
            var chartContainer = chartComponentDefinition.createObject()
            
            chartContainer.chartBackground = Color.LightGray
            chartContainer.borderColor = Color.DarkGray
            chartContainer.lineColor = Color.DarkBlue
            chartContainer.pointColor = Color.Blue
            chartContainer.pointSelectionColor = Color.White
            chartContainer.totalWidth = 600
            chartContainer.totalHeight = 200
            chartContainer.borderWidth = 2
            chartContainer.space = 16
            chartContainer.lineWidth = 2
            chartContainer.pointWidth = 16
            chartContainer.minDistance = 40
            chartContainer.originValues = [15, 40, 70, 30, 30, 150, 100, 110, 15]
            chartContainer.originMax = 150
            chartContainer.selectedValue.connect(onSelectedValue)
            outerContainer.add(chartContainer)
            
            //
            chartContainer = chartComponentDefinition.createObject()
            chartContainer.topPadding = 40
            
            chartContainer.chartBackground = Color.Yellow
            chartContainer.borderColor = Color.DarkGreen
            chartContainer.lineColor = Color.DarkGreen
            chartContainer.pointColor = Color.DarkGreen
            chartContainer.pointSelectionColor = Color.Magenta
            chartContainer.totalWidth = 600
            chartContainer.totalHeight = 200
            chartContainer.borderWidth = 6
            chartContainer.space = 16
            chartContainer.lineWidth = 2
            chartContainer.pointWidth = 16
            chartContainer.minDistance = 40
            chartContainer.originValues = [0, 150]
            chartContainer.originMax = 150
            chartContainer.selectedValue.connect(onSelectedValue)
            outerContainer.add(chartContainer)
            
            //
            chartContainer = chartComponentDefinition.createObject()
            chartContainer.topPadding = 40
            
            chartContainer.chartBackground = Color.LightGray
            chartContainer.borderColor = Color.DarkGray
            chartContainer.lineColor = Color.Red
            chartContainer.pointColor = Color.Magenta
            chartContainer.pointSelectionColor = Color.White
            chartContainer.totalWidth = 600
            chartContainer.totalHeight = 200
            chartContainer.borderWidth = 2
            chartContainer.space = 16
            chartContainer.lineWidth = 2
            chartContainer.pointWidth = 16
            chartContainer.minDistance = 40
            // problem chartContainer.originValues = [1.50, 2.80, 0.75, 3.123, 1.75]
            // chartContainer.originMax = 3.123
            chartContainer.originValues = [1.50, 2.00, 1.10, 3.123, 1.75]
            chartContainer.originMax = 4
            chartContainer.selectedValue.connect(onSelectedValue)
            outerContainer.add(chartContainer)
            
            //
            outerContainer.add(labelComponentDefinition.createObject())
        }
        
        onCreationCompleted: {
            //
        }
    } // rootPage
    
    
    onCreationCompleted: {
        //
    }
} // rootPane
