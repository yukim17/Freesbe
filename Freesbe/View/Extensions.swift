//
//  Extensions.swift
//  Freesbe
//
//  Created by Aleksandr Shapovalov on 12/12/22.
//

import SwiftUI
//MARK: Corner extension
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

//MARK: fraction statics
extension PresentationDetent {
    static let smallView = Self.fraction(0.7)
    static let largeView = Self.fraction(0.9)
}
