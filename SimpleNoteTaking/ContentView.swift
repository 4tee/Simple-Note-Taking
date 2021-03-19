//
//  ContentView.swift
//  SimpleNoteTaking
//
//  Created by Dr.Ash on 19/3/21.
//

import SwiftUI
import CoreData

struct Note {
    var title: String
    var body: String
    var lastUpdated: Date
}

struct ContentView: View {
    
    let notes = [
        Note(title: "First Note", body: "First Note Body", lastUpdated: Date()),
        Note(title: "Second Note", body: "Second Note Body", lastUpdated: Date()),
        Note(title: "Third Note", body: "Third Note Body", lastUpdated: Date())
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(notes, id: \.title) { note in
                    Text(note.title)
                }
            }.navigationTitle("Notes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
