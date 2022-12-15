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
    @State private var cards = Array<EventInfo>(repeating: EventInfo.example, count: 10)
    @State private var showingEditScreen = false
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
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
                if cards.isEmpty {
                    Button {
                        resetCards()
                    } label: {
                        Image(systemName: "arrow.uturn.forward.circle")
                    }
                }
                Button {
                    showingEditScreen.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                }
                .padding(.top, 50)

            }
            .sheet(isPresented: $showingEditScreen, onDismiss:  resetCards) {
                Text("lol")
            }
            .onAppear(perform: resetCards)
        }
    }
    func removeCard(at index: Int) {
        cards.remove(at: index)
    }
    func resetCards() {
        cards.removeAll()
        cards = Array(repeating: EventInfo.example, count: 10)
    }
}

struct StackOfActivityCardsView_Previews: PreviewProvider {
    static var previews: some View {
        StackOfActivityCardsView()
    }
}
