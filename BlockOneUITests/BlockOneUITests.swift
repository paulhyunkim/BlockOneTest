//
//  BlockOneUITests.swift
//  BlockOneUITests
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import XCTest

class BlockOneUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testBlockRefreshButton() {
        let activityIndicator = app.activityIndicators["In progress"].firstMatch
        
        tapBlockRefreshButton()
        XCTAssertTrue(activityIndicator.waitForExistence(timeout: 5))
    }
    
    func testBlockCellTap() {
        let showRawJsonButton = app.buttons["Show Raw JSON"].firstMatch
        
        tapBlockCell()
        XCTAssertTrue(showRawJsonButton.waitForExistence(timeout: 1))
    }

    func testToggleViewStateButtonTap() {
        let prettyView = app.otherElements["PrettyView"].firstMatch
        let rawView = app.otherElements["RawView"].firstMatch
        
        tapBlockCell()
        XCTAssertTrue(prettyView.exists)
        XCTAssertFalse(rawView.exists)
        
        tapToggleBlockDetailViewStateButton()
        XCTAssertFalse(prettyView.exists)
        XCTAssertTrue(rawView.exists)
    }
    
    private func tapBlockRefreshButton() {
        let refreshButton = app.buttons["RefreshButton"].firstMatch
        XCTAssertTrue(refreshButton.waitForExistence(timeout: 1))
        refreshButton.tap()
    }
    
    private func tapBlockCell() {
        let cell = app.tables.cells.element(matching: .cell, identifier: "BlockCell").firstMatch
        XCTAssertTrue(cell.waitForExistence(timeout: 10))
        cell.tap()
    }
    
    private func tapToggleBlockDetailViewStateButton() {
        let toggleViewStateButton = app.buttons["ToggleViewStateButton"].firstMatch
        XCTAssertTrue(toggleViewStateButton.waitForExistence(timeout: 1))
        toggleViewStateButton.tap()
    }
    
}
