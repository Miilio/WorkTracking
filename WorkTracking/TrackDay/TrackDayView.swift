//
//  TrackDayView.swift
//  WorkTracking
//  Se usa UserDafault para almacenar la entrada y salida, por si el usuario cierra la app
//  Created by Emilio Higueras Muñoz on 16/6/24.
//
import SwiftUI

struct TrackDayView: View {
    @AppStorage ("hourIn") var hourIn: Int = 0
    @AppStorage ("hourOut") var hourOut: Int = 0
    @State var disableButton: Int = 0
    
    var body: some View {
        ScrollView {
            GroupBox {
                Text(Date().dateToString())
                
                HStack {
                    ButtonDayView(hourIn: hourIn, hourOut: hourOut, typeHour: false, disabledButton: $disableButton)
                        .disabled(disableButton == 1 || disableButton == 2)
                    
                    ButtonDayView(hourIn: hourIn, hourOut: hourOut, typeHour: true, disabledButton: $disableButton)
                        .disabled(disableButton == 2)
                }
                .padding(.all)
                
                Text("Total horas: \(calculatedHours(hourIn: hourIn, hourOut: hourOut))")

            }
        }
    }
    
    func calculatedHours(hourIn: Int, hourOut: Int) -> String {
        let hour = hourOut - hourIn
        
        if (hour > 0) {
            return hour.minutesToHour(minutes: hour)
        } else {
            return "0:0"
        }
    }
}

#Preview {
    TrackDayView()
}
