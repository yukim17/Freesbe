//
//  EventInfo.swift
//  Freesbe
//
//  Created by Ekaterina Grishina on 13/12/22.
//

import Foundation

struct EventInfo: Identifiable, Decodable {
    var id: UUID?
    var title: String
    var description: String?
    var date: String
    var place: String
    var category: Category
    var creator: UserInfo
    var participants: [UserInfo]?
}

// this is used in order to let the compiler know that it should be used only while working on xcode and it will not included inside the release version of the app
#if DEBUG
extension EventInfo {
    static let example = EventInfo(
        title: "Swift Cafe",
        description: "Learn how to code with Swift by following simple examples provided trough Git.",
        date: "23 December, 11:00",
        place: "Lab-3",
        category: Category(
            name: "Code",
            color: "blue",
            description: "Improve your coding skills"),
            creator: UserInfo(
                name: "Ahmy",
                surname: "Guam",
                username: "iamamhy"
            ))
}
#endif
