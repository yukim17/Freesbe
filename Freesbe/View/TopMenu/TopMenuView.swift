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
                        withAnimation(.spring()) {
                            showAddNewFreesbe.toggle()
                        }
                    } label: {
                        
                        ZStack {

                            Image(systemName: "plus")
                                .foregroundColor(Color("BG"))
                                .font(.title2)
                                .font(.system(size: 15))
                                .padding(.trailing, 25)
                            
                           
                        }
                        
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


struct Bubble: Shape {
    var yOffset: CGFloat = 0.5
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
            
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            
            
            path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                          control1: CGPoint(x: rect.maxY * 1.25, y: rect.midY - (rect.maxY * yOffset)),
                          control2: CGPoint(x: rect.maxX * 0.25, y: rect.maxY * 1.5 + (rect.maxY * yOffset)))
            path.closeSubpath()
        return path
        }
    }

