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
                        .padding(.leading, 32)
                }
                
                
                
                
                VStack(alignment: .leading) {
                    Text("Happy \(TopMenu().dayOfTheWeek)")
                    Text(TopMenu().personalName)
                        .font(.title.bold())
                        
                    
                    
                }
                Spacer()
                Button {
                    showAddNewFreesbe.toggle()
                } label: {
                    ZStack{
                        Image("topplusbutton")
                            .resizable()
                            .frame(width: 70, height: 42)
                    }
                }
                
                
                
            }
            
        }
        .foregroundColor(Color("paletteTitle"))
        .padding(.top, 10)
        .sheet(isPresented: $showAddNewFreesbe) {
            AddNewFreesbeView()
                .presentationDetents([.bar])
        }
        Spacer()
        
    }
    func toggleModal() {
        showAddNewFreesbe = false
    }
}

struct TopMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TopMenuView(isActive: .constant(false)).preferredColorScheme(.light)
        
    }
}
