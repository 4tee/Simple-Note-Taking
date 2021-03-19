//
//  NoteViewModelSpec.swift
//  SimpleNoteTakingTests
//
//  Created by Dr.Ash on 19/3/21.
//

import XCTest
@testable import SimpleNoteTaking

class NoteViewModelSpec: XCTestCase {

    var viewModel: NoteViewModel!
    
    override func setUp() {
        viewModel = .init()
    }
    
    func testIsGoodToSavePresentedToTrueWhenTitleIsPresentOnly() {
        viewModel.noteTitle = "Something"
        viewModel.noteBody = ""
        XCTAssertTrue(viewModel.isGoodToSave())
    }
    
    func testIsGoodToSavePresentedToTrueWhenBothTitleAndBodyArePresent() {
        viewModel.noteTitle = "Something"
        viewModel.noteBody = "Something Too"
        XCTAssertTrue(viewModel.isGoodToSave())
    }
    
    func testIsGoodToSavePresentedToTrueWhenBothTitleAndBodyAreNotPresent() {
        viewModel.noteTitle = ""
        viewModel.noteBody = ""
        XCTAssertFalse(viewModel.isGoodToSave())
    }

    func testIsGoodToSavePresentedToTrueWhenTitleIsNotPresent() {
        viewModel.noteTitle = ""
        viewModel.noteBody = "Something"
        XCTAssertFalse(viewModel.isGoodToSave())
    }
}
