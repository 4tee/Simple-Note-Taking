//
//  EditNoteView.swift
//  SimpleNoteTaking
//
//  Created by Dr.Ash on 19/3/21.
//

import SwiftUI

struct EditNoteView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var note: Note
    
    var body: some View {
        
        Form {
            Section {
                TextField("Title", text: $note.title)
                TextEditor(text: $note.body).frame(height: 100)
            }
            
            Button("Save") {
                do {
                    note.lastUpdated = Date()
                    
                    try self.moc.save()
                    self.presentationMode.wrappedValue.dismiss()
                } catch {
                    print("Oops. something went wrong while saving")
                }
            }
        }.navigationTitle("Edit note")
    }
}

struct EditNoteView_Previews: PreviewProvider {
    
    static var mNote = Note()
    
    static var previews: some View {
        EditNoteView(note: mNote)
    }
}
