//
//  ModalView.swift
//  Freesbe
//
//  Created by Aleksandr Shapovalov on 12/12/22.
//

import SwiftUI

struct ModalView: View {
    @Environment(\.dismiss) var dismiss
    @State private var hasJoined = false
    
    var body: some View {
        VStack {
            headerView
                .padding()
            ZStack {
                rectangleBackground
               
                VStack (alignment: .leading) {
                    topicView
                    infoView
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    dividerView
                    descriptionView
                    Spacer()
                    Spacer()
                    buttonView
                    Spacer()
                }
                .padding(.top)
            }
            .ignoresSafeArea()
            .padding(.top, -15)
        }
        .background(.white)
    }
}








extension ModalView {
    
    //MARK: header info
    var headerView: some View {
        HStack {
            
            //MARK: View variant with circle avatar participants
            
            //                ZStack {
            //                    Circle()
            //                        .frame(width: 38, height: 38)
            //                        .foregroundColor(.red)
            //                    Circle()
            //                        .frame(width: 38, height: 38)
            //                        .foregroundColor(.mint)
            //                        .offset(x: 25)
            //                    Circle()
            //                        .frame(width: 38, height: 38)
            //                        .foregroundColor(.purple)
            //                        .offset(x: 50)
            //
            //                    ZStack{
            //                        Circle()
            //                            .frame(width: 38, height: 38)
            //                            .foregroundColor(.blue)
            //                        Text("+10")
            //                            .foregroundColor(.white)
            //                            .font(.footnote)
            //                    }
            //                    .offset(x: 75)
            //                }
            
            
            //MARK: View variant with number participants
            HStack {
                Image(systemName: "person.2.fill")
                    .foregroundColor(.blue)
                    .font(.system(size: 22))
                Text("10")
                    .foregroundColor(.black)
                    .font(.system(size: 22))
            }
            Spacer ()
            
            
            //MARK: Category or joined status
            if hasJoined {
                HStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(Color(.systemGreen))
                        .font(.system(size: 32))
                    
                    Text("You joined")
                        .font(.subheadline).bold()
                        .frame(width: 120, height: 38)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
                        .background(
                            RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color.black))
                        .foregroundColor(.white)
                }
                
            } else {
                HStack {
                    Text("Coding")
                        .font(.subheadline).bold()
                        .frame(width: 80, height: 38)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
                        .background(
                            RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color.blue))
                        .foregroundColor(.white)
                }
            }
        }
    }
    
    
    //MARK: background frame
    var rectangleBackground: some View {
        Rectangle()
            .cornerRadius(15, corners: [.topLeft, .topRight])
        
            .foregroundColor(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    .background(.mint)
                    .opacity(0.3)
            )
            .shadow(color: Color.gray.opacity(0.4), radius: 4)
            .padding(.top)
            .background(.white)
    }
    
    //MARK: topic info
    var topicView: some View {
        HStack {
            Text("SwiftUI Interlude course")
                .font(.system(size: 35)).bold()
                .foregroundColor(.black)
                .padding([.leading, .trailing, .top])
            
            Spacer()
            
            //it's just a "placeholder" - need to decide
            Image("Card 1")
                .resizable()
                .frame(width: 56, height: 56)
                .foregroundColor(.blue)
                .padding([.top, .trailing])
        }
    }
    
    //MARK: date and location info
    var infoView: some View {
        HStack {
            Image(systemName: "calendar")
                .foregroundColor(.black)
                .frame(width: 28, height: 28, alignment: .leading)
            
            Text("31 December")
                .font(.system(size: 15))
                .offset(x: -11)
                .foregroundColor(.black)
            
            HStack {
                Image(systemName: "clock")
                    .foregroundColor(.black)
                    .frame(width: 28, height: 28, alignment: .leading)
                
                Text("12:00")
                    .font(.system(size: 15))
                    .offset(x: -11)
                    .foregroundColor(.black)
            }
            
            HStack {
                Image(systemName: "location.fill")
                    .foregroundColor(.mint)
                    .frame(width: 28, height: 28, alignment: .leading)
                
                Text("Collab 03-02")
                    .font(.system(size: 15))
                    .offset(x: -12)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
    
    //MARK: description title and description text
    var descriptionView: some View {
        
        VStack(alignment:.leading) {
            HStack{
                Text("Description")
                    .font(.system(size: 22)).bold()
                    .foregroundColor(.black)
                    .padding([.leading, .trailing, .top])
            }
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam commodo sem non nulla laoreet, eget tincidunt odio feugiat.")
                .font(.system(size: 16))
                .foregroundColor(.black)
                .padding([.leading, .trailing])
                .padding(.top, 1)
                .padding(.bottom, 15)
        }
    }
    
    
    var dividerView: some View {
        Divider()
            .frame(maxWidth: 380)
            .overlay(.gray)
            .padding([.trailing, .leading])
    }
    
    //MARK: button with joining function (ACTIVE PROGRESS: animations etc.)
    var buttonView: some View {
        HStack {
            Spacer ()
            ZStack {
                Button {
                    withAnimation {
                        hasJoined.toggle()
                    }
                } label: {
                    Image("button")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 5)
                        .frame(maxWidth: 150, alignment: .center)
                }
                Image("lines")
                    .offset(x: -50, y: -50)
            }
            Spacer()
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}



