//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Micah Moore on 2/18/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CurrencyViewModel()

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter USD:", text: $viewModel.usdAmount)
                    .keyboardType(.decimalPad)
                    .padding()
                
                if viewModel.showError {
                    Text("Invalid input. Please enter a valid number.")
                        .foregroundColor(.red)
                        .padding()
                }
                
                VStack {
                    ForEach(viewModel.availableCurrencies) { currency in
                        HStack {
                            Text(currency.name)
                            Spacer()
                            Toggle("", isOn: Binding(
                                get: { viewModel.selectedCurrencies.contains(where: { $0.id == currency.id }) },
                                set: { isOn in
                                    if isOn {
                                        viewModel.selectedCurrencies.append(currency)
                                    } else {
                                        viewModel.selectedCurrencies.removeAll { $0.id == currency.id }
                                    }
                                }
                            ))
                        }.padding(.horizontal)
                    }
                }
                
                Button("Convert") {
                    viewModel.convert()
                }
                .padding()
                
                // This is the navigation link to the ResultsView
                NavigationLink(destination: ResultsView(viewModel: viewModel)) {
                    Text("Show Results")
                }
                .padding()
            }
            .navigationTitle("CurrencyConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


