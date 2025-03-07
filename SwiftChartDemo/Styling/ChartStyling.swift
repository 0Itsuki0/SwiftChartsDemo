//
//  ChartStyling.swift
//  SwiftChartDemo
//
//  Created by Itsuki on 2025/02/23.
//

import SwiftUI
import Charts

struct ChartStylingDemo: View {
    private let pointDataList: [StylingData] = Array(0..<10).map({_ in StylingData()})
    private let barDataList: [StylingData] = [
        .init(height: 10, weight: 10, category: .a),
        .init(height: 30, weight: 10, category: .b),
        .init(height: 20, weight: 10, category: .c),
    ]
    
    private let lineDataList: [StylingData] = [
        .init(height: 30, weight: 0, category: .a),
        .init(height: 10, weight: 10, category: .a),
        .init(height: 20, weight: 20, category: .a),
        .init(height: 30, weight: 30, category: .a),
        
        .init(height: 10, weight: 0, category: .b),
        .init(height: 0, weight: 10, category: .b),
        .init(height: 30, weight: 20, category: .b),
        .init(height: 20, weight: 30, category: .b),
        
        .init(height: 40, weight: 0, category: .c),
        .init(height: 50, weight: 10, category: .c),
        .init(height: 10, weight: 20, category: .c),
        .init(height: 20, weight: 30, category: .c),
    ]
    
    
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 24)
            
            Text("chartBackground(alignment:content:)")
                
            Chart {
                ForEach(barDataList) { data in
                    BarMark(x: .value("", data.category.rawValue), y: .value("", data.height))
                        .foregroundStyle(
                            LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .top, endPoint: .bottom))
                }
            }
            .chartBackground(alignment: .center, content: { _ in
                Image(systemName: "heart")
                    .resizable()
                    .scaledToFill()
                    .padding(.all, 64)
            })
            .frame(height: 200)
            .padding(.horizontal, 48)
            
            Spacer()
                .frame(height: 48)

            
            Text("chartOverlay(alignment:content:)")
                
            Chart {
                ForEach(barDataList) { data in
                    BarMark(x: .value("", data.category.rawValue), y: .value("", data.height))
                        .foregroundStyle(
                            LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .top, endPoint: .bottom))
                }
            }
            .chartOverlay(alignment: .center, content: { _ in
                Image(systemName: "heart")
                    .resizable()
                    .scaledToFill()
                    .padding(.all, 64)
            })
            .frame(height: 200)
            .padding(.horizontal, 48)
            
            
            Spacer()
                .frame(height: 48)

            
            Text("chartForegroundStyleScale(_:)")
                
            Chart {
                ForEach(pointDataList) { data in
                    PointMark(x: .value("", data.weight), y: .value("", data.height))
                        .foregroundStyle(by: .value("", data.category.rawValue))
                }
            }
            .frame(height: 200)
            .padding(.horizontal, 48)
            // alternative way
//            .chartForegroundStyleScale([
//                StylingDataCategory.a.rawValue: Color.purple,
//                StylingDataCategory.b.rawValue: Color.green,
//                StylingDataCategory.c.rawValue: Color.yellow
//            ])
            .chartForegroundStyleScale(domain: StylingDataCategory.allCases.map { $0.rawValue }, range: StylingDataCategory.allCases.map { $0.color })

            Spacer()
                .frame(height: 48)
            
            
            Text("chartLineStyleScale(_:)")
                
            Chart {
                ForEach(lineDataList) { data in
                    LineMark(x: .value("", data.weight), y: .value("", data.height))
                        .lineStyle(by: .value("", data.category.rawValue))
                }
            }
            .frame(height: 200)
            .padding(.horizontal, 48)
            .chartLineStyleScale([
                StylingDataCategory.a.rawValue: StrokeStyle(lineWidth: 1),
                StylingDataCategory.b.rawValue: StrokeStyle(lineWidth: 5, dash: [5]),
                StylingDataCategory.c.rawValue: StrokeStyle(lineWidth: 2)
            ])
            Spacer()
                .frame(height: 48)
            
 
            Text("chartSymbolSizeScale(_:)")

            Chart {
                ForEach(pointDataList) { data in
                    PointMark(x: .value("", data.weight), y: .value("", data.height))
                        .symbolSize(by: .value("", data.category.rawValue))
                }
            }
            .frame(height: 200)
            .padding(.horizontal, 48)
            .chartSymbolSizeScale([
                StylingDataCategory.a.rawValue: 24,
                StylingDataCategory.b.rawValue: 48,
                StylingDataCategory.c.rawValue: 96

            ])
            
            
            Text("chartSymbolScale(_:)")

            Chart {
                ForEach(pointDataList) { data in
                    PointMark(x: .value("", data.weight), y: .value("", data.height))
                        .symbol(by: .value("", data.category.rawValue))
                }
            }
            .frame(height: 200)
            .padding(.horizontal, 48)
            .chartSymbolScale([
                StylingDataCategory.a.rawValue: .triangle,
                StylingDataCategory.b.rawValue: .asterisk,
                StylingDataCategory.c.rawValue: .circle.strokeBorder(lineWidth: 2)
            ])

            Spacer()
                .frame(height: 48)




            Text("chartPlotStyle(content:)")
                
            Chart {
                ForEach(barDataList) { data in
                    BarMark(x: .value("", data.category.rawValue), y: .value("", data.height))
                        .foregroundStyle(
                            LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .top, endPoint: .bottom))
                }
            }
            .chartPlotStyle(content: { content in
                content
                    .scaleEffect(0.8)
                    .background(.gray.opacity(0.2))

            })
            .frame(height: 200)
            .padding(.horizontal, 48)



        }
    }
}

#Preview {
    ChartStylingDemo()
}
