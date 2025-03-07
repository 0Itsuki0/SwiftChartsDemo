//
//  ContentView.swift
//  SwiftChartDemo
//
//  Created by Itsuki on 2025/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Section {
                NavigationLink(destination: {
                    AreaMarkDemo()
                        .navigationTitle("Area Mark")
                }, label: {
                    Text("Area Mark")
                })
                NavigationLink(destination: {
                    BarMarkDemo()
                        .navigationTitle("Bar Mark")
                }, label: {
                    Text("Bar Mark")
                })
                NavigationLink(destination: {
                    LineMarkDemo()
                        .navigationTitle("Line Mark")
                }, label: {
                    Text("Line Mark")
                })
                NavigationLink(destination: {
                    PointMarkDemo()
                        .navigationTitle("Point Mark")
                }, label: {
                    Text("Point Mark")
                })
                NavigationLink(destination: {
                    RectangleMarkDemo()
                        .navigationTitle("Rectangle Mark")
                }, label: {
                    Text("Rectangle Mark")
                })
                NavigationLink(destination: {
                    RuleMarkDemo()
                        .navigationTitle("Rule Mark")
                }, label: {
                    Text("Rule Mark")
                })
                NavigationLink(destination: {
                    SectorMarkDemo()
                        .navigationTitle("Sector Mark")
                }, label: {
                    Text("Sector Mark")
                })

            } header: {
                Text("Marks")
            }
            
            Section {
                NavigationLink(destination: {
                    ChartStylingDemo()
                        .navigationTitle("Chart Styling")
                }, label: {
                    Text("Chart Styling")
                })
                NavigationLink(destination: {
                    MarkStylingDemo()
                        .navigationTitle("Mark Styling")
                }, label: {
                    Text("Mark Styling")
                })
                NavigationLink(destination: {
                    AxisCustomizeDemo()
                        .navigationTitle("Axes Customize")
                }, label: {
                    Text("Axes Customize")
                })


            } header: {
                Text("Styling & Customization")
            }
            
            Section {
                NavigationLink(destination: {
                    BasicInteractiveChartDemo()
                        .navigationTitle("Basic")
                }, label: {
                    Text("Basic")
                })

                NavigationLink(destination: {
                    CustomInteractiveChartDemo()
                        .navigationTitle("Customize with ChartGesture")
                }, label: {
                    Text("Customize with ChartGesture")
                })

            } header: {
                Text("Interactive Chart")
            }
  
            
            
        }
        .navigationTitle("Swift Charts Demo")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
