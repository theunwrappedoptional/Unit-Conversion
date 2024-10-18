//
//  MeasureViewModel.swift
//  Unit Conversion
//
//  Created by Manhattan on 18/10/24.
//

import Foundation

import Observation

@Observable
class MeasureViewModel {
    
    var title:String
    var options: [String]
    var units: [String: Dimension]
    
    var valueToConvert: Double
    var convertedValue: Double {
        let input = Measurement(value: valueToConvert, unit: units[unitToConvert]!)
        let output = input.converted(to: units[unitConverted]!)
        return output.value
    }
    
    var unitToConvert: String
    var unitConverted: String
    
    init(title: String, options: [String], units: [String : Dimension], valueToConvert: Double, unitToConvert: String, unitConverted: String) {
        self.title = title
        self.options = options
        self.units = units
        self.valueToConvert = valueToConvert
        self.unitToConvert = unitToConvert
        self.unitConverted = unitConverted
    }
    
    static let example = MeasureViewModel(title: "📏 Length",
                                          options: ["Meters", "Km", "Feet", "Yards", "Miles"],
                                          units: [
                                             "Meters": UnitLength.meters,
                                             "Km": UnitLength.kilometers,
                                             "Feet": UnitLength.feet,
                                             "Yards": UnitLength.yards,
                                             "Miles": UnitLength.miles
                                         ],
                                          valueToConvert: 0,
                                          unitToConvert: "Meters",
                                          unitConverted: "Km")
}
