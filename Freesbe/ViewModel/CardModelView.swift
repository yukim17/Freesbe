//
//  CardModelView.swift
//  Freesbe
//
//  Created by Antonio Palomba on 13/12/22.
//

import Foundation

class FreesbeDB: ObservableObject {
    @Published var cards: [Card] = [
        Card(imageName: "Card 1", informations: Activity(throwerAvatar: "ahmedmguaavatar", cardTitle: "Swift Cafe", tag: "Code", time: "11:30", location: "Lab-3", thrower: "Ahmed Mgua", description: "Lorem ipsum")),
        Card(imageName: "Card 2", informations: Activity(throwerAvatar: "ahmedmguaavatar", cardTitle: "Swift Cafe", tag: "Code", time: "11:30", location: "Lab-3", thrower: "Ahmed Mgua", description: "Lorem ipsum")),
        Card(imageName: "Card 3", informations: Activity(throwerAvatar: "ahmedmguaavatar", cardTitle: "Swift Cafe", tag: "Code", time: "11:30", location: "Lab-3", thrower: "Ahmed Mgua", description: "Lorem ipsum")),
        Card(imageName: "Card 4", informations: Activity(throwerAvatar: "ahmedmguaavatar", cardTitle: "Swift Cafe", tag: "Code", time: "11:30", location: "Lab-3", thrower: "Ahmed Mgua", description: "Lorem ipsum"))
    ]
}
