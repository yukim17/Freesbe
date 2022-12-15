//
//  ContentView.swift
//  Freesbe
//
//  Created by Ekaterina Grishina on 06/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(.white)
                
                WaveFilled()
                
                VStack {
                    TopMenuView(isActive: $isActive)
                    NavigationLink(destination: Text(""), isActive: $isActive) {
                    }
                    .labelsHidden()
                    
                    SegmentedPickerView()
                        
                }
                
            }
            .foregroundColor(Color("BG"))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
