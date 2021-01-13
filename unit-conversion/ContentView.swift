//
//  ContentView.swift
//  unit-conversion
//
//  Created by Sara Nicole Mikac on 1/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var distance = "2"
    
    let initalUnitOfMeasurements = ["Feet", "Kilometers", "Miles"]
    
    let targetUnitOfMeasurements = ["Feet", "Kilometers", "Miles"]
    
    @State var initalUnitOfMeasurement = 0
    @State var targetUnitOfMeasurement = 0
 
    
    var convertedDistance: Double {
        guard let initialDistance = Double(distance) else { return 0 }
        let initialUnit = initalUnitOfMeasurements[initalUnitOfMeasurement]
       
        let targetUnit = targetUnitOfMeasurements[targetUnitOfMeasurement]
        
        switch initialUnit {
            case "Feet":
                if targetUnit == "Feet" {
                    return initialDistance
                } else if targetUnit == "Kilometers" {
                    return initialDistance * 0.0003048
                } else if targetUnit == "Miles" {
                    return initialDistance * 0.000189394
                }
                return 0
            case "Kilometers":
                if targetUnit == "Feet" {
                    return initialDistance * 3280.84
                } else if targetUnit == "Kilometers" {
                    return initialDistance
                } else if targetUnit == "Miles" {
                    return initialDistance * 0.62371
                }
            case "Miles":
                if targetUnit == "Feet" {
                    return initialDistance * 5280
                } else if targetUnit == "Kilometers" {
                    return initialDistance * 1.60934
                } else if targetUnit == "Miles" {
                    return initialDistance
                }
            default:
                return 0
        }
        return 0
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter Inital Amount")) {
                    TextField("Amount", text: $distance).keyboardType(.decimalPad)
                
                Picker("Initial Unit", selection: $initalUnitOfMeasurement) {
                    ForEach(0..<self.initalUnitOfMeasurements.count) {
                        Text("\(self.initalUnitOfMeasurements[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
                
                
            Section(header: Text("Choose which unit to convert to.")) {
                    Picker("Initial Unit", selection: $targetUnitOfMeasurement) {
                        ForEach(0..<self.targetUnitOfMeasurements.count) {
                            Text("\(self.targetUnitOfMeasurements[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section(header: Text("Converted Amount")) {
                    Text("\(convertedDistance, specifier: "%.2f")")
                }
            

            }
            }.navigationBarTitle("Unit Conversion")
            

        }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
