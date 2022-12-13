//
//  SwipeToLaunchButton.swift
//  Freesbe
//
//  Created by Antonio Palomba on 12/12/22.
//

import SwiftUI

struct SwipeToLaunchButton: View {
    @State var viewState = CGSize(width: 40, height: 50)
    var body: some View {
        HStack{

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
                                      }
                                  }
                           )

                    Image(systemName: "chevron.right")
                        .offset(x: viewState.width)
                        .gesture(
                            DragGesture().onChanged { value in
                                 viewState = value.translation
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
                            .foregroundColor(Color("BG"))
                            .frame(width: 300,height: 70)
                        Text("Swipe to Launch!")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                    }
                )
    }
}

struct SwipeToLaunchButton_Previews: PreviewProvider {
    static var previews: some View {
        SwipeToLaunchButton()
    }
}
