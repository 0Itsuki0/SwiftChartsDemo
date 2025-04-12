//
//  AnimatableBar.swift
//  SwiftChartDemo
//
//  Created by Itsuki on 2025/04/12.
//


import SwiftUI
import Charts

private struct BarMarkData: Identifiable {
    var id: UUID = UUID()
    var _value: Int
    var date: Date
    
    var animate: Bool = false
    
    var value: Int {
        return self.animate ? self._value : 0
    }
}

extension BarMarkData {
    static var sampleData: [BarMarkData] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let data = (1...8).map { i in
            let value = Int.random(in: -5000...5000)
            let date = formatter.date(from: "2025-04-\(i)")!
            return BarMarkData(_value: value, date: date)
        }
        
        return data
        
    }
}

struct BarMarkAnimationDemo: View {
    
    @State private var dataList = BarMarkData.sampleData
 
    @State private var showData = false
        
    var body: some View {
        
        VStack(spacing: 24) {

            Toggle(isOn: $showData, label: {
                Text("Show Data")
            })
            .tint(.blue)
            .padding(.bottom, 16)
                
            Chart {
                ForEach(dataList) { data in
                    BarMark(
                        x: .value("", data.date),
                        y: .value("", data.value),
                        width: .fixed(16)
                    )
                }
            }
            .frame(height: 200)
            .chartYScale(domain: -6000...6000)
            .chartYAxis {
                AxisMarks(preset: .aligned) { _ in
                    AxisGridLine()
                    AxisValueLabel(horizontalSpacing: 16)
                }
            }
        }
        .padding(.top, 32)
        .padding(.horizontal, 48)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(.gray.opacity(0.1))
        .onChange(of: showData, {
            if showData {
                for i in 0..<dataList.count {
                    withAnimation(.linear.delay(Double(i) * 0.05)) {
                        dataList[i].animate = true
                    }
                }

                
            } else {
                for i in 0..<dataList.count {
                    dataList[i].animate = false
                }
            }
        })

    }
    
    
}


#Preview {
    BarMarkAnimationDemo()
}
