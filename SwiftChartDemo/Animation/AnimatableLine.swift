//
//  AnimatableLineChart.swift
//  SwiftChartDemo
//
//  Created by Itsuki on 2025/04/12.
//


import SwiftUI
import Charts

private struct LineMarkData: Identifiable {
    var id: UUID = UUID()
    var value: Int
    var date: Date
}

extension LineMarkData {
    static var sampleData: [LineMarkData] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let data = (1...8).map { i in
            let value = Int.random(in: 1000...5000)
            let date = formatter.date(from: "2025-04-\(i)")!
            return LineMarkData(value: value, date: date)
        }
        
        return data
        
    }
}

struct LineMarkAnimationDemo: View {
    var body: some View {
        VStack(spacing: 64) {
            ColoredChartBackground()
            TransparentChartBackground()
        }
        .padding(.top, 32)
        .padding(.horizontal, 48)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(.gray.opacity(0.1))
    }
}


private struct ColoredChartBackground: View {
    
    @State private var dataList = LineMarkData.sampleData
 
    @State private var showData = false
    @State private var endFraction: CGFloat = 0.0
    
    private let minDate = LineMarkData.sampleData.min(by: { first, second in
        first.date < second.date
    })?.date ?? Date()
    
    private let maxDate = LineMarkData.sampleData.max(by: { first, second in
        first.date < second.date
    })?.date ?? Date()
    

    
    var body: some View {
        
        VStack(spacing: 24) {
            Text("With Colored Background")
                .fontWeight(.bold)

            Toggle(isOn: $showData, label: {
                Text("Show Data")
            })
            .tint(.blue)
            .padding(.bottom, 16)
                

            self.chart(v: {
                ForEach(dataList) { data in
                    LineMark(x: .value("", data.date), y: .value("", data.value))
                        .interpolationMethod(.catmullRom)
                }
            })
            // to show grid lines
            .chartOverlay(alignment: .center, content: { proxy in
                self.chart(v: {})
                    .mask(
                        Rectangle()
                            .fill(Color.white)
                            .padding(.leading, endFraction * proxy.plotSize.width)
                    )
                
            })

        }
        .onChange(of: showData, {
            if showData {
                withAnimation(.linear(duration: 2.0)) {
                    endFraction = 1.0
                }
            } else {
                endFraction = 0.0
            }
        })
    }
    
    
    
    private func chart<V: ChartContent>(@ChartContentBuilder v: () -> V) -> some View {
        Chart {
            v()
        }
        .frame(height: 180)
        .chartXScale(domain: minDate...maxDate)
        .chartYScale(domain: 0...6000)
        .chartYAxis {
            AxisMarks(preset: .aligned) { _ in
                AxisGridLine()
                AxisValueLabel(horizontalSpacing: 16)
            }
        }
        .chartBackground(content: { proxy in
            Color.white
                .frame(width: proxy.plotSize.width + 80, height: proxy.plotSize.height + 80)
        })
    }
}


struct TransparentChartBackground: View {
    
    @State private var dataList = LineMarkData.sampleData
 
    @State private var showData = false
    @State private var endFraction: CGFloat = 0.0
    
    private let minDate = LineMarkData.sampleData.min(by: { first, second in
        first.date < second.date
    })?.date ?? Date()
    
    private let maxDate = LineMarkData.sampleData.max(by: { first, second in
        first.date < second.date
    })?.date ?? Date()
    
    
    @State private var plotSize: CGSize = .zero

    
    var body: some View {
        
        VStack(spacing: 24) {
            Text("With Transparent Background")
                .fontWeight(.bold)


            Toggle(isOn: $showData, label: {
                Text("Show Data")
            })
            .tint(.blue)
            .padding(.bottom, 16)
                

            self.chart(v: {
                ForEach(dataList) { data in
                    LineMark(x: .value("", data.date), y: .value("", data.value))
                        .interpolationMethod(.catmullRom)
                }
            })
            .overlay(content: {
                GeometryReader { proxy in
                    DispatchQueue.main.async {
                        self.plotSize = proxy.size
                    }
                    return Color.clear
                }
            })
            .mask(
                Rectangle()
                    .fill(Color.white)
                    .padding(.trailing, (1-endFraction) * self.plotSize.width)
            )
            // to show grid lines
            .chartOverlay(alignment: .center, content: { _ in
                self.chart(v: {})                
            })

        }
        .onChange(of: showData, {
            if showData {
                withAnimation(.linear(duration: 2.0)) {
                    endFraction = 1.0
                }
            } else {
                endFraction = 0.0
            }
        })
    }

    
    private func chart<V: ChartContent>(@ChartContentBuilder v: () -> V) -> some View {
        Chart {
            v()
        }
        .frame(height: 180)
        .chartXScale(domain: minDate...maxDate)
        .chartYScale(domain: 0...6000)
        .chartYAxis {
            AxisMarks(preset: .aligned) { _ in
                AxisGridLine()
                AxisValueLabel(horizontalSpacing: 16)
            }
        }

    }
}

#Preview {
    LineMarkAnimationDemo()
}
