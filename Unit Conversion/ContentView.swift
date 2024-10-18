//
//  ContentView.swift
//  Unit Conversion
//
//  Created by Manhattan on 09/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            TemperatureView()
                .tabItem {
                    Label("Temperature", systemImage: "thermometer.medium")
                }
            LengthView()
                .tabItem {
                    Label("Length", systemImage: "ruler")
                }
            TimeView()
                .tabItem {
                    Label("Time", systemImage: "clock")
                }
            VolumeView()
                .tabItem {
                    Label("Volume", systemImage: "square.stack.3d.forward.dottedline")
                }
        }
    }
}

#Preview {
    ContentView()
}
