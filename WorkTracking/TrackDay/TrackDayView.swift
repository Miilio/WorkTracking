/*
 Se usa UserDafault para almacenar la entrada y salida, por si el usuario cierra la app
 
 Se controla:
    
 - Dentro del mismo día: entrada ---> Salida --> Se dehabilita para no manipular
      Se incluye unn botón de reset para iniciar el proceso anterior
 
 - si se pasa la salida de fecha, esta es tomada como 23:59 del día anterior automáticamente y será necesario reset para empezar el nuevo día
  */

import SwiftUI

struct TrackDayView: View {
    @AppStorage ("minutesIn") var minutesIn: Int = 0
    @AppStorage ("minutesOut") var minutesOut: Int = 0
    @AppStorage ("typeHour") var typeHour: Int = 0
    @AppStorage ("fecha") var dateIn: String  = ""
    @AppStorage ("fecha") var dateout: String  = ""
    
    var body: some View {
        ScrollView {
            GroupBox {
                Text(Date().dateToString()).foregroundStyle(.gray)
                
                Button {
                    typeHour = 0
                    minutesIn = 0
                    minutesOut = 0
                } label: {
                    Text("Reset")
                }
                
                Text((dateIn != dateout) ? "Día anterior no cerrado correctamente: Pulse Reset" : "")
                    .foregroundStyle(.red)
                    .padding()

                ButtonDayView()
                    .disabled(typeHour >= 2 ? true : false)
            }
            .cornerRadius(20)
        }
    }
}

#Preview {
    TrackDayView()
}
