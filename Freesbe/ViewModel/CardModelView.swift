//
//  CardModelView.swift
//  Freesbe
//
//  Created by Antonio Palomba on 13/12/22.
//

import Foundation

class FreesbeDB: ObservableObject, Identifiable {
    
    @Published var arrayOfCreatedEvents: [EventInfo] = [
        EventInfo(
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
                    username: "iamahmy"
                )),
        
        EventInfo(
            title: "Photography",
            description: "Share tip and tricks that you use for taking picture!",
            date: "23 December, 12:00",
            place: "Lab-2",
            category: Category(
                name: "Photo",
                color: "blue",
                description: "Improve you photo skills"),
                creator: UserInfo(
                    name: "Tony",
                    surname: "Palo",
                    username: "iamtony"
                )),
        
        EventInfo(
            title: "Secrets of Art",
            description: "Open discussion on the tricks that artist usually adopt during creative process",
            date: "22 December, 9:00",
            place: "Lab-3",
            category: Category(
                name: "Art",
                color: "blue",
                description: "Improve your art skills"),
                creator: UserInfo(
                    name: "Lory",
                    surname: "Ascione",
                    username: "iamlory"
                )),
        
        EventInfo(
            title: "Talk-Food",
            description: "Advice on Naples dishes for foreigners students, share with us your favourite dishes",
            date: "21 December, 11:00",
            place: "Lab-2",
            category: Category(
                name: "Food",
                color: "blue",
                description: "Learn about cooking"),
                creator: UserInfo(
                    name: "Sofia",
                    surname: "Palini",
                    username: "iamsofia"
                )),
        
        EventInfo(
            title: "Cinema Time",
            description: "Let's decide together something to see in seminar!",
            date: "23 December, 9:00",
            place: "Seminar",
            category: Category(
                name: "Cinema",
                color: "blue",
                description: "Activity together"),
                creator: UserInfo(
                    name: "Luha",
                    surname: "Aucella",
                    username: "iamluha"
                ))]
        
        @Published var arrayOfCaughtEvents: [EventInfo] = [
        EventInfo(
            title: "Gamification",
            description: "Learn about gamification and the techniques you can apply in your projects",
            date: "23 December, 11:00",
            place: "Lab-2",
            category: Category(
                name: "Game",
                color: "blue",
                description: "Improve your game designer skills"),
                creator: UserInfo(
                    name: "Santo",
                    surname: "Santissimo",
                    username: "iamsanto"
                ))
        
       /* EventInfo(
            title: "Creating music",
            description: "Tips and tricks on how create incredible music for your apps",
            date: "23 December, 11:00",
            place: "Seminar",
            category: Category(
                name: "Music",
                color: "blue",
                description: "Improve you musician skills"),
                creator: UserInfo(
                    name: "Danilo",
                    surname: "Perchietti",
                    username: "iamdanilo"
                ))*/ ]
        
        @Published var arrayOfLaunchedEvents: [EventInfo] = [
        EventInfo(
            title: "Bocce on chairs",
            description: "Challenge the best bocciatori in epic battles",
            date: "21 December, 10:00",
            place: "Lab-2",
            category: Category(
                name: "Sport",
                color: "blue",
                description: "Improve your game designer skills"),
                creator: UserInfo(
                    name: "Vitaliy",
                    surname: "Kayak",
                    username: "iamvitaliy"
                ))]
}
