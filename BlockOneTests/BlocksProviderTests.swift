//
//  BlocksProviderTests.swift
//  BlockOneTests
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import XCTest
@testable import BlockOne

class BlocksProviderTests: XCTestCase {
    
    var blocksProvider: BlocksProvider!
    
    override func setUp() {
        super.setUp()
        let apiClient = MockAPIClient()
        blocksProvider = BlocksProvider(apiClient: apiClient)
    }
    
    override func tearDown() {
        blocksProvider = nil
        super.tearDown()
    }
    
    func testFetchMostRecentBlocks() {
        let validBlockRequestCount = 5
        let validCountExpectation = self.expectation(description: "Status code: 200")
        blocksProvider.fetchMostRecentBlocks(count: validBlockRequestCount) { blocks in
            XCTAssertEqual(blocks.count, validBlockRequestCount,
                           "Expected same number of blocks as requested.")
            validCountExpectation.fulfill()
        }
        
        let invalidBlockRequestCount = -1
        let negativeCountExpectation = self.expectation(description: "Status code: 200")
        blocksProvider.fetchMostRecentBlocks(count: invalidBlockRequestCount) { blocks in
            XCTAssertEqual(blocks.count, 0,
                           "Expected 0 blocks when requesting a negative number of blocks.")
            negativeCountExpectation.fulfill()
        }
        
        wait(for: [validCountExpectation, negativeCountExpectation], timeout: 5)
    }
    
}

