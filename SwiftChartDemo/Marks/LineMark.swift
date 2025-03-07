//
//  Line.swift
//  SwiftChartDemo
//
//  Created by Itsuki on 2025/02/22.
//

import SwiftUI
import Charts

enum LineMarkDataCategory: String {
    case a
    case b
}

struct LineMarkData: Identifiable {
    var id: UUID = UUID()
    var value: Double
    var date: Date
    var category: LineMarkDataCategory
}

struct LineMarkDemo: View {
    static private let dateFormatter = ISO8601DateFormatter()

    private let seriesDataList: [LineMarkData] = [
        .init(value: 5, date: Self.dateFormatter.date(from: "2016-01-01T00:00:00+0000")!, category: .a),
        .init(value: 14, date: Self.dateFormatter.date(from: "2017-01-01T00:00:00+0000")!, category: .a),
        .init(value: -1, date: Self.dateFormatter.date(from: "2018-01-01T00:00:00+0000")!, category: .a),
        .init(value: 6, date: Self.dateFormatter.date(from: "2019-01-01T00:00:00+0000")!, category: .a),
        
        .init(value: 3, date: Self.dateFormatter.date(from: "2016-01-01T00:00:00+0000")!, category: .b),
        .init(value: 11, date: Self.dateFormatter.date(from: "2017-01-01T00:00:00+0000")!, category: .b),
        .init(value: 8, date: Self.dateFormatter.date(from: "2018-01-01T00:00:00+0000")!, category: .b),
        .init(value: -7, date: Self.dateFormatter.date(from: "2019-01-01T00:00:00+0000")!, category: .b),
    ]
    
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 24)
            
            Text("Basic")
            Chart {
                ForEach(seriesDataList[0..<3]) { data in
                    LineMark(x: .value("", data.date), y: .value("", data.value))
                }
            }
            .padding(.all, 48)
            .frame(height: 320)
            
            Text("By Series")
            Chart {
                ForEach(seriesDataList) { data in
                    LineMark(x: .value("", data.date), y: .value("", data.value), series: .value("", data.category.rawValue))
                        .foregroundStyle(by: .value("", data.category.rawValue))
                }
            }
            .padding(.all, 48)
            .frame(height: 320)
        }

    }
}


#Preview {
    LineMarkDemo()
}
