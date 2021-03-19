//
//  NoteViewModel.swift
//  SimpleNoteTaking
//
//  Created by Dr.Ash on 19/3/21.
//

import Combine
import Foundation

class NoteViewModel: ObservableObject {
    
    @Published var noteTitle: String
    @Published var noteBody: String
    @Published var lastUpdated: Date
    
    init() {
        noteTitle = ""
        noteBody = ""
        lastUpdated = Date()
    }

    // Note title is manadatory and body is optional
    func isGoodToSave() -> Bool {
        return noteTitle.count > 0
    }
    
}
