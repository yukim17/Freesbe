//
//  LaunchedCardView.swift
//  Freesbe
//
//  Created by Antonio Palomba on 12/12/22.
//

import SwiftUI

struct LaunchedCardView: View {
    var arrayOfLaunchedCards: [EventInfo]
    @State var infoModal = false
    var body: some View {
        VStack {
            ForEach(EventInfo.arrayOfLaunchedEvents) { card in
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

struct LaunchedCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
