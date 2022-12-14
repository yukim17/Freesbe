//
//  BoomerangCard.swift
//  Freesbe
//
//  Created by Antonio Palomba on 12/12/22.
//

import SwiftUI

//MARK: Boomerang Card View
struct BoomerangCard: View {
    var isRotationEnabled: Bool = false
    var isBlurEnabled: Bool = false
    @Binding var cards: [Card]
    
    @State private var title = ""
    @State private var description = ""
    @State private var showDetails = false
    //MARK: Gesture Properties
    @State var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            VStack {
                ZStack {
                    ForEach(cards.reversed()) { card in
                        CardView(card: card, size: size)
                        //MARK: Moving only current active card
                            .offset(y: currentIndex == indexOf(card: card) ? offset: 0)
                    }
                }
                .onAppear(perform: indexNote)
                .animation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: offset == .zero)
                .frame(width: size.width, height: size.height)
                .contentShape(Rectangle())
                .gesture(
                    DragGesture(minimumDistance: 2)
                        .onChanged(onChanged(value:))
                        .onEnded(onEnded(value:))
                    
                )
                Text(title)
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .padding(.top, 50)
                Text(description)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.white)
                
                Button {
                    showDetails.toggle()
                } label: {
                    Text("Show details")
                        .padding(10)
                        .font(.title2)
                        .foregroundColor(.black)
                        .background(
                            Capsule()
                                .foregroundColor(.white)
//                                .cornerRadius(50)
                        )

                        
                }
                .padding(.top, 5)
               
            }
            .sheet(isPresented: $showDetails) {
                ModalView()
                    .presentationDetents([.smallView, .largeView])
            }
        }
    }
    func indexNote() {
        title = cards[currentIndex].cardTitle
        description = cards[currentIndex].description
    }
    //MARK: Gesture Calls
    func onChanged(value: DragGesture.Value) {
        //For Safety
        offset = currentIndex == (cards.count - 1) ? 0 : value.translation.height
        
    }
    
    func onEnded(value: DragGesture.Value) {
        var translation = value.translation.height
        //Since we only need negatie
        translation = (translation < 0 ? -translation : 0)
        translation = (currentIndex == (cards.count - 1) ? 0 : translation)
        
        //MARK: Since our card height = 220
        if translation > 110 {
            //MARK: Doing Boomerang effect and updating current index
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)){
                //Applying rotation and extra offset
                cards[currentIndex].isRotated = true
                //This should be slightly bigger than card Height
                cards[currentIndex].extraOffset = -350
                cards[currentIndex].scale = 0.7
            }
            
            // After a Little Delay Resetting Gesture offset and extra offset
            // Pushing Card into back using ZIndex
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)){
                    cards[currentIndex].zIndex = -100
                    for index in cards.indices {
                        cards[index].extraOffset = 0
                    }
                    //MARK: Updating current index
                    if currentIndex != (cards.count - 1) {
                        currentIndex += 1
                    }
                    offset = .zero
                }
            }
            
            // After animation completed resetting rotation and scaling and setting proper ZIndex Value
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                for index in cards.indices {
                    if index == currentIndex {
                        //MARK: Placing the card at right index
                        //NOTE: Since the current index is updated +1 previously
                        // So the current index wil be -1 now
                        if cards.indices.contains(currentIndex - 1) {
                            cards[currentIndex - 1].zIndex = ZIndex(card: cards[currentIndex - 1])
                        }
                        
                    } else {
                        cards[index].isRotated = false
                        withAnimation(.linear) {
                            cards[index].scale = 1
                        }
                    }
                }
                
                if currentIndex == (cards.count - 1) {
                    // Resetting index to 0
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        for index in cards.indices {
                            //Resetting Zindex
                            cards[index].zIndex = 0
                        }
                        currentIndex = 0
                    }
                }
            }
    } else {
            offset = .zero

        }
        
    }
    
    func ZIndex(card: Card) -> Double {
        let index = indexOf(card: card)
        let totalCount = cards.count
        
        //The > is here to reset the deck when finished scrolling
        return currentIndex > index ? Double(index - totalCount) : cards[index].zIndex
    }
    
    @ViewBuilder
    func CardView(card: Card, size: CGSize) -> some View {
        let index = indexOf(card: card)
        //MARK: YOUR CUSTOM VIEW
        Image(card.imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size.width, height: size.height)
            .blur(radius: card.isRotated && isBlurEnabled ? 6.5 : 0)
            //.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .scaleEffect(card.scale, anchor: card.isRotated ? .center: .top)
            .scaleEffect(card.scale)
            .rotation3DEffect(.init(degrees: isRotationEnabled && card.isRotated ? 360 : 0), axis: (x: 0, y: 0, z: 1))
        //This scales effect are for showing the card behind the front one
            .offset(y: -offsetFor(index: index))
            .offset(y: card.extraOffset)
            .scaleEffect(scaleFor(index: index), anchor: .top)
            .zIndex(card.zIndex)
        
    }
    
    //MARK: Scale And Offset Values for Each Card
    // We need to modify the problem of negative indexes
    func scaleFor(index value: Int) -> Double {
        let index = Double(value - currentIndex)
        //MARK: Showing Three cards (can change this)
        if index >= 0 {
            if index > 3 {
                return 0.8
            }
            // For Each Card 0.06 Scale will be reduced
            return 1 - (index / 15)
        } else {
            if -index > 3 {
                return 0.8
            }
            // For Each Card 0.06 Scale will be reduced
            return 1 + (index / 15)
        }
    }
    
    func offsetFor(index value: Int) -> Double {
        let index = Double(value - currentIndex)
        //MARK: Showing Three cards (can change this)
        if index >= 0 {
            if index > 3 {
                return 30
            }
            // For Each Card 0.06 Scale will be reduced
            return  (index * 10)
        } else {
            if -index > 3 {
                return 30
            }
            // For Each Card 0.06 Scale will be reduced
            return  (-index * 10)
        }
    }
    
    func indexOf(card: Card) -> Int {
        if let index = cards.firstIndex(where: { CCard in
            CCard.id == card.id
        }) {
            return index
        }
        return 0
    }
}

struct BoomerangCard_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
