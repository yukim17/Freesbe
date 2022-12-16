//
//  LaunchedCardView.swift
//  Freesbe
//
//  Created by Antonio Palomba on 12/12/22.
//

import SwiftUI

struct LaunchedCardView: View {
    var arrayOfLaunchedCards: [EventInfo] = FreesbeDB().arrayOfLaunchedEvents
    @State var infoModal = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(arrayOfLaunchedCards) { index in
                    VStack(alignment: .leading){
                        CardView(card: index)
                            .frame(height: 220)
                    }
                    .sheet(isPresented: $infoModal) {
                    }
                }
                
            }
        }
    }
}

struct LaunchedCardView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchedCardView()
    }
}
