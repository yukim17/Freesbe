//
//  WaveFilled.swift
//  Freesbe
//
//  Created by Antonio Palomba on 12/12/22.
//

import SwiftUI

struct WaveFilled: View {
    @State private var change = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                WaveMath(yOffset: change ? -0.8 : -0.2)
                    .fill(Color("wave1").opacity(0.2))
                    .frame(height: 150.0)
                    .animation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true))
                
                WaveMath(yOffset: change ? -0.5 : -0.1)
                    .fill(Color("wave1").opacity(0.2))
                    .frame(height: 150.0)
                    .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true))
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear(perform: animationStart)
    }
    
    func animationStart() {
        change.toggle()
    }
}

struct WaveFilled_Previews: PreviewProvider {
    static var previews: some View {
        WaveFilled()
    }
}
