//
//  WaveMath.swift
//  Freesbe
//
//  Created by Antonio Palomba on 12/12/22.
//

import SwiftUI

struct WaveMath: Shape {
    var yOffset: CGFloat = 0.5
    
    var animatableData: CGFloat {
        get {
            return yOffset
        }
        set {
            yOffset = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        //Curves at the bottom
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                      control1: CGPoint(x: rect.maxY * 1.25, y: rect.midY - (rect.maxY * yOffset)),
                      control2: CGPoint(x: rect.maxX * 0.25, y: rect.maxY * 1.5 + (rect.maxY * yOffset)))
        path.closeSubpath()
        
        return path
    }
}


struct WaveMath_Previews: PreviewProvider {
    static var previews: some View {
        WaveMath(yOffset: 0.7)
            .stroke(Color.red, lineWidth: 5)
            .frame(height: 200)
    }
}
