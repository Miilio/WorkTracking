//
//  ButtonDateView.swift
//  WorkTracking
//
//  Created by Emilio Higueras Muñoz on 15/6/24.
//

import SwiftUI

struct ButtonDateView: View {
    @Binding var hora: Date
    let iconImage: String
    @Binding var buttonDisabled: Int
    @State var showText: Bool = false
    let cornerRadius = 20.0
    
    var body: some View {
        Button {
            hora = Date.now
            buttonDisabled += 1
            showText.toggle()
        } label: {
            VStack {
                Image(systemName: iconImage)
                Text(showText ? hora.formatted(date: .omitted, time: .shortened) : "")
            }
        }
        .padding()
        .background(.cyan)
        .cornerRadius(cornerRadius)
    }
}

#Preview {
    ButtonDateView(hora: .constant(Date.now), iconImage: "square.and.arrow.up.on.square", buttonDisabled: .constant(1))
}
