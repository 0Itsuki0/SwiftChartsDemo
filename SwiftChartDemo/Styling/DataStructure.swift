//
//  DataStructure.swift
//  SwiftChartDemo
//
//  Created by Itsuki on 2025/02/23.
//

import SwiftUI

enum StylingDataCategory: String, CaseIterable {
    case a
    case b
    case c
    
    static var random: StylingDataCategory {
        let allCases = [StylingDataCategory.a, StylingDataCategory.b, StylingDataCategory.c]
        return allCases.randomElement() ?? .a
    }
    
    var color: Color {
        switch self {
        case .a:
            return .blue
        case .b:
            return .orange
        case .c:
            return .green
        }
    }
}

struct StylingData: Identifiable {
    let id = UUID()
    var height: Double = .random(in: 0..<20)
    var weight: Double = .random(in: 0..<20)
    var category: StylingDataCategory = .random
}
