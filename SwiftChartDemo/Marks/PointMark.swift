//
//  s.swift
//  SwiftChartDemo
//
//  Created by Itsuki on 2025/02/22.
//

import SwiftUI
import Charts

enum PointMarkDataCategory: String {
    case a
    case b
    case c
    
    static var random: PointMarkDataCategory {
        let allCases = [PointMarkDataCategory.a, PointMarkDataCategory.b, PointMarkDataCategory.c]
        return allCases.randomElement() ?? .a
    }
}

struct PointMarkData: Identifiable {
    let id = UUID()
    let height: Double = .random(in: 0..<20)
    let weight: Double = .random(in: 0..<20)
    let category: PointMarkDataCategory = .random
}

struct PointMarkDemo: View {
    private let dataList: [PointMarkData] = Array(0..<10).map({_ in PointMarkData()})
    
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 24)

            Text("Basic")
                
            Chart {
                ForEach(dataList) { data in
                    
                    PointMark(x: .value("", data.weight), y: .value("", data.height))
                }
            }
            .frame(height: 200)
            .padding(.horizontal, 48)
            
            Text("Grouping")
                
            Chart {
                ForEach(dataList) { data in
                    
                    PointMark(x: .value("", data.weight), y: .value("", data.height))
                        .foregroundStyle(by: .value("", data.category.rawValue))
                        .symbol(by: .value("", data.category.rawValue))
                }
            }
            .frame(height: 200)
            .padding(.horizontal, 48)
            
            
            Text("1-Dimension")
                
            Chart {
                ForEach(dataList) { data in
                    PointMark(x: .value("", data.weight))
                }
            }
            .frame(height: 48)
            .padding(.horizontal, 48)


        }
    }
}

#Preview {
    PointMarkDemo()
}
