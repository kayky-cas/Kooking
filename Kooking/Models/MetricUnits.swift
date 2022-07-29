//
//  MetricUnits.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 28/07/22.
//

import Foundation

enum MetricUnit: String, CaseIterable, Identifiable {
    case oz, g, kg, l, ml, m, cm, unit
    var id: Self { self }
}
