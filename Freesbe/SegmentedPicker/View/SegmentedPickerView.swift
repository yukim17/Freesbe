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
                CarouselView()
            case .Caught:
                ScrollView(.vertical, showsIndicators: false) {
                    CaughtCardView()
                        .padding(.top, 20)
                        
                }
                //There is a bug with the shadow of cards, you need to add a positive padding to the VStack of the cards too
                //.padding(.horizontal, -20)
                .padding(.bottom, -50)
            case .Launched:
                ScrollView(.vertical, showsIndicators: false) {
                    LaunchedCardView()
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
