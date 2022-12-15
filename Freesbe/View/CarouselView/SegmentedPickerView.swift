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
            .pickerStyle(.segmented)
            
            switch selectedCategory {
            case .Feed:
                StackOfActivityCardsView()
            case .Caught:
                ScrollView(.vertical, showsIndicators: false) {
                    Text("List of caught activities")
                        
                }
            case .Launched:
                ScrollView(.vertical, showsIndicators: false) {
                    Text("List of launched activities")
                }
            }
        }
    }
}

struct SegmentedPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedPickerView()
    }
}
