//
//  BlocksProviderTest.swift
//  BlockOneTests
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import XCTest
@testable import BlockOne

class BlocksProviderTest: XCTestCase {
    
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
        let blockCount = 5
        let expectation = self.expectation(description: "Status code: 200")
        blocksProvider.fetchMostRecentBlocks(count: 5) { blocks in
            XCTAssertEqual(blockCount, blocks.count)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
}

