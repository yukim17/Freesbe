//
//  ConfirmationVikew.swift
//  Freesbe
//
//  Created by Antonio Palomba on 16/12/22.
//

import SwiftUI

struct ConfirmationView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .ignoresSafeArea()
            VStack {
                Image("checked")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                Text("You joined the activity!")
                    .foregroundColor(Color("paletteTitle"))
                    .font(.title)
                Button(action: {
                    done()
                }, label: {
                    Text("Return to feed")
                        .padding(20)
                        .font(.largeTitle)
                })
                
            }
        }
    }
    func done() {
        dismiss()
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView()
    }
}
