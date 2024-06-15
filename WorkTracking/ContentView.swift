//
//  ContentView.swift
//  WorkTracking.V01
//
//  Created by Emilio Higueras Muñoz on 14/6/24.
//

import SwiftUI

struct ContentView: View {
    @State var hEntrada: Date
    @State var hSalida: Date
    let fecha: Date
    
    var body: some View {
        VStack {
            Text("Fecha: \(fecha.formatted(date: .abbreviated, time: .omitted))")
            HStack {
                Button {
                    hEntrada = Date.now
                } label: {
                    VStack {
                        Text("Entrada")
                        Text(hEntrada.formatted(date: .omitted, time: .shortened))
                    }
                }
                Button {
                    hSalida = Date.now
                } label: {
                    VStack {
                        Text("Salida")
                        Text(hSalida.formatted(date: .omitted, time: .shortened))
                    }
                }
            }
            Text("Total de horas: \(calculaTotalHoras(hEntrada: hEntrada, hSalida: hSalida))")
        }
        .padding()
    }
    
    func calculaTotalHoras(hEntrada: Date, hSalida: Date) -> String {
        let calendario = Calendar.autoupdatingCurrent
        var componentes = calendario.dateComponents([.hour, .minute], from: hEntrada)
        let entrada = (componentes.hour ?? 0) * 60 + (componentes.minute ?? 0)
        
        componentes = calendario.dateComponents([.hour, .minute], from: hSalida)
        let salida = (componentes.hour ?? 0) * 60 + (componentes.minute ?? 0)
        var total = salida - entrada    //minutos
        
        return "\(total / 60):\(total % 60)"
    }
}

#Preview {
    ContentView(hEntrada: Date.now, hSalida: Date.now, fecha: Date.now)
}
