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
    
    @State private var selectedCategory: MainCategory = .Feed
    
    init() {
        
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "addbutton")
        UISegmentedControl.appearance().backgroundColor = UIColor(named: "SegmentedPickerBG")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "paletteTitle")], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    var body: some View {
        VStack {
            Picker("Main categories", selection: $selectedCategory) {
                ForEach(MainCategory.allCases, id: \.self) { selection in
                    Text(selection.rawValue)
                }
            }
            .frame(width: 340)
            .padding(.top, 30)
            .pickerStyle(.segmented)
            
            switch selectedCategory {
            case .Feed:
                VStack {
                    Spacer()
                    StackOfActivityCardsView()
                    
                        
                }
            case .Caught:
                HStack(alignment: .top) {
                    ScrollView(.vertical, showsIndicators: false) {
                        CaughtCardView(arrayOfCaughtCards: EventInfo.arrayOfAcceptedEvents)
                    }
                }
            case .Launched:
                HStack(alignment: .top) {
                    ScrollView(.vertical, showsIndicators: false) {
                        LaunchedCardView(arrayOfLaunchedCards: EventInfo.arrayOfLaunchedEvents)
                    }
                }
            }
        }
        Spacer()
    }
}

struct SegmentedPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
