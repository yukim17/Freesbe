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
    static let example = EventInfo(title: "Swift Cafe", description: "hellow", date: "12:00", place: "Lab-3", category: Category(name: "Code", color: "blue", description: "Improve your coding skills"), creator: UserInfo(name: "Ahmed", surname: "Mgua", username: "iamahmed"))
    
    static let arrayOfAcceptedEvents = [
        EventInfo(title: "Swift Cafe", description: "Learn how to code with Swift by following simple examples provided trough Git.", date: "23 December, 11:00", place: "Lab-3", category: Category(name: "Code", color: "blue", description: "Improve your coding skills"), creator: UserInfo(name: "Ahmy", surname: "Guam", username: "iamahmy")),
        EventInfo(title: "Photography Club", description: "Practice the basics of phototgraphy and share tip and tricks with the other people.", date: "23 December 12:00", place: "Lab-2", category: Category(name: "Code", color: "gray", description: "Enjoy different activities"), creator: UserInfo(name: "Tony", surname: "Palo", username: "iamtony")),
        EventInfo(title: "Card Tournament", description: "An amazing tournament to challenge other people. Lot of fun!", date: "10:00", place: "Lab-2", category: Category(name: "Code", color: "gray", description: "Enjoy different activities"), creator: UserInfo(name: "Siria", surname: "Paxolli", username: "crazysiria1")),
        EventInfo(title: "Cinema time", description: "Let's choose together something to watch in the Seminar.", date: "13:00", place: "Seminar", category: Category(name: "Code", color: "gray", description: "Enjoy different activities"), creator: UserInfo(name: "Luha", surname: "Bello", username: "iamluha"))
    ]
    
    static let arrayOfLaunchedEvents = [
        EventInfo(title: "Photography Club", description: "Practice the basics of phototgraphy and share tip and tricks with the other people.", date: "23 December 12:00", place: "Lab-2", category: Category(name: "Code", color: "gray", description: "Enjoy different activities"), creator: UserInfo(name: "Vitaliy", surname: "Asimov", username: "iamvitaliy"))
    ]
}
#endif
