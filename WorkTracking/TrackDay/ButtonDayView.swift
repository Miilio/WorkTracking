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
    @AppStorage ("typeHour") var typeHour: Bool = false //false: hora entrada; true: hora salida
    
    var body: some View {
        Button {
            let date = Date.now
            if (typeHour) {
                minutesOut = date.hourTominute(date: date)
            } else {
                minutesIn = date.hourTominute(date: date)
            }
            typeHour.toggle()
        } label: {
            VStack {
                Image(systemName: typeHour ? "square.and.arrow.up.on.square" : "square.and.arrow.down.on.square" )
                    .font(.largeTitle)
                    .padding(.horizontal)
                Text(typeHour ? "Salida" : "Entrada")
            }
        }
    }
}

#Preview {
    ButtonDayView()
}
