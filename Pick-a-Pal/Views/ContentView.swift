//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Christian Manzaraz on 26/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = ["Elisha", "Andre", "Jasmine", "Po-Chun"]
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    
    var body: some View {
        VStack {
            Text(pickedName.isEmpty ? "" : pickedName)
            List {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
            }
            
            TextField("Add a Name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            
            Toggle("Remove picked names", isOn: $shouldRemovePickedName)
            
            
            Button {
                if let randomName = names.randomElement() {
                    pickedName = randomName
                    
                    if shouldRemovePickedName {
                        names.removeAll{name in
                                return (name == randomName)
                        }
                    }
                } else {
                    pickedName = ""
                }
            } label: {
                 Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
