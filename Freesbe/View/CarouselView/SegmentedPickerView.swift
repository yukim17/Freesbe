//
//  SegmentedPickerView.swift
//  Freesbe
//
//  Created by Antonio Palomba on 12/12/22.
//

import SwiftUI

enum MainCategory: String, CaseIterable {
    case Feed, Caught, Launched
}

struct SegmentedPickerView: View {
    @State var cards: [Card] = [
        Card(imageName: "Card 1", informations: Activity(throwerAvatar: "ahmedmguaavatar", cardTitle: "Swift Cafe", tag: "Code", time: "11:30", location: "Lab-3", thrower: "Ahmed Mgua", description: "Lorem ipsum")),
        Card(imageName: "Card 2", informations: Activity(throwerAvatar: "ahmedmguaavatar", cardTitle: "Swift Cafe", tag: "Code", time: "11:30", location: "Lab-3", thrower: "Ahmed Mgua", description: "Lorem ipsum")),
        Card(imageName: "Card 3", informations: Activity(throwerAvatar: "ahmedmguaavatar", cardTitle: "Swift Cafe", tag: "Code", time: "11:30", location: "Lab-3", thrower: "Ahmed Mgua", description: "Lorem ipsum")),
        Card(imageName: "Card 4", informations: Activity(throwerAvatar: "ahmedmguaavatar", cardTitle: "Swift Cafe", tag: "Code", time: "11:30", location: "Lab-3", thrower: "Ahmed Mgua", description: "Lorem ipsum"))
    ]
    
    let segmentedCategories = ["Feed", "Catched", "Launched"]
    @State private var selectedCategory: MainCategory = .Feed
    
    init() {
        
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "addbutton")
        UISegmentedControl.appearance().backgroundColor = UIColor(named: "SegmentedPickerBG")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }
    
    var body: some View {
        VStack {
            Picker("Main categories", selection: $selectedCategory) {
                ForEach(MainCategory.allCases, id: \.self) { selection in
                    Text(selection.rawValue)
                }
            }
            .padding(.horizontal, 32)
            .pickerStyle(.segmented)
            
            switch selectedCategory {
            case .Feed:
                CarouselView(cards: $cards)
            case .Caught:
                ScrollView(.vertical, showsIndicators: false) {
                    CaughtCardView(arrayOfCaughtCards: $cards)
                        .padding(.top, 20)
                        
                }
                //There is a bug with the shadow of cards, you need to add a positive padding to the VStack of the cards too
                //.padding(.horizontal, -20)
                .padding(.bottom, -50)
            case .Launched:
                ScrollView(.vertical, showsIndicators: false) {
                    LaunchedCardView(arrayOfLaunchedCards: $cards)
                        .padding(.top, 20)
                }
                //There is a bug with the shadow of cards, you need to add a positive padding to the VStack of the cards too
                .padding(.bottom, -50)
            }
            Spacer()
        }
    }
}

struct SegmentedPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedPickerView()
    }
}
