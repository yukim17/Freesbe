//
//  Card.swift
//  Freesbe
//
//  Created by Antonio Palomba on 12/12/22.
//

import Foundation

// MARK: Card Model

struct Card: Identifiable {
    var id: String = UUID().uuidString
    var imageName: String
    var isRotated: Bool = false
    var scale: CGFloat = 1
    var zIndex: Double = 0
    var extraOffset : Double = 0
}
