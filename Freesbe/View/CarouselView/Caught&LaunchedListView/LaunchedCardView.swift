//
//  LaunchedCardView.swift
//  Freesbe
//
//  Created by Antonio Palomba on 12/12/22.
//

import SwiftUI

struct LaunchedCardView: View {
    let arrayOfLaunchedCards = [
        Card(imageName: "", throwerAvatar:"Card 1", cardTitle: "SwiftUI with Ahmed", tag: "code", time: "14:00", location: "Collab 3-1", thrower: "Ahmed Mgua", description: "test"),
        Card(imageName: "", throwerAvatar:"Card 1", cardTitle: "SwiftUI with Ahmed", tag: "code", time: "14:00", location: "Collab 3-1", thrower: "Ahmed Mgua", description: "test")
    ]
    @State var infoModal = false
    var body: some View {
        VStack {
            ForEach(arrayOfLaunchedCards) { card in
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
                    Button {
                        infoModal.toggle()
                        
                    } label: {
                            Image(card.throwerAvatar)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                    }
                    .offset(x: 230)

                        
                    
                    
                }
                .sheet(isPresented: $infoModal) {
                    ModalView()
                        .presentationDetents([.smallView, .largeView])
                }
                
                
            }
        }
        //There is a bug with the shadow of cards, you need to add a negative padding to the scrollView too
        .padding(.horizontal, 20)
    }
}

struct LaunchedCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
