//
//  ContentView.swift
//  WorkTracking.V01
//
//  Created by Emilio Higueras Muñoz on 14/6/24.
//

import SwiftUI

struct ContentView: View {
    @State var horas: HorasVM
    @State var buttonDisabled: Int = 0
    let iconEntrada = "square.and.arrow.down.on.square"
    let iconSalida = "square.and.arrow.up.on.square"
    let cornerRadius = 20.0
    
    var body: some View {
        ScrollView {
            GroupBox {
                VStack {
                    Text("Fecha: \(horas.laboral.fecha.formatted(date: .abbreviated, time: .omitted))")
                    HStack {
                        ButtonDateView(hora: $horas.laboral.horaEntrada, iconImage: iconEntrada, buttonDisabled: $buttonDisabled)
                            .disabled(buttonDisabled == 0 ? false : true)
                            
                        ButtonDateView(hora: $horas.laboral.horaSalida, iconImage: iconSalida, buttonDisabled: $buttonDisabled)
                            .disabled(buttonDisabled == 1 ? false : true)
                            
                            
                    }
                    Text("Total de horas: \(horas.calculaTotalHoras(hEntrada: horas.laboral.horaEntrada, hSalida: horas.laboral.horaSalida))")
                }
            }
            .cornerRadius(cornerRadius)
        }
    }
    
    
}

#Preview {
    ContentView(horas: HorasVM(horas: diaLaboral(fecha: Date.now, horaEntrada: Date.now, horaSalida: Date.now)))
}
