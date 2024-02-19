//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Micah Moore on 2/18/24.
//

import Foundation

struct Currency: Identifiable {
    let id: UUID = UUID()
    var name: String
    var conversionRate: Double
}
