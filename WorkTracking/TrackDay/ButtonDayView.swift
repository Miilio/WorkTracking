//
//  ButtonDayView.swift
//  WorkTracking
//
//  Created by Emilio Higueras Muñoz on 16/6/24.
//

import SwiftUI

struct ButtonDayView: View {
    @AppStorage ("minutesIn") var minutesIn: Int = 0
    @AppStorage ("minutesOut") var minutesOut: Int = 0
    @AppStorage ("typeHour") var typeHour: Int = 0 //false: hora entrada; true: hora salida
    @AppStorage ("fecha") var dateIn: String  = ""
    @AppStorage ("fecha") var dateout: String  = ""
    @State private var icono: Bool = false
    
    var body: some View {
        Button {
            let date = Date.now
            if (typeHour == 0) {
                dateIn = date.dateToString()
                minutesIn = date.hourTominute(date: date)
                typeHour = +1
            } else {
                dateout = date.dateToString()
                if (dateIn == dateout) {
                    minutesOut = date.hourTominute(date: date)
                } else {
                    minutesOut = 1359   //23:59
                }
                typeHour = 2
            }
            icono.toggle()
        } label: {
            VStack {
                Image(systemName: icono ? "square.and.arrow.up.on.square" : "square.and.arrow.down.on.square" )
                    .font(.largeTitle)
                    .padding(.horizontal)
                Text(icono ? "Salida" : "Entrada")
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Entrada: \(minutesIn.minutesToHour(minutes: minutesIn))")
                Text("Salida: \(minutesOut.minutesToHour(minutes: minutesOut))")
                    .font(.callout)
                Text("Total horas: \(calculatedHours(minutesIn: minutesIn, minutesOut: minutesOut))")
            }
            .foregroundStyle(.gray)
            
            
            
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
    ButtonDayView()
}
