//
//  MeasureView.swift
//  Unit Conversion
//
//  Created by Manhattan on 18/10/24.
//

import SwiftUI

struct MeasureView: View {
    
    let viewModel: MeasureViewModel
    @FocusState private var valueIsFocused: Bool
    
    var body: some View {
        
        @Bindable var vm = viewModel
        
        NavigationStack{
            Form{
                Section("\(viewModel.unitToConvert)") {
                    TextField("Value to convert", value: $vm.valueToConvert, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)
                    ConversionUnitSelector(unit:$vm.unitToConvert, options: viewModel.options)
                }
                
                Section("\(viewModel.unitConverted)") {
                    Text(String(viewModel.convertedValue))
                    ConversionUnitSelector(unit:$vm.unitConverted, options: viewModel.options)
                }
            }
            .navigationTitle(viewModel.title)
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
    MeasureView(viewModel: MeasureViewModel.example)
}

struct ConversionUnitSelector: View {
    
    @Binding var unit: String
    let options:[String]
    
    var body: some View {
        Picker("Length Unit", selection: $unit) {
            ForEach(options, id: \.self) {
                Text("\($0)")
            }
        }
        .pickerStyle(.segmented)
    }
}
