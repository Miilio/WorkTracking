//
//  Extensions.swift
//  WorkTracking
//
//  Created by Emilio Higueras Muñoz on 16/6/24.
//

import Foundation

extension Date {
    func hourTominute(date: Date) -> Int {
        let calendario = Calendar.autoupdatingCurrent
        let componentes = calendario.dateComponents([.hour, .minute], from: date)
        let minutes = (componentes.hour ?? 0) * 60 + (componentes.minute ?? 0)
        
        return minutes
    }
    
    func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.dateStyle = .medium
        let dateString = dateFormatter.string(from: Date()) //formato: 16 jun 2024
        
        return dateString
    }
}

extension Int {
    func minutesToHour(minutes: Int) -> String {
        let hour = minutes / 60
        let minut = minutes % 60
        
        return "\(hour):\(minut)"
    }
}
