//
//  LengthView.swift
//  Unit Conversion
//
//  Created by Manhattan on 09/10/24.
//

import SwiftUI

struct LengthView: View {
     
    let lengthModel = MeasureViewModel(title: "📏 Length",
                                      options: ["Meters", "Feet", "Yards", "Miles"],
                                      units: [
                                         "Meters": UnitLength.meters,
                                         "Feet": UnitLength.feet,
                                         "Yards": UnitLength.yards,
                                         "Miles": UnitLength.miles
                                     ],
                                      valueToConvert: 0,
                                      unitToConvert: "Meters",
                                      unitConverted: "Feet")
    
    var body: some View {
        MeasureView(viewModel: lengthModel)
    }
}

#Preview {
    LengthView()
}

