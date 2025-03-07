//
//  AreaMark.swift
//  SwiftChartDemo
//
//  Created by Itsuki on 2025/02/22.
//

import SwiftUI
import Charts

enum AreaMarkDataCategory: String {
    case a
    case b
    case c
}


struct AreaMarkData: Identifiable {
    var id: UUID = UUID()
    var value: Double
    var minutes: Int
    var category: AreaMarkDataCategory
}

struct AreaMarkDemo: View {

    private let dataList: [AreaMarkData] = [
        .init(value: 1, minutes: 0, category: .a),
        .init(value: 10, minutes: 0, category: .b),
        .init(value: -1, minutes: 0, category: .c),
        
        .init(value: 15, minutes: 15, category: .a),
        .init(value: 60, minutes: 15, category: .b),
        .init(value: 30, minutes: 15, category: .c),
        
        .init(value: 20, minutes: 30, category: .a),
        .init(value: 30, minutes: 30, category: .b),
        .init(value: 10, minutes: 30, category: .c),
        
        .init(value: 40, minutes: 60, category: .a),
        .init(value: 20, minutes: 60, category: .b),
        .init(value: 30, minutes: 60, category: .c),

    ]


    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 24)
            
            Text("Basic")
            Chart {
                ForEach(dataList.filter({$0.category == .a})) { data in
                    AreaMark(x: .value("", data.minutes), y: .value("", data.value))
                }
            }
            .padding(.horizontal, 48)
            .frame(height: 200)
                        
            Text("Stacked")
            Chart {
                ForEach(dataList) { data in
                    AreaMark(x: .value("", data.minutes), y: .value("", data.value), stacking: .standard)
                        .foregroundStyle(by: .value("", data.category.rawValue))
                }
            }
            .padding(.horizontal, 48)
            .frame(height: 200)

            
            Text("Ranged")
            Chart {
                ForEach(dataList.filter({$0.category == .a})) { data in
                    AreaMark(x: .value("", data.minutes), yStart: .value("", data.value*0.9), yEnd: .value("", data.value*1.1))
                }
            }
            .padding(.horizontal, 48)
            .frame(height: 200)


        }

    }

}


#Preview {
    AreaMarkDemo()
}
