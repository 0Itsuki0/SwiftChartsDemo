//
//  DataStructure.swift
//  SwiftChartDemo
//
//  Created by Itsuki on 2025/02/24.
//

import SwiftUI

struct InteractiveLineData: Identifiable {
    var id: UUID = UUID()
    var value: Double
    var date: Date
}

struct InteractivePieData: Identifiable {
    var id: UUID = UUID()
    var name: String
    var value: Double
}
