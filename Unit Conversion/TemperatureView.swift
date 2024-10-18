//
//  TemperatureView.swift
//  Unit Conversion
//
//  Created by Manhattan on 09/10/24.
//

import SwiftUI
struct TemperatureView: View {
    let temperatureModel = MeasureViewModel(title: "🌡️ Temperature",
                                      options: ["Celsius", "Farenheit", "Kelvin"],
                                      units: [
                                        "Celsius": UnitTemperature.celsius,
                                        "Farenheit": UnitTemperature.fahrenheit,
                                        "Kelvin": UnitTemperature.kelvin
                                     ],
                                      valueToConvert: 0,
                                      unitToConvert: "Celsius",
                                      unitConverted: "Farenheit")
    
    var body: some View {
        MeasureView(viewModel: temperatureModel)
    }
}

#Preview {
    TemperatureView()
}
