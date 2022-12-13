//
//  AddNewFreesbeView.swift
//  Freesbe
//
//  Created by Antonio Palomba on 12/12/22.
//

import SwiftUI



struct AddNewFreesbeView: View {
    var arrayAddedFreesbes = [FreesbeCard]()
    var arrayOfCategories = ["Code", "Design", "Business", "Games", "Social", "Others"]
    var arrayOfPlaces = ["Lab 1", "Lab 2", "Lab 3"]
    var pickImage = ["Load image from phone", "Load iamge from your Drive"]
    
    @State private var title = ""
    @State private var category = "Code"
    @State private var place = "Lab 1"
    @State private var image = ""
    @State private var description = ""
    @State private var date = Date()
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Add a title", text: $title)
                    Picker("Select a category", selection: $category) {
                        ForEach(arrayOfCategories, id: \.self) { item in
                            Text(item)
                        }
                    }
                    Picker("Select a picture", selection: $image) {
                        ForEach(pickImage, id: \.self) { item in
                            Text(item)
                        }
                        
                    }
                    
                }
                Section {
                    TextEditor(text: $description)
                } header: {
                    Text("Add a description")
                }
                Section {
                    DatePicker("Pick a Date", selection: $date)
                        .labelsHidden()
                }header: {
                    Text("When it will happen?")
                }
                Section {
                    Picker("Where it will happen?", selection: $place) {
                        ForEach(arrayOfPlaces, id: \.self) { item in
                            Text(item)
                        }
                    }
                    
                }
            }
            SwipeToLaunchButton()
            
        }
        .preferredColorScheme(.light)
    
    }
    mutating func addNewFreesbe() {
        let item = FreesbeCard(throwerAvatar: "Antonio Palomba", cardTitle: title, tag: category, time: "Today", location: place, thrower: "Antonio Palomba", description: description)
        arrayAddedFreesbes.append(item)
    }
}

struct AddNewFreesbeView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewFreesbeView()
    }
}
