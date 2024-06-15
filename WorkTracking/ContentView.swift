//
//  ContentView.swift
//  WorkTracking.V01
//
//  Created by Emilio Higueras Muñoz on 14/6/24.
//

import SwiftUI

struct ContentView: View {
    @State var horas: HorasVM
    
    var body: some View {
        VStack {
            Text("Fecha: \(horas.laboral.fecha.formatted(date: .abbreviated, time: .omitted))")
            HStack {
                ButtonDateView(hora: $horas.laboral.horaEntrada, name: "Entrada")
                ButtonDateView(hora: $horas.laboral.horaSalida, name: "Salida")
            }
            Text("Total de horas: \(horas.calculaTotalHoras(hEntrada: horas.laboral.horaEntrada, hSalida: horas.laboral.horaSalida))")
        }
        .padding()
    }
    
    
}

#Preview {
    ContentView(horas: HorasVM(horas: diaLaboral(fecha: Date.now, horaEntrada: Date.now, horaSalida: Date.now)))
}
