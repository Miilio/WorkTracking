//
//  HorasVM.swift
//  WorkTracking
//
//  Created by Emilio Higueras Muñoz on 15/6/24.
//

import Foundation

struct diaLaboral {
    let fecha: Date
    var horaEntrada: Date
    var horaSalida: Date
}


@Observable
class HorasVM {
    var laboral: diaLaboral
    
    init(horas: diaLaboral) {
        self.laboral = horas
    }
}

extension HorasVM {
    func calculaTotalHoras(hEntrada: Date, hSalida: Date) -> String {
        let calendario = Calendar.autoupdatingCurrent
        var componentes = calendario.dateComponents([.hour, .minute], from: hEntrada)
        let entrada = (componentes.hour ?? 0) * 60 + (componentes.minute ?? 0)
        
        componentes = calendario.dateComponents([.hour, .minute], from: hSalida)
        let salida = (componentes.hour ?? 0) * 60 + (componentes.minute ?? 0)
        let total = salida - entrada    //minutos
        
        return "\(total / 60):\(total % 60)"
    }
}
