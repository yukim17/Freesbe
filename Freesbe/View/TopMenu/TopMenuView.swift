//
//  TopMenu.swift
//  Freesbe
//
//  Created by Antonio Palomba on 12/12/22.
//

import SwiftUI

extension PresentationDetent {
    static let bar = Self.fraction(0.8)
}

struct TopMenuView: View {
    @State private var showAddNewFreesbe = false
    @Binding var isActive: Bool
    
    var body: some View {
        VStack {
            HStack {
                
                Menu {
                    Button {
                        isActive = true

                    } label: {
                        HStack {
                            Text("Settings")
                            Image(systemName: "gear")
                        }
                    }
                    Button {
                        //
                    } label: {
                        HStack {
                            Text("Logout")
                            Image(systemName: "square.and.arrow.up")
                        }
                    }
                    
                } label: {
                    Image(TopMenu().personalImage)
                        .resizable()
                        .scaledToFill()
                        .offset(x: 3)
                        .frame(width: 50, height: 50, alignment: .center)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(.white, lineWidth: 4)
                        )

                        .padding(.leading, 32)
                }
                
                
                
                
                VStack(alignment: .leading) {
                    Text("Happy \(TopMenu().dayOfTheWeek)")
                        .foregroundColor(.white)
                    Text(TopMenu().personalName)
                        .font(.title.bold())
                        .foregroundColor(.white)
                    
                    
                }
                Spacer()
                Spacer()
                
                ZStack {
                    
                    Image("sideBubble")
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                    Button {
                        showAddNewFreesbe.toggle()
                    } label: {
//                        ZStack{
 
                            //                        Circle()
                            //                            .frame(width: 50, height: 50)
                            //                            .foregroundColor(Color("addbutton"))
                            //                        Circle()
                            //                            .stroke(style: .init(lineWidth: 2))
                            //                            .foregroundColor(.black.opacity(0.10))
                            //                            .frame(width: 38, height: 38)
                            //                        Circle()
                            //                            .stroke(style: .init(lineWidth: 1))
                            //                            .foregroundColor(.black.opacity(0.10))
                            //                            .frame(width: 45, height: 45)
                            Image(systemName: "plus")
                            .foregroundColor(Color("BG"))
                                .font(.title2)
                                .font(.system(size: 15))
                                .padding(.trailing, 25)
                            
//                        }
                    }
                    
                    .padding(.trailing, 3)
                }
                
                
            }
            
        }
        .padding(.top, 10)
        .sheet(isPresented: $showAddNewFreesbe) {
            AddNewFreesbeView()
                .presentationDetents([.bar])
        }
        Spacer()
        
    }
}

struct TopMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TopMenuView(isActive: .constant(false)).preferredColorScheme(.dark)
        
    }
}
