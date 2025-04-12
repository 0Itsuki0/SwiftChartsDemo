//
//  BarMark.swift
//  SwiftChartDemo
//
//  Created by Itsuki on 2025/02/22.
//


import SwiftUI
import Charts

private enum BarCategory: String {
    case a
    case b
    case c
}

private enum SubCategory: String {
    case x
    case y
    case z
    
    var color: Color {
        switch self {
        case .x:
            return .red
        case .y:
            return .blue
        case .z:
            return .green
        }
    }
}

private struct BarMarkData: Identifiable {
    var id: UUID = UUID()
    var value: Double
    var category: BarCategory
    var subCategory: SubCategory
}

private struct RangeBarMarkData: Identifiable {
    var id: UUID = UUID()
    var start: Double
    var end: Double
    var category: BarCategory
}

struct BarMarkDemo: View {
    
    private let dataList: [BarMarkData] = [
        .init(value: 3, category: .a, subCategory: .x),
        .init(value: 4, category: .b, subCategory: .z),
        .init(value: 2, category: .b, subCategory: .x),
        .init(value: 4, category: .c, subCategory: .x),
        .init(value: 2, category: .a, subCategory: .z),
        .init(value: 1, category: .a, subCategory: .y),
        .init(value: 3, category: .a, subCategory: .z)
    ]
    
    private let rangeDataList: [RangeBarMarkData] = [
        .init(start: 1, end: 3, category: .a),
        .init(start: 9, end: 11, category: .a),
        .init(start: -8, end: 0, category: .b),
        .init(start: 6, end: 15, category: .b),
        .init(start: -1, end: 5, category: .c),
    ]
    
    private let oneDimDataList: [BarMarkData] = [
        .init(value: 3, category: .a, subCategory: .x),
        .init(value: 2, category: .a, subCategory: .z),
        .init(value: 1, category: .a, subCategory: .y),
        .init(value: 3, category: .a, subCategory: .z)
    ]
    
    var body: some View {
        
        ScrollView {
            Spacer()
                .frame(height: 24)
            
            Text("Stack")
                
            Chart {
                ForEach(dataList) { data in
                    BarMark(x: .value("", data.category.rawValue), y: .value("", data.value))
//                        .foregroundStyle(data.subCategory.color) // for customized color
                        .foregroundStyle(by: .value("", data.subCategory.rawValue)) // for automatic coloring with legend
                }
            }
            .frame(height: 200)
            .padding(.horizontal, 48)
            
            Text("Group")
                
            Chart {
                ForEach(dataList) { data in
                    BarMark(x: .value("", data.category.rawValue), y: .value("", data.value))
                        .foregroundStyle(by: .value("", data.subCategory.rawValue))
                        .position(by: .value("", data.subCategory.rawValue))
                }
            }
            .frame(height: 200)
            .padding(.horizontal, 48)

            Spacer()
                .frame(height: 48)
            
            Text("Ranged/Interval")
                
            
            Chart {
                
                ForEach(rangeDataList) { data in
                    BarMark(x: .value("", data.category.rawValue), yStart: .value("", data.start), yEnd: .value("", data.end), width: .automatic)
                }
            }
            .frame(height: 200)
            .padding(.horizontal, 48)

            Spacer()
                .frame(height: 48)
            
            Text("1-Dimension")
                
            
            Chart {
                ForEach(oneDimDataList) { data in
                    BarMark(x: .value("", data.value))
                        .foregroundStyle(by: .value("", data.subCategory.rawValue))
                }
            }
            .frame(height: 64)
            .padding(.horizontal, 48)

        }
    

    }
}


#Preview {
    BarMarkDemo()
}
