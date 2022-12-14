//
//  CarouselView.swift
//  Freesbe
//
//  Created by Antonio Palomba on 12/12/22.
//

import SwiftUI

struct CarouselView: View {
    //MARK: Sample Cards
    @Binding var cards : [Card]
    
    //MARK: View Properties
    @State var isBlurEnabled: Bool = true
    @State var isRotationEnabled: Bool = true
    
    var body: some View {
        ZStack {
            VStack {
                
                //Toggle("Enable Blur", isOn: $isBlurEnabled)
               // Toggle("Turn on Rotation", isOn: $isRotationEnabled)
                    //.frame(maxWidth: .infinity, alignment: .top)
                
                
                
                
                BoomerangCard(isRotationEnabled: isRotationEnabled, isBlurEnabled: isBlurEnabled, cards: $cards)
                //this frame is important because determines when a card will be swapped in .onEnded
                    .frame(height: 220)
                    .padding(.horizontal,20)
                    .padding(.vertical, 70)
                Spacer()
                
            }
            .padding(15)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
           
            }
            .preferredColorScheme(.dark)
            .onAppear(perform: setupCards)
        
       
    }

    
    //MARK: Setting up Card's
    func setupCards() {
        /*for index in 1...4 {
            cards.append(.init(imageName: "Card \(index)", throwerAvatar:"Card 1", cardTitle: "SwiftUI with Ahmed", tag: "code", time: "14:00", location: "Collab 3-1", thrower: "Ahmed Mgua", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "))
        } */
        
        // FOR INFINITE CARDS
        //Logic is place the first card at last
        //When the last card is arrived, set Index to 0
        if var first = cards.first {
            first.id = UUID().uuidString
            cards.append(first)
        }
        
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

