//
//  InteractiveChartDemo.swift
//  SwiftChartDemo
//
//  Created by Itsuki on 2025/02/24.
//

import SwiftUI
import Charts


struct BasicInteractiveChartDemo: View {
    static private let dateFormatter = ISO8601DateFormatter()

    private let seriesDataList: [InteractiveLineData] = [
        .init(value: -5, date: Self.dateFormatter.date(from: "2010-01-01T00:00:00+0000")!),
        .init(value: 23, date: Self.dateFormatter.date(from: "2011-01-01T00:00:00+0000")!),
        .init(value: 3, date: Self.dateFormatter.date(from: "2012-01-01T00:00:00+0000")!),
        .init(value: 6, date: Self.dateFormatter.date(from: "2013-01-01T00:00:00+0000")!),
        .init(value: 48, date: Self.dateFormatter.date(from: "2014-01-01T00:00:00+0000")!),
        .init(value: 32, date: Self.dateFormatter.date(from: "2015-01-01T00:00:00+0000")!),
        .init(value: 10, date: Self.dateFormatter.date(from: "2016-01-01T00:00:00+0000")!),
        .init(value: 14, date: Self.dateFormatter.date(from: "2017-01-01T00:00:00+0000")!),
        .init(value: -1, date: Self.dateFormatter.date(from: "2018-01-01T00:00:00+0000")!),
        .init(value: 6, date: Self.dateFormatter.date(from: "2019-01-01T00:00:00+0000")!),
    ]
    
    private let pieDataList: [InteractivePieData] = [
        .init(name: "Apple", value: 100),
        .init(name: "Google", value: 10),
        .init(name: "Microsoft", value: 15),
        .init(name: "Amazon", value: 50),
    ]
    
    // single value selection
    @State private var selectedDate: Date?
    @State private var selectedValue: Double?
    @State private var selectedAccumulativeValue: Double?
    private var selectedPie: InteractivePieData? {
        guard let selectedAccumulativeValue else { return nil }
        var accumulatedDataValue: Double = 0
        for pie in pieDataList {
            accumulatedDataValue += pie.value
            if selectedAccumulativeValue < accumulatedDataValue {
                return pie
            }
        }
        return nil
    }
    
    // range selection
    @State private var selectedDateRange: ClosedRange<Date>?
    @State private var selectedValueRange: ClosedRange<Double>?
    

    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 24)
            
            Text("Basic - Single Value")
                

            Chart {
                ForEach(seriesDataList) { data in
                    LineMark(x: .value("", data.date, unit: .year), y: .value("", data.value))
                        .interpolationMethod(.catmullRom)
                        .symbol(.circle)
                }
                
                if let selectedDate, let selectedValue {
                    PointMark(x: .value("", selectedDate, unit: .year), y: .value("", selectedValue))
                        .symbol(.asterisk)
                        .symbolSize(48)
                        .annotation(
                            position: .topLeading,
                            spacing: 0,
                            overflowResolution: .init(x: .fit(to: .chart), y: .disabled),
                            content: {
                                Text("Date: \(Self.dateFormatter.string(from: selectedDate))\nValue: \(String(format: "%.1f", selectedValue))")
                                    .foregroundStyle(.white)
                                    .padding(8)
                                    .background(RoundedRectangle(cornerRadius: 4).fill(.gray))
                        })
                }
            }
            .chartYScale(domain: -10...50)
            .chartXAxis(content: {
                AxisMarks(values: .automatic(desiredCount: 5))
            })
            .chartXSelection(value: $selectedDate)
            .chartYSelection(value: $selectedValue)
            .padding(.horizontal, 48)
            .frame(height: 240)

            Spacer()
                .frame(height: 36)

            Chart {
                ForEach(pieDataList) { data in
                    SectorMark(
                        angle: .value("", data.value),
                        innerRadius: .ratio(0.6)
                    )
                    .foregroundStyle(by: .value("", data.name))
                }
            }
            .chartAngleSelection(value: $selectedAccumulativeValue)
            .chartBackground(alignment: .center, content: { chartProxy in
                GeometryReader { geometry in
                    if let plotFrame = chartProxy.plotFrame, let selectedPie {
                        let frame = geometry[plotFrame]
                        VStack {
                            Text("\(selectedPie.name)\n\(String(format: "%.1f", selectedPie.value))")
                        }
                        .position(x: frame.midX, y: frame.midY)
                    }
                }

            })
            .padding(.horizontal, 32)
            .frame(height: 240)
            
            
            Spacer()
                .frame(height: 48)
            
            Text("Basic - Range")
                
            Text("With two finger tap/drag")
                .font(.caption)
                .foregroundStyle(.secondary)

            Chart {
                ForEach(seriesDataList) { data in
                    LineMark(x: .value("", data.date, unit: .year), y: .value("", data.value))
                        .interpolationMethod(.catmullRom)
                        .symbol(.circle)
                }
                
                if let selectedDateRange {
                    RectangleMark(
                        xStart: .value("", selectedDateRange.lowerBound),
                        xEnd: .value("", selectedDateRange.upperBound)
                    )
                    .opacity(0.2)
                }
                
                if let selectedValueRange {
                    RectangleMark(
                        yStart: .value("", selectedValueRange.lowerBound),
                        yEnd: .value("", selectedValueRange.upperBound)
                    )
                    .opacity(0.2)
                }
            }
            .chartYScale(domain: -10...50)
            .chartXAxis(content: {
                AxisMarks(values: .automatic(desiredCount: 5))
            })
            .chartXSelection(range: $selectedDateRange)
            .chartYSelection(range: $selectedValueRange)
            .padding(.horizontal, 48)
            .frame(height: 240)
            
            
        }

    }
    
}

#Preview {
    BasicInteractiveChartDemo()
}


