//
//  InformationsView.swift
//  Freesbe
//
//  Created by Antonio Palomba on 16/12/22.
//

import SwiftUI

struct InformationsView: View {
    @Environment(\.dismiss) var dismiss
    let card: EventInfo
    
    var body: some View {
        ZStack(alignment: .top){
            Rectangle()
                .foregroundColor(Color("paletteCard"))
            VStack {
                Spacer()
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: 700)
            }
            VStack {
                HStack  {
                    Image(systemName: "person.fill")
                        .font(.title)
                    Text("22")
                    Spacer()
                    Button("Close", action: done)
                        .foregroundColor(Color("paletteTitle"))
                        .fontWeight(.bold)
                    
                }
                .padding(.leading, 30)
                .padding(.trailing, 30)
                .padding(.top, 18)
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(card.title)
                            .foregroundColor(Color("paletteTitle"))
                            .font(.title.bold())
                            .padding(.top, 30)
                        Text("by \(card.creator.name)")
                            .foregroundColor(Color("paletteTitle").opacity(0.5))
                            .font(.title2.bold())
                        Text(card.category.name)
                            .padding(8)
                            .foregroundColor(.white)
                            .background(RoundedRectangle(cornerRadius: 40).fill(Color("paletteMain")))
                        
                        
                    }
                    .padding(.leading, 24)
                    .padding(.top, 12)
                    
                    Spacer()
                    
                    VStack {
                        Circle()
                            .strokeBorder(lineWidth: 4)
                            .foregroundColor(.white)
                            .background(Circle().fill(.blue))
                            .frame(width: 100, height: 100)
                            .overlay {
                                Image(card.creator.username)
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                            }
                        Text("\(card.creator.name) \(card.creator.surname) ")
                            .font(.title2.bold())
                        
                    }
                    .padding(.trailing, 40)
                    .padding(.top, 24)
                }
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 342, height: 1, alignment: .center)
                    .padding(.top,20)
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text(card.place)
                        .font(.title2.bold())
                        .foregroundColor(Color("paletteTitle"))
                    Spacer()
                    Image(systemName: "clock")
                    Text(card.date)
                        .font(.title2.bold())
                        .foregroundColor(Color("paletteTitle"))
                }
                .padding(.horizontal, 15)
                .padding(10)
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 342, height: 1, alignment: .center)
                Text(card.description ?? "No additional infos")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("paletteMain"))
                    .fontWeight(.bold)
                    .font(.title3)
                    .padding(.top, 30)
                    .padding(.horizontal, 14)
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 342, height: 1, alignment: .center)
                    .padding(.top, 20)
            }
            
        }
    }
    func done() {
        dismiss()
    }
}

struct InformationsView_Previews: PreviewProvider {
    static var previews: some View {
        InformationsView(card: EventInfo.example)
    }
}
