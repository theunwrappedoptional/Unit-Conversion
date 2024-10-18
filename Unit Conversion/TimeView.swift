//
//  TimeView.swift
//  Unit Conversion
//
//  Created by Manhattan on 09/10/24.
//

import SwiftUI

struct TimeView: View {
    let timeModel = MeasureViewModel(title: "⏱️ Time",
                                      options: ["Seconds", "Minutes", "Hours"],
                                      units: [
                                        "Seconds": UnitDuration.seconds,
                                        "Minutes": UnitDuration.minutes,
                                        "Hours": UnitDuration.hours
                                     ],
                                      valueToConvert: 0,
                                      unitToConvert: "Seconds",
                                      unitConverted: "Minutes")
    
    var body: some View {
        MeasureView(viewModel: timeModel)
    }
}

#Preview {
    TimeView()
}
