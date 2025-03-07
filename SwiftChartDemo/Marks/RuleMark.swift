//
//  RuleMark.swift
//  SwiftChartDemo
//
//  Created by Itsuki on 2025/02/22.
//

import SwiftUI
import Charts

struct RuleMarkData: Identifiable {
    let id: UUID = UUID()
    let year: Int
    let value: Double
}

struct RuleMarkRangeData: Identifiable {
    let id: UUID = UUID()
    let type: String
    let start: Double
    let end: Double
}

struct RuleMarkDemo: View {
    private let dataList: [RuleMarkData] = [
        .init(year: 1990, value: 100),
        .init(year: 1991, value: 300),
        .init(year: 1992, value: 100),
        .init(year: 1993, value: 400),
        .init(year: 1994, value: 200),
    ]
    
    private let rangeDataList: [RuleMarkRangeData] = [
        .init(type: "a", start: 0, end: 100),
        .init(type: "a", start: 180, end: 300),
        .init(type: "a", start: 320, end: 500),
        
        .init(type: "b", start: -100, end: 50),
        .init(type: "b", start: 100, end: 120),
        .init(type: "b", start: 200, end: 300),

    ]
    
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 24)
            
            Text("For Annotation")
                
            Chart {
                ForEach(dataList) {data in
                    BarMark(x: .value("", data.year), y: .value("", data.value))
                }
                RuleMark(y: .value("", (dataList.map(\.self.value).reduce(0, +))/Double(dataList.count)))
                    .foregroundStyle(.red)
            }
            .chartXScale(domain: 1989...1995)
            .padding(.horizontal, 48)
            .frame(height: 200)
            
            Spacer()
                .frame(height: 48)

            
            Text("For Range")
                
            Chart {
                ForEach(rangeDataList) {data in
                    RuleMark(xStart: .value("", data.start), xEnd: .value("", data.end), y: .value("", data.type))
                }
            }
            .padding(.horizontal, 48)
            .frame(height: 120)
            
        }
    }
}


#Preview {
    RuleMarkDemo()
}
