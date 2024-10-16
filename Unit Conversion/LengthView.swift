//
//  LengthView.swift
//  Unit Conversion
//
//  Created by Manhattan on 09/10/24.
//

import SwiftUI

struct LengthView: View {
    
    @FocusState private var valueIsFocused: Bool
    @State private var valueToConvert: Double = 0
    
    let lengthsDict:[String: UnitLength] = [
        "Meters": UnitLength.meters,
        "Kilometers": UnitLength.kilometers,
        "Feet": UnitLength.feet,
        "Yards": UnitLength.yards,
        "Miles": UnitLength.miles
    ]

    @State private var unitToConvert = "Meters"
    @State private var unitConverted = "Yards"
    
    var convertedValue: Double{
        let input = Measurement(value: valueToConvert, unit: lengthsDict[unitToConvert]!)
        let output = input.converted(to: lengthsDict[unitConverted]!)
        return output.value
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Length in \(unitToConvert)") {
                    TextField("Value to convert", value: $valueToConvert, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)
                    LenghtUnitSelector(unit:$unitToConvert)
                }
                
                Section("Length in \(unitConverted)") {
                    Text(String(format: "%.2f", convertedValue))
                    LenghtUnitSelector(unit:$unitConverted)
                }
            }
            .navigationTitle("📏 Length")
            .toolbar {
                if valueIsFocused{
                    Button("Done") {
                        valueIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    LengthView()
}

struct LenghtUnitSelector: View {
    
    @Binding var unit: String
    let lengths:[String] = [
        "Meters",
        "Kilometers",
        "Feet",
        "Yards",
        "Miles"
    ]
    
    var body: some View {
        Picker("Length Unit", selection: $unit) {
            ForEach(lengths, id: \.self) {
                Text("\($0)")
            }
        }
        .pickerStyle(.segmented)
    }
}
