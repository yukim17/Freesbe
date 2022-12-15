//
//  CaughtCardView.swift
//  Freesbe
//
//  Created by Antonio Palomba on 13/12/22.
//

import SwiftUI

struct CaughtCardView: View {
    var arrayOfCaughtCards: [EventInfo]
        
    
    @State var infoModal = false
    var body: some View {
        VStack {
            ForEach(EventInfo.arrayOfAcceptedEvents) { card in
                VStack(alignment: .leading){
                    CardView(card: card)
                        .frame(height: 220)
                }
                .sheet(isPresented: $infoModal) {
                }
            }
        }
        .padding(.top, 50)
    }
}

struct CaughtCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
