//
//  WorkTrackingApp.swift
//  WorkTracking
//
//  Created by Emilio Higueras Muñoz on 14/6/24.
//

import SwiftUI

@main
struct WorkTrackingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(horas: HorasVM(horas: diaLaboral(fecha: Date(), horaEntrada: Date(), horaSalida: Date())))
        }
    }
}
