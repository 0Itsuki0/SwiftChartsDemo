//
//  Styling.swift
//  SwiftChartDemo
//
//  Created by Itsuki on 2025/02/23.
//

import SwiftUI
import Charts

struct MarkStylingDemo: View {
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
            
//            Text("foregroundStyle(_:)")
//                
//            Chart {
//                ForEach(barDataList) { data in
//                    BarMark(x: .value("", data.category.rawValue), y: .value("", data.height))
//                        .foregroundStyle(
//                            LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .top, endPoint: .bottom))
//                }
//            }
//            .frame(height: 200)
//            .padding(.horizontal, 48)
//            
//            Text("alignsMarkStylesWithPlotArea(_:)")
//                
//            Chart {
//                ForEach(barDataList) { data in
//                    BarMark(x: .value("", data.category.rawValue), y: .value("", data.height))
//                        .foregroundStyle(
//                            LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .top, endPoint: .bottom))
//                        .alignsMarkStylesWithPlotArea()
//                }
//            }
//            .frame(height: 200)
//            .padding(.horizontal, 48)
//
//            
//            Spacer()
//                .frame(height: 48)
//            
//            Text("foregroundStyle(by:)")
//                
//            Chart {
//                ForEach(pointDataList) { data in
//                    
//                    PointMark(x: .value("", data.weight), y: .value("", data.height))
//                        .foregroundStyle(by: .value("", data.category.rawValue))
//                }
//            }
//            .frame(height: 200)
//            .padding(.horizontal, 48)
//            
//            Spacer()
//                .frame(height: 48)
//            
//            Text("symbol(_:)")
//            Chart {
//                ForEach(pointDataList) { data in
//                    PointMark(x: .value("", data.weight), y: .value("", data.height))
//                        .symbol(.circle.strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [2])))
//                }
//            }
//            .frame(height: 200)
//            .padding(.horizontal, 48)
//            
//            Spacer()
//                .frame(height: 48)
//            
//            Text("symbol(symbol:)")
//            Chart {
//                ForEach(pointDataList) { data in
//                    PointMark(x: .value("", data.weight), y: .value("", data.height))
//                        .symbol(symbol: {
//                            Image(systemName: "heart.fill")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 16)
//                                .foregroundStyle(.red)
//                        })
//                }
//            }
//            .frame(height: 200)
//            .padding(.horizontal, 48)
//            
//            Spacer()
//                .frame(height: 48)
//
//            
//            Text("symbol(by:)")
//                
//            Chart {
//                ForEach(pointDataList) { data in
//                    PointMark(x: .value("", data.weight), y: .value("", data.height))
//                        .symbol(by: .value("", data.category.rawValue))
//                }
//            }
//            .frame(height: 200)
//            .padding(.horizontal, 48)
//            
//            Spacer()
//                .frame(height: 48)
//            
//            Text("symbolSize(by:)")
//                
//            Chart {
//                ForEach(pointDataList) { data in
//                    PointMark(x: .value("", data.weight), y: .value("", data.height))
//                        .symbolSize(by: .value("", data.category.rawValue))
//                }
//            }
//            .frame(height: 200)
//            .padding(.horizontal, 48)
//
//            
//            Spacer()
//                .frame(height: 48)
//            
//            Text("lineStyle(by:)")
//                
//            Chart {
//                ForEach(lineDataList) { data in
//                    LineMark(x: .value("", data.weight), y: .value("", data.height))
//                        .lineStyle(by: .value("", data.category.rawValue))
//                }
//            }
//            .frame(height: 200)
//            .padding(.horizontal, 48)
//            
//            Spacer()
//                .frame(height: 48)
//            
//            Text("interpolationMethod(_:)")
//                
//            Chart {
//                ForEach(lineDataList.filter({$0.category == .b})) { data in
//                        LineMark(x: .value("", data.weight), y: .value("", data.height))
//                            .interpolationMethod(.stepCenter)
//                }
//            }
//            .frame(height: 200)
//            .padding(.horizontal, 48)
//            
//            Spacer()
//                .frame(height: 48)
//
//            
//            
//            Text("cornerRadius(by:)")
//                
//            Chart {
//                ForEach(barDataList) { data in
//                    BarMark(x: .value("", data.category.rawValue), y: .value("", data.height))
//                        .cornerRadius(16, style: .continuous)
//                }
//            }
//            .frame(height: 200)
//            .padding(.horizontal, 48)
//            
//            
//            Spacer()
//                .frame(height: 48)
//            
//            Text("opacity(_:)")
//                
//            Chart {
//                ForEach(barDataList) { data in
//                    BarMark(x: .value("", data.category.rawValue), y: .value("", data.height))
//                        .opacity(data.category == .a ? 1 : 0.2)
//                }
//            }
//            .frame(height: 200)
//            .padding(.horizontal, 48)
//
//           
//            
//            
//            Spacer()
//                .frame(height: 48)
//
//            
//            Text("mask(content:)")
//            Chart {
//                ForEach(barDataList) { data in
//                    BarMark(x: .value("", data.category.rawValue), y: .value("", data.height))
//                        .mask(content: {
//                            if data.category == .a {
//                                RectangleMark()
//                                    .foregroundStyle(Color.black.opacity(0.5))
//                                RectangleMark(xStart: 30, xEnd: 70)
//                            } else {
//                                RectangleMark()
//                                    .foregroundStyle(Color.black.opacity(0.5))
//                            }
//                        })
//                }
//            }
//            .frame(height: 200)
//            .padding(.horizontal, 48)
            
            Spacer()
                .frame(height: 48)

            
            Text("clipShape(_:style:)")
            Chart {
                ForEach(barDataList) { data in
                    BarMark(x: .value("", data.category.rawValue), y: .value("", data.height))
                        .clipShape(Capsule())
                }
            }
            .frame(height: 200)
            .padding(.horizontal, 48)

            
            Spacer()
                .frame(height: 48)
            
            
            Text("blur(radius:)")
            Chart {
                ForEach(barDataList) { data in
                    BarMark(x: .value("", data.category.rawValue), y: .value("", data.height))
                        .blur(radius: data.category == .b ? 0 : 3)
                }
            }
            .frame(height: 200)
            .padding(.horizontal, 48)
            
            
            
            Spacer()
                .frame(height: 48)


            Text("shadow(color:radius:x:y:)")

                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .padding(.horizontal, 16)
            Chart {
                ForEach(barDataList) { data in
                    BarMark(x: .value("", data.category.rawValue), y: .value("", data.height))
                        .shadow(color: .red, radius: 5, x: 0, y: 3)
                }
            }
            .frame(height: 200)
            .padding(.horizontal, 48)

            
            
            
            Spacer()
                .frame(height: 48)

            Text("offset(_:)")
                
            Chart {
                ForEach(barDataList) { data in
                    BarMark(x: .value("", data.category.rawValue), y: .value("", data.height))
                        .offset(CGSize(width: 0, height: -10))
                }
            }
            .frame(height: 200)
            .padding(.horizontal, 48)

            
            Spacer()
                .frame(height: 48)

            
            Text("annotation(position:alignment:spacing:content:)")
                
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .padding(.horizontal, 16)
            Chart {
                ForEach(barDataList) { data in
                    BarMark(x: .value("", data.category.rawValue), y: .value("", data.height))
                        .annotation(position: .top, content: {
                            Text("\(String(format: "%.1f", data.height))")
                        })
                }
            }
            .frame(height: 200)
            .padding(.horizontal, 48)
            
            
            Spacer()
                .frame(height: 48)
            
            
            Text("compositingLayer(style:)")
                
            Chart {
                ForEach(barDataList) { data in
                    BarMark(x: .value("", data.category.rawValue), y: .value("", data.height))
                        .compositingLayer(style: { view in
                            if data.category == .a {
                                AnyView(
                                view
                                .foregroundStyle(.red)
                                    .opacity(0.3)
                                    .overlay(content: {
                                        Image(systemName: "heart")
                                            .offset(y: 10)
                                    })
                                )

                            } else {
                                AnyView(view)
                            }
                        })
                }
            }
            .frame(height: 200)
            .padding(.horizontal, 48)


        }
    }
}


#Preview {
    MarkStylingDemo()
}
