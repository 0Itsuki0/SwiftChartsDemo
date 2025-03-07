//
//  RectangleMark.swift
//  SwiftChartDemo
//
//  Created by Itsuki on 2025/02/22.
//

import SwiftUI
import Charts

enum RectangleMarkCategory: String {
    case a
    case b
    case c
}

struct RectangleMarkData: Identifiable {
    let id = UUID()
    let horizontal: RectangleMarkCategory
    let vertical: RectangleMarkCategory
    let value: Double = Double.random(in: -100..<100)
}

struct RectangleMarkDemo: View {
    private let dataList: [RectangleMarkData] = [
        .init(horizontal: .a, vertical: .a),
        .init(horizontal: .a, vertical: .b),
        .init(horizontal: .a, vertical: .c),
        
        .init(horizontal: .b, vertical: .a),
        .init(horizontal: .b, vertical: .b),
        .init(horizontal: .b, vertical: .c),
        
        .init(horizontal: .c, vertical: .a),
        .init(horizontal: .c, vertical: .b),
        .init(horizontal: .c, vertical: .c),
    ]
    
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 24)

            Text("Basic Heat map")
                
            Chart {
                ForEach(dataList) { data in
                    RectangleMark(
                        x: .value("", data.horizontal.rawValue),
                        y: .value("", data.vertical.rawValue)
                    )
                    .foregroundStyle(by: .value("Number", data.value))
                    

                }
            }
            .frame(height: 200)
            .padding(.horizontal, 48)

            Spacer()
                .frame(height: 48)

            Text("Annotation")
                
            Chart {
                ForEach(0..<10, id: \.self) { _ in
                    PointMark(x: .value("", Double.random(in: -10..<10)), y: .value("", Double.random(in: -10..<10)))
                }
                
                RectangleMark(
                    xStart: .value("Rect xStart", -5),
                    xEnd: .value("Rect xEnd", 5),
                    yStart: .value("Rect yStart", -5),
                    yEnd: .value("Rect yEnd", 5)
                )
                .opacity(0.2)
                
                RectangleMark(
                    yStart: .value("Rect yStart", -3),
                    yEnd: .value("Rect yEnd", 3)
                )
                .opacity(0.2)
                

            }
            .frame(height: 200)
            .padding(.horizontal, 48)
            
            Spacer()
                .frame(height: 48)

            Chart {

                RectangleMark(
                    xStart: .value("Rect xStart", -5),
                    xEnd: .value("Rect xEnd", 5),
                    yStart: .value("Rect yStart", -5),
                    yEnd: .value("Rect yEnd", 5)
                )
                .opacity(0.2)
                
                RectangleMark(
                    xStart: 100,
                    xEnd: nil,
                    yStart: nil,
                    yEnd: nil
                )
                .opacity(0.3)

            }
            .frame(height: 200)
            .padding(.horizontal, 48)

        }
    }
}

#Preview {
    RectangleMarkDemo()
}
