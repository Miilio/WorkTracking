//
//  ContentView.swift
//  WorkTracking.V01
//
//  Created by Emilio Higueras Muñoz on 14/6/24.
//

import SwiftUI

struct ContentView: View {
    @State var horas: HorasVM
    @State var buttonActive: Bool = false
    
    var body: some View {
        VStack {
            Text("Fecha: \(horas.laboral.fecha.formatted(date: .abbreviated, time: .omitted))")
            HStack {
                ButtonDateView(hora: $horas.laboral.horaEntrada, name: "Entrada", color: .cyan, cornerRadius: 20.0, isActive: $buttonActive)
                    .disabled(buttonActive)
                    
                ButtonDateView(hora: $horas.laboral.horaSalida, name: "Salida", color: .cyan, cornerRadius: 20.0, isActive: $buttonActive)
                    .disabled(!buttonActive)
                    
                    
            }
            Text("Total de horas: \(horas.calculaTotalHoras(hEntrada: horas.laboral.horaEntrada, hSalida: horas.laboral.horaSalida))")
        }
        .padding()
        .background(Color.indigo)
        .cornerRadius(20.0)
    }
    
    
}

#Preview {
    ContentView(horas: HorasVM(horas: diaLaboral(fecha: Date.now, horaEntrada: Date.now, horaSalida: Date.now)))
}
