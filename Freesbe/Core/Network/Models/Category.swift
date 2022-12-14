//
//  Category.swift
//  Freesbe
//
//  Created by Ekaterina Grishina on 13/12/22.
//

import Foundation

struct Category: Decodable {
    var id: UUID?
    var name: String
    var color: String
    var description: String
}
