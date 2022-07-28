//
//  MetricUnits.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 28/07/22.
//

import Foundation

enum MetricUnit: String, CaseIterable, Identifiable {
    case oz, m, cm, g, kg, l, ml
    var id: Self { self }
}
