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
        
        actions: [
            ActionItem {
                title: "Create Chart"
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
            }
        ]
        
        Container {
            id: outerContainer
            topPadding: 40
            leftPadding: 40
            layout: DockLayout {
            }
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            
            
        } // outerContainer
        
        
        function createChart(){
            var chartContainer = chartComponentDefinition.createObject()
            
            chartContainer.chartBackground = Color.Cyan
            chartContainer.borderColor = Color.LightGray
            chartContainer.lineColor = Color.Blue
            chartContainer.totalWidth = 624 // 624
            chartContainer.totalHeight = 224 // 224
            chartContainer.borderWidth = 2
            chartContainer.space = 10 // 10
            chartContainer.lineWidth = 2
            chartContainer.minDistance = 20
            //chartContainer.originValues = [110, 15, 40, 70, 30, 150, 100]
            chartContainer.originValues = [15, 40, 70, 30, 150, 100, 110, 15]
            //chartContainer.originValues = [70, 30, 150, 100]
            chartContainer.originMax = 150
            
            outerContainer.add(chartContainer)
        }
        
        onCreationCompleted: {
            //
        }
    } // rootPage
    
    
    onCreationCompleted: {
        //
    }
} // rootPane
