//
//  ContentView.swift
//  SimpleNoteTaking
//
//  Created by Dr.Ash on 19/3/21.
//

import SwiftUI
import CoreData

struct HardCodedNote {
    var title: String
    var body: String
    var lastUpdated: Date
}

struct ContentView: View {
    
    @State private var showingAddJoke = false
    
    let notes = [
        HardCodedNote(title: "First Note", body: "First Note Body", lastUpdated: Date()),
        HardCodedNote(title: "Second Note", body: "Second Note Body", lastUpdated: Date()),
        HardCodedNote(title: "Third Note", body: "Third Note Body", lastUpdated: Date())
    ]
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(notes, id: \.title) { note in
                    Text(note.title)
                }
            }.navigationTitle("Notes")
            .navigationBarItems(trailing: Button(action: {self.showingAddJoke.toggle()}, label: {
                Image(systemName: "plus.circle").imageScale(.large)
                Text("Add")
            }))
            .sheet(isPresented: $showingAddJoke, content: {
                Text("New Note")
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
