//
//  EventInfo.swift
//  Freesbe
//
//  Created by Ekaterina Grishina on 13/12/22.
//

import Foundation

struct EventInfo: Decodable {
    var id: UUID?
    var title: String
    var description: String?
    var date: String
    var place: String
    var category: Category
    var creator: UserInfo
    var participants: [UserInfo]?
}
