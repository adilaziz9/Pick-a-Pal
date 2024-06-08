//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Adil Aziz on 07/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var names: [String] = []
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                            Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                            Text("Choisis un Nom")
                        }
                        .font(.title)
                        .bold()
                        
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                               .bold()
                               .foregroundStyle(.tint)
            
                    List {
                        ForEach(names, id: \.self) { name in
                                            Text(name)
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            
            TextField("Ton Prénom (Adil) ", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                                           names.append(nameToAdd)
                                           nameToAdd = ""
                                       }
                                }
            
            Divider()
            
            Toggle("Enlever après avoir selectionner", isOn: $shouldRemovePickedName)
            
            Button {
                           if let randomName = names.randomElement() {
                               pickedName = randomName
                               
                               if shouldRemovePickedName {
                                                       names.removeAll { name in
                                                           return (name == randomName)
                                                       }
                                                   }
                               
                           } else {
                               pickedName = ""
                           }
            } label: {
                          Text("Choix Aléatoire")
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
