//
//  CaughtCardView.swift
//  Freesbe
//
//  Created by Antonio Palomba on 13/12/22.
//

import SwiftUI

struct CaughtCardView: View {
    var arrayOfCaughtCards: [EventInfo] = FreesbeDB().arrayOfCaughtEvents
    @State var infoModal = false
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(arrayOfCaughtCards) { index in
                    VStack(alignment: .leading){
                        CardView(card: index)
                            .frame(height: 220)
                    }
                    .sheet(isPresented: $infoModal) {
                    }
                }
                Spacer(minLength: 200)
            }
        }
    }
}

struct CaughtCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
