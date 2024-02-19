//
//  CurrencyViewModel.swift
//  CurrencyConverter
//
//  Created by Micah Moore on 2/18/24.
//

import Foundation

class CurrencyViewModel: ObservableObject {
    @Published var usdAmount: String = ""
    @Published var selectedCurrencies: [Currency] = []
    @Published var convertedValues: [Double] = []
    @Published var showError: Bool = false

    // Define your available currencies here
    let availableCurrencies: [Currency] = [
        Currency(name: "EUR", conversionRate: 0.9), // Example conversion rate
        Currency(name: "JPY", conversionRate: 110.0),
        Currency(name: "GBP", conversionRate: 0.75),
        Currency(name: "CAD", conversionRate: 1.25)
    ]

    func convert() {
        // Validate input
        guard let amount = Double(usdAmount), amount >= 0 else {
            showError = true
            return
        }
        showError = false
        // Conversion logic
        convertedValues = selectedCurrencies.map { currency in
            amount * currency.conversionRate
        }
    }

    // Add more logic as needed for your ViewModel
}
