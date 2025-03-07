//
//  SectorMark.swift
//  SwiftChartDemo
//
//  Created by Itsuki on 2025/02/22.
//

import SwiftUI
import Charts

struct SectorMarkData: Identifiable {
    var id: UUID = UUID()
    var name: String
    var value: Double
}

struct SectorMarkDemo: View {
    private let dataList: [SectorMarkData] = [
        .init(name: "Apple", value: 100),
        .init(name: "Google", value: 10),
        .init(name: "Microsoft", value: 15),
        .init(name: "Amazon", value: 50),
    ]
    
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 24)
            
            Text("Pie Graph")
                
            
            Chart {
                ForEach(dataList) { data in
                    SectorMark(angle: .value("", data.value))
                        .foregroundStyle(by: .value("", data.name))
                }
            }
            .padding(.horizontal, 32)
            .frame(height: 240)
            
            Spacer()
                .frame(height: 48)
            
            Text("Donut Graph")
                
            
            Chart {
                ForEach(dataList) { data in
                    SectorMark(
                        angle: .value("", data.value),
                        innerRadius: .ratio(0.5)
                    )
                    .foregroundStyle(by: .value("", data.name))
                }
            }
            .padding(.horizontal, 32)
            .frame(height: 240)
            
        }
    }
}

#Preview {
    SectorMarkDemo()
}
