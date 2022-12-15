//
//  CardView.swift
//  Freesbe
//
//  Created by Antonio Palomba on 15/12/22.
//

import SwiftUI

struct CardView: View {
    let card : EventInfo
    @State private var isDetailShow = false
    var body: some View {
        ZStack(alignment: .top) {
            Button {
                isDetailShow.toggle()
            } label: {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color("paletteCard"))
            }

           
           
           HStack(alignment: .top) {
               VStack(alignment: .leading) {
                   Text(card.title)
                       .foregroundColor(Color("paletteTitle"))
                       .font(.title.bold())
                   Text("by \(card.creator.name)")
                       .foregroundColor(Color("paletteTitle").opacity(0.5))
                       .font(.title2.bold())
                   Text(card.description ?? "No more infos")
                       .multilineTextAlignment(.leading)
                       .font(.subheadline)
                       .frame(width: 132)
                       .padding(.top, -5)
                   
               }
               .padding(.leading, 24)
               .padding(.top, 12)
               Spacer()
               VStack {
                   Circle()
                       .strokeBorder(lineWidth: 4)
                       .foregroundColor(.white)
                       .background(Circle().fill(.blue))
                       .frame(width: 80, height: 80)
                       .overlay {
                           Image("avatar")
                               .resizable()
                               .scaledToFill()
                               .mask(Circle().frame(width: 76))
                               
                       }
                   Text(card.category.name)
                       .padding(8)
                       .foregroundColor(.white)
                       .background(RoundedRectangle(cornerRadius: 40).fill(Color("paletteMain")))
               }
               .padding(.trailing, 24)
               .padding(.top, -30)
           }
           
       }
       .frame(width: 324 , height: 148, alignment: .center)
       .sheet(isPresented: $isDetailShow) {
           Text("Here the details")
               .presentationDetents([.bar])
       }
       
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: EventInfo.example)
    }
}
