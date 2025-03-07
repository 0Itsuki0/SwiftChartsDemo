//
//  AxisCustomize.swift
//  SwiftChartDemo
//
//  Created by Itsuki on 2025/02/23.
//

import SwiftUI
import Charts

struct AxisCustomizeData: Identifiable {
    let id: UUID = UUID()
    let year: Int
    let value: Double
    let category: String
}


struct AxisCustomizeDemo: View {
    
    private let dataList: [AxisCustomizeData] = [
        .init(year: 1990, value: 420, category: "a"),
        .init(year: 1991, value: 300, category: "a"),
        .init(year: 1992, value: 250, category: "a"),
        .init(year: 1993, value: 400, category: "a"),
        .init(year: 1994, value: 200, category: "a"),
        
        .init(year: 1990, value: 120, category: "b"),
        .init(year: 1991, value: 90, category: "b"),
        .init(year: 1992, value: 200, category: "b"),
        .init(year: 1993, value: 20, category: "b"),
        .init(year: 1994, value: 100, category: "b"),

    ]
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 24)
            
            Text("Data")
            
            Chart {
                ForEach(dataList) { data in
                    BarMark(x: .value("", data.year), y: .value("", data.value))
                        .foregroundStyle(by: .value("", data.category))
                }
            }
            .chartLegend(.visible)
            .chartLegend(position: .top, alignment: .trailing, spacing: 10)
//            .chartLegend(content: {
//                Text("Custom Legend")
//                    .font(.caption)
//                    .fontWeight(.bold)
//            })
            .chartYAxis(.visible)
            .chartXAxis(.visible)
            .chartXAxisStyle(content: { axis in
                axis
                    .opacity(0.7)
            })
            .chartXScale(domain: 1989...1995)
            .chartYScale(domain: 0...600)
            .chartXAxis(content: {
                AxisMarks(values: .automatic(desiredCount: 5)) { value in
                    AxisValueLabel {
                        if let int = value.as(Int.self) {
                            Text("\(int)")
                                .rotationEffect(.degrees(30))
                                .offset(y: 8)
                                .foregroundStyle(int == 1992 ? .red : .gray)
                        }
                    }
                }
            })
            .chartYAxis(content: {
                AxisMarks(preset: .aligned, position: .leading, values: [0, 200, 400, 600]) {
                    AxisGridLine(stroke: .init(lineWidth: 2))
                    AxisTick(centered: true, length: 5, stroke: .init(lineWidth: 5))
                        .foregroundStyle(.green)
                    AxisValueLabel()
                }
                AxisMarks(format: Decimal.FormatStyle.Percent.percent.scale(1), position: .trailing)
                

                AxisMarks(
                    position: .leading, values: [100, 300, 500]
                ) { value in
                    if let number = value.as(Double.self) {
                        if number == 100 {
                            AxisGridLine(stroke: .init(lineWidth: 2, dash: [10]))
                                .foregroundStyle(.red)
                            AxisValueLabel {
                                VStack(alignment: .leading) {
                                    Text("This is 100!")
                                        .fontWeight(.bold)
                                }
                                .foregroundStyle(.red)
                            }

                        } else {
                            AxisGridLine()
                            AxisTick(centered: true, length: 10, stroke: .init(lineWidth: 5))
                        }
                    }
                    
                }

            })
            .padding(.horizontal, 32)
            .frame(height: 200)

        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    AxisCustomizeDemo()
}
