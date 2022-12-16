//
//  CarouselView.swift
//  Freesbe
//
//  Created by Antonio Palomba on 12/12/22.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 6)
    }
}

struct StackOfActivityCardsView: View {
    @State private var cards: [EventInfo] = FreesbeDB().arrayOfCreatedEvents
    @State private var showingEditScreen = false
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack {
                            if !cards.isEmpty {
                                Text(cards[cards.count - 1].title)
                                    .font(.title)
                                    .foregroundColor(Color("paletteMain"))
                                Text(cards[cards.count - 1].category.name)
                                    .font(.title2)
                                    .padding(8)
                                    .foregroundColor(.white)
                                    .background(RoundedRectangle(cornerRadius: 40).fill(Color("paletteMain")))
                                    .padding(.top, -15)
                            }
                            ActivityCardView(card: cards[index]) {
                                withAnimation {
                                    removeCard(at: index)
                                }
                            }
                            .stacked(at: index, in: cards.count)
                            //Allow only the move of the top card
                            .allowsHitTesting(index == cards.count - 1)
                            //Allow only the top card to be read
                            .accessibilityHidden(index < cards.count - 1)
                        }
                    }
                }
                if cards.isEmpty {
                    VStack {
                        Text("End of the feed")
                            .font(.title)
                            .foregroundColor(Color("paletteTitle"))
                        Text("Refresh to check new Freesbes ")
                            .font(.subheadline)
                            .foregroundColor(Color("paletteTitle"))
                        Button {
                            resetCards()
                        } label: {
                            Image(systemName: "arrow.uturn.forward.circle")
                                .font(.largeTitle)
                        }
                        .padding(.top, 20)
                    }
                    .padding(.top,200)
                }
                Spacer(minLength: 30)
                ZStack {
                    Circle()
                        .stroke(Color("paletteMain"),lineWidth: 2)
                        .frame(width: 70, height: 70)

                    PJRPulseButton(color: Color("paletteMain"), systemImageName: "hand.wave.fill", buttonWidth: 50, numberOfOuterCircles: 3)
                }
                .ignoresSafeArea()
            }
            
            .sheet(isPresented: $showingEditScreen, onDismiss:  resetCards) {
                Text("lol")
            }
        }
    }
    func removeCard(at index: Int) {
        cards.remove(at: index)
    }
    func resetCards() {
        cards.removeAll()
        cards = FreesbeDB().arrayOfCreatedEvents
    }
}

struct StackOfActivityCardsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
