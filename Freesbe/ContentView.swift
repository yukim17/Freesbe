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
                TopMenuView()
                    
                
                SegmentedPickerView()
                    .padding(.top, 60)
                    
                
                
                
                Spacer(minLength: 10)
                
                
            }
            
        }
        .foregroundColor(Color("BG"))
        
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
