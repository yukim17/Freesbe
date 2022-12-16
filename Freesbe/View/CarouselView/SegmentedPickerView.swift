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
        VStack(spacing: 30) {
            
            Picker("Main categories", selection: $selectedCategory) {
                ForEach(MainCategory.allCases, id: \.self) { selection in
                    Text(selection.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 16)
            
            switch selectedCategory {
            case .Feed:
                    StackOfActivityCardsView()
                
            case .Caught:
                        CaughtCardView(arrayOfCaughtCards: FreesbeDB().arrayOfCaughtEvents)
    
            case .Launched:
                        LaunchedCardView(arrayOfLaunchedCards: FreesbeDB().arrayOfLaunchedEvents)
            }
        }
       
        
    }
}

struct SegmentedPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
