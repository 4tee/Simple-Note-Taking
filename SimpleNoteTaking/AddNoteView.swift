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
    
    @StateObject var viewModel = NoteViewModel()
    @State private var shouldShowError = false
    
    var body: some View {
        NavigationView {
            
            Form {
                Section {
                    VStack (alignment: .leading){
                        TextField("Title", text: $viewModel.noteTitle)
                        if (shouldShowError && !viewModel.isGoodToSave()) {
                            Text("Title cannot be empty")
                            .foregroundColor(.red)
                            .font(.footnote)
                        }
                        
                    }
                    TextEditor(text: $viewModel.noteBody).frame(height: 100)
                }
                
                Button("Add") {
                    self.shouldShowError.toggle()
                    
                    if (viewModel.isGoodToSave()) {
                        let newNote = Note(context: self.moc)
                        newNote.title = viewModel.noteTitle
                        newNote.body = viewModel.noteBody
                        newNote.lastUpdated = viewModel.lastUpdated
                        
                        do {
                            try self.moc.save()
                            self.presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("Oops. something went wrong while saving")
                        }
                    } else {
                        print("Note title cannot be empty")
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
