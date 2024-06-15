//
//  ButtonDateView.swift
//  WorkTracking
//
//  Created by Emilio Higueras Muñoz on 15/6/24.
//

import SwiftUI

struct ButtonDateView: View {
    @Binding var hora: Date
    let name: String
    let color: Color
    let cornerRadius: Double
    
    var body: some View {
        Button {
            hora = Date.now
        } label: {
            VStack {
                Text("\(name)")
                Text(hora.formatted(date: .omitted, time: .shortened))
            }
        }
        .padding()
        .background(color)
        .cornerRadius(cornerRadius)
        
    }
}

#Preview {
    ButtonDateView(hora: .constant(Date.now), name: "Entrada", color: .cyan, cornerRadius: 20.0)
}
