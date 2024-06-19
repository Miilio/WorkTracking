//
//  ModelDay.swift
//  WorkTracking
//
//  Created by Emilio Higueras Muñoz on 16/6/24.
//

import Foundation

/*
 El tipo de datos se usa Int; resolución de minutos
 23:59 --> 1339 minutos
 */
@Observable
class ModelDay {
    var date: String
    var minutesIn: Int     
    var minutesOut: Int
    
    init(date: String, hourIn: Int, hourOut: Int) {
        self.date = date
        self.minutesIn = hourIn
        self.minutesOut = hourOut
    }
}

