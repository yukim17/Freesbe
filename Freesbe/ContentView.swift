//
//  ContentView.swift
//  Freesbe
//
//  Created by Ekaterina Grishina on 06/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color("BG"))
            
            WaveFilled()
            
            VStack {
                Image("BannerTop")
                    .frame(height: 80, alignment: .center)
                
                Spacer(minLength: 80)
                
                CarouselView()
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
