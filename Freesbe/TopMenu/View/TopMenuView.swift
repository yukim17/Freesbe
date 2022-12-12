//
//  TopMenu.swift
//  Freesbe
//
//  Created by Antonio Palomba on 12/12/22.
//

import SwiftUI

struct TopMenuView: View {
    var body: some View {
        VStack {
            HStack {
                Image(TopMenu().personalImage)
                    .resizable()
                    .scaledToFill()
                    .offset(x: 3)
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipShape(Circle())
                    .padding(.leading, 32)
                
                VStack(alignment: .leading) {
                    Text("Happy \(TopMenu().dayOfTheWeek)")
                    Text(TopMenu().personalName)
                        .font(.title.bold())
                    
                }
                Spacer()
                Button {
                    //Add action to the button
                } label: {
                    ZStack{
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color("addbutton"))
                        Circle()
                            .stroke(style: .init(lineWidth: 2))
                            .foregroundColor(.black.opacity(0.10))
                            .frame(width: 38, height: 38)
                        Circle()
                            .stroke(style: .init(lineWidth: 1))
                            .foregroundColor(.black.opacity(0.10))
                            .frame(width: 45, height: 45)
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .font(.title2)
                    }
                }
                .padding(.trailing, 32)
                      

            }
            
        }
        Spacer()
    }
}

struct TopMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TopMenuView()
        
    }
}
