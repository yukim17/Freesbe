//
//  CaughtCardView.swift
//  Freesbe
//
//  Created by Antonio Palomba on 13/12/22.
//

import SwiftUI

struct CaughtCardView: View {
    let arrayOfCaughtCards = [
        FreesbeCard(throwerAvatar:"Card 1", cardTitle: "SwiftUI with Ahmed", tag: "code", time: "14:00", location: "Collab 3-1", thrower: "Ahmed Mgua", description: "test"),
        FreesbeCard(throwerAvatar:"Card 1", cardTitle: "SwiftUI with Ahmed", tag: "code", time: "14:00", location: "Collab 3-1", thrower: "Ahmed Mgua", description: "test"),
        FreesbeCard(throwerAvatar:"Card 1", cardTitle: "SwiftUI with Ahmed", tag: "code", time: "14:00", location: "Collab 3-1", thrower: "Ahmed Mgua", description: "test"),
        FreesbeCard(throwerAvatar:"Card 1", cardTitle: "SwiftUI with Ahmed", tag: "code", time: "14:00", location: "Collab 3-1", thrower: "Ahmed Mgua", description: "test"),
        FreesbeCard(throwerAvatar:"Card 1", cardTitle: "SwiftUI with Ahmed", tag: "code", time: "14:00", location: "Collab 3-1", thrower: "Ahmed Mgua", description: "test"),
        FreesbeCard(throwerAvatar:"Card 1", cardTitle: "SwiftUI with Ahmed", tag: "code", time: "14:00", location: "Collab 3-1", thrower: "Ahmed Mgua", description: "test"),
        FreesbeCard(throwerAvatar:"Card 1", cardTitle: "SwiftUI with Ahmed", tag: "code", time: "14:00", location: "Collab 3-1", thrower: "Ahmed Mgua", description: "test"),
        FreesbeCard(throwerAvatar:"Card 1", cardTitle: "SwiftUI with Ahmed", tag: "code", time: "14:00", location: "Collab 3-1", thrower: "Ahmed Mgua", description: "test"),
        FreesbeCard(throwerAvatar:"Card 1", cardTitle: "SwiftUI with Ahmed", tag: "code", time: "14:00", location: "Collab 3-1", thrower: "Ahmed Mgua",description: "test")
    ]
    
    var body: some View {
        VStack {
            ForEach(arrayOfCaughtCards) { card in
                ZStack(alignment: .leading){
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.5), radius: 5, x: 20, y: 10)
                        .frame(width: 270, height: 100)
                    
                        HStack {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(card.cardTitle)
                                        .font(.title3.bold())
                                    
                                    /* Text(card.tag)
                                     .padding(3)
                                     .background(Color("BG"))
                                     .cornerRadius(10)
                                     .padding(-5) */
                                    
                                    Text("Time: \(card.time)")
                                    Text("Location: \(card.location)")
                                    Text("Thrower: \(card.thrower)")
                                    
                                }
                                .foregroundColor(.black)
                                .padding(.leading, 10)
                                Spacer()
                            }
                            
                        }
                    
                        Image(card.throwerAvatar)
                            .resizable()
                            .frame(width: 120, height: 120)
                            .offset(x: 230)
                    
                    
                }
                
                
            }
        }
        //There is a bug with the shadow of cards, you need to add a negative padding to the scrollView too
        .padding(.horizontal, 20)
    }
}

struct CaughtCardView_Previews: PreviewProvider {
    static var previews: some View {
        CaughtCardView()
    }
}
