//
//  UserInfo.swift
//  Freesbe
//
//  Created by Ekaterina Grishina on 13/12/22.
//

import Foundation

enum UserRole: String {
    case creator
    case participant
}

struct UserInfo: Decodable {
    var id: UUID?
    var name: String
    var surname: String
    var username: String
}
