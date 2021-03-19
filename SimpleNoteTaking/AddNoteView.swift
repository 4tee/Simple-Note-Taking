//
//  AddNoteView.swift
//  SimpleNoteTaking
//
//  Created by Dr.Ash on 19/3/21.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var noteTitle = ""
    @State private var noteBody = ""
    
    var body: some View {
        NavigationView {
            
            Form {
                Section {
                    TextField("Title", text: $noteTitle)
                    TextEditor(text: $noteBody).frame(height: 100)
                }
                
                Button("Add") {
                    let newNote = Note(context: self.moc)
                    newNote.title = self.noteTitle
                    newNote.body = self.noteBody
                    newNote.lastUpdated = Date()
                    
                    do {
                        try self.moc.save()
                        self.presentationMode.wrappedValue.dismiss()
                    } catch {
                        print("Oops. something went wrong while saving")
                    }
                }
            }.navigationTitle("New note")
            
        }
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView()
    }
}
