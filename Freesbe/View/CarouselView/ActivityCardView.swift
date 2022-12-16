//
//  BoomerangCard.swift
//  Freesbe
//
//  Created by Antonio Palomba on 12/12/22.
//

import SwiftUI

struct ActivityCardView: View {
    let card: EventInfo
    var removal: (() -> Void)? = nil
    
    private let feedback = UINotificationFeedbackGenerator()
    
    @State private var offset = CGFloat.zero
    @State private var scaleAmount: CGSize = CGSize(width: 1, height: 1)
    @State private var opacityValue: Double = 1
    @State private var isRotated = false
    @State private var isModalShown = false
    @State private var isShowingDetails = false
    
    
    
    var body: some View {
        ZStack{
            Image("friesbenoimage")
                .resizable()
                .shadow(color: .black.opacity(0.2),radius: 10,y: 10)
                .overlay {
                    Image(card.category.name)
                        .resizable()
                        .scaledToFill()
                        .mask(Circle().frame(width: 240, height: 240))
                }
        }
        .frame(width: 380, height: 380, alignment: .center)
        .rotation3DEffect(Angle(degrees: self.isRotated ? 360 * 20 : 0), axis: (x: 0, y: 0, z: 1), anchor: .center)
        .scaleEffect(scaleAmount)
        .offset(y: offset)
        .opacity(opacityValue)
        //Accessibility adds a border to the tappable  card
        .accessibilityAddTraits(.isButton)
        .animation(.spring(), value: offset)
        .animation(.default, value: offset)
        .animation(.easeInOut(duration: 10), value: scaleAmount)
        .sheet(isPresented: $isModalShown) { Text("You CAUGHT the project") }
        .sheet(isPresented: $isShowingDetails) { Text("Here the details").presentationDetents([.bar]) }
        .onTapGesture {
            isShowingDetails.toggle()
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                        offset = gesture.translation.height
                        feedback.prepare()
                    }
                }
                .onEnded { value in
                    let translation = value.translation.height
                    if translation < -100 {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)){
                            offset = value.translation.height - 350
                            isRotated = true
                            feedback.notificationOccurred(.success)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                offset = .zero
                                opacityValue = 0.0
                                scaleAmount = CGSize(width: 0, height: 0)
                                removal?()
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                isRotated = false
                            }
                        }
                        // feedback.notificationOccurred(.error)
                        
                    }  else if translation > 100 {
                        feedback.notificationOccurred(.success)
                        isModalShown = true
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)){
                            offset = .zero
                            
                        }
                    } else {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)){
                            offset = .zero
                        }
                    }
                })
    }
}

struct CardViewActivity_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCardView(card: EventInfo.example)
    }
}
