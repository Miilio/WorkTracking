//
//  TrackDayView.swift
//  WorkTracking
//  Se usa UserDafault para almacenar la entrada y salida, por si el usuario cierra la app
//  Created by Emilio Higueras Muñoz on 16/6/24.
//
import SwiftUI

struct TrackDayView: View {
    @AppStorage ("minutesIn") var minutesIn: Int = 0
    @AppStorage ("minutesOut") var minutesOut: Int = 0
    
    var body: some View {
        ScrollView {
            GroupBox {
                Text(Date().dateToString())
                
                ButtonDayView()
                    .disabled(false)
                    .padding()
                
                VStack (alignment: .leading) {
                    Text("Entrada: \(minutesIn.minutesToHour(minutes: minutesIn))")
                    Text("Salida: \(minutesOut.minutesToHour(minutes: minutesOut))")
                        .font(.callout)
                    Text("Total horas: \(calculatedHours(minutesIn: minutesIn, minutesOut: minutesOut))")
                }
            }
        }
    }
    
    func calculatedHours(minutesIn: Int, minutesOut: Int) -> String {
        let hour = minutesOut - minutesIn
        
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
