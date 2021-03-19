//
//  ContentView.swift
//  SimpleNoteTaking
//
//  Created by Dr.Ash on 19/3/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Note.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Note.lastUpdated, ascending: true)]) var notes: FetchedResults<Note>
    
    @State private var showAddNote = false
    
    var body: some View {
        NavigationView {
            
            List {
                
                ForEach(notes, id: \.title) { note in
                    Text(note.title)
                }
                .onDelete(perform: removeNote)
                
            }.navigationTitle("Notes")
            .navigationBarItems(trailing: Button(action: {self.showAddNote.toggle()}, label: {
                Image(systemName: "plus.circle").imageScale(.large)
                Text("Add")
            }))
            .sheet(isPresented: $showAddNote, content: {
                AddNoteView().environment(\.managedObjectContext, self.moc)
            })
            
        }
    }
    
    func removeNote(at offset: IndexSet) {
        for index in offset {
            let noteToBeRemoved = notes[index]
            moc.delete(noteToBeRemoved)
        }
        
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
