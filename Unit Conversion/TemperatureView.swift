//
//  TemperatureView.swift
//  Unit Conversion
//
//  Created by Manhattan on 09/10/24.
//

import SwiftUI

struct TemperatureView: View {
    
    @FocusState private var valueIsFocused: Bool
    @State private var valueToConvert: Double = 0
    
    let tempsDict:[String: UnitTemperature] = [
        "Celsius": UnitTemperature.celsius,
        "Farenheit": UnitTemperature.fahrenheit,
        "Kelvin": UnitTemperature.kelvin
    ]

    @State private var unitToConvert = "Celsius"
    @State private var unitConverted = "Farenheit"
    
    var convertedValue: Double{
        let input = Measurement(value: valueToConvert, unit: tempsDict[unitToConvert]!)
        let output = input.converted(to: tempsDict[unitConverted]!)
        return output.value
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Temperature in \(unitToConvert) Degrees") {
                    TextField("Value to convert", value: $valueToConvert, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)
                    TempUnitSelector(unit:$unitToConvert)
                }
                
                Section("Temperature in \(unitConverted) Degrees") {
                    Text(String(format: "%.2f", convertedValue))
                    TempUnitSelector(unit:$unitConverted)
                }
            }
            .navigationTitle("Temperature")
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
    TemperatureView()
}

struct TempUnitSelector: View {
    
    @Binding var unit: String
    let temps:[String] = [
        "Celsius",
        "Farenheit",
        "Kelvin"
    ]
    
    var body: some View {
        Picker("Temperature Unit", selection: $unit) {
            ForEach(temps, id: \.self) {
                Text("\($0)")
            }
        }
        .pickerStyle(.segmented)
    }
}
