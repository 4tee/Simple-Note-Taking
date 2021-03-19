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
    @State var noteTitle: String = ""
    @State var noteBody: String  = ""
    
    var body: some View {
        
        Form {
            Section {
                VStack (alignment: .leading){
                    TextField("Title", text: $noteTitle)
                    if (noteTitle.isEmpty) {
                        Text("Title cannot be empty")
                        .foregroundColor(.red)
                        .font(.footnote)
                    }
                }
                TextEditor(text: $noteBody).frame(height: 100)
            }
            
            Button("Save") {
                do {
                    note.title = noteTitle
                    note.body = noteBody
                    note.lastUpdated = Date()
                    
                    try self.moc.save()
                    self.presentationMode.wrappedValue.dismiss()
                } catch {
                    print("Oops. something went wrong while saving")
                }
            }.disabled(noteTitle.isEmpty)
        }.navigationBarTitle("Edit note", displayMode: .inline)
    }
}

struct EditNoteView_Previews: PreviewProvider {
    static var previews: some View {
        EditNoteView(note: Note(), noteTitle: "Sample Title", noteBody: "Sample Body")
    }
}
