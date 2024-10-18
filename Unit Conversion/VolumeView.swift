//
//  VolumeView.swift
//  Unit Conversion
//
//  Created by Manhattan on 09/10/24.
//

import SwiftUI

struct VolumeView: View {
    let volumeModel = MeasureViewModel(title: "⏱️ Volume",
                                       options: [
                                            UnitVolume.cubicCentimeters.symbol,
                                            UnitVolume.cubicFeet.symbol,
                                            UnitVolume.cubicInches.symbol
                                       ],
                                      units: [
                                        UnitVolume.cubicCentimeters.symbol: UnitVolume.cubicCentimeters,
                                        UnitVolume.cubicFeet.symbol: UnitVolume.cubicFeet,
                                        UnitVolume.cubicInches.symbol: UnitVolume.cubicInches
                                     ],
                                      valueToConvert: 0,
                                      unitToConvert: UnitVolume.cubicCentimeters.symbol,
                                      unitConverted: UnitVolume.cubicFeet.symbol)
    
    var body: some View {
        MeasureView(viewModel: volumeModel)
    }
}

#Preview {
    VolumeView()
}
