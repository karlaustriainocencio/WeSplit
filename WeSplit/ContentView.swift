//
//  ContentView.swift
//  WeSplit
//
//  Created by Karl Inocencio on 23/8/20.
//  Copyright © 2020 Karl Inocencio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    let stringValue = "0.5"
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPrerson = grandTotal / peopleCount
        return amountPerPrerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                }
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2..<100){
                        Text("\($0) people")
                    }
                }
                Section {
                    Text("How much tip do you want leave?")
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .navigationBarTitle("WeSplit")
                
                Section {
                    Text("$\(checkAmount)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
