//
//  SwipeToLaunchButton.swift
//  Freesbe
//
//  Created by Antonio Palomba on 12/12/22.
//

import SwiftUI

struct SwipeToLaunchButton: View {
    @State var viewState = CGSize(width: 45, height: 50)
    private let feedback = UINotificationFeedbackGenerator()

    var action: (() -> Void)? = nil
    
    var body: some View {
        HStack {
               ZStack {

                    Image("freesbeempty")
                       .resizable()
                         .frame(width: 70, height: 70)
                         .offset(x: viewState.width)
                         .gesture(
                             DragGesture().onChanged { value in
                                  viewState = value.translation
                             }
                                  .onEnded { value in
                                      withAnimation(.spring()) {
                                          viewState = CGSize(width: 40, height: 50)
                                          feedback.notificationOccurred(.success)
                                          action?()
                                      }
                                  }
                           )

                    Image(systemName: "chevron.right")
                        .offset(x: viewState.width)
                        .gesture(
                            DragGesture().onChanged { value in
                                
                                 viewState = value.translation
                                
                                if value.translation.width > 275 {
                                    feedback.notificationOccurred(.success)
                                   // action?()
                                }
                            }
                                 .onEnded { value in
                                      withAnimation(.spring()) {
                                           viewState = CGSize(width: 40, height: 50)
                                      }
                                 }
                         )
                      }
                     Spacer()
                  }.background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(Color("paletteCard"))
                            .frame(width: 300,height: 70)
                        Text("Swipe to Launch!")
                            .font(.title3.bold())
                            .foregroundColor(Color("paletteTitle"))
                    }
                )
    }
}

struct SwipeToLaunchButton_Previews: PreviewProvider {
    static var previews: some View {
        SwipeToLaunchButton()
    }
}
