//
//  ButtonDayView.swift
//  WorkTracking
//
//  Created by Emilio Higueras Muñoz on 16/6/24.
//

import SwiftUI

struct ButtonDayView: View {
    @AppStorage ("hourIn") var hourIn: Int = 0
    @AppStorage ("hourOut") var hourOut: Int = 0
    @State var typeHour: Bool = false               //false: hourIn; true: hourOut
    
    var body: some View {
        Button {
            let date = Date.now
            if (typeHour) {
                hourOut = date.hourTominute(date: date)
            } else {
                hourIn = date.hourTominute(date: date)
            }
        } label: {
            VStack {
                Image(systemName: typeHour ? "square.and.arrow.up.on.square" : "square.and.arrow.down.on.square" )
                    .font(.largeTitle)
                    .padding(.horizontal)
                Text("\(typeHour ?  hourOut.minutesToHour(minutes: hourOut) : hourIn.minutesToHour(minutes: hourIn))")
                    .font(.callout)
            }
        }
    }
}

#Preview {
    ButtonDayView()
}
