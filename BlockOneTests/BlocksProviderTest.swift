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
        let apiClient = APIClient(urlSession: URLSession.shared)
        blocksProvider = BlocksProvider(apiClient: apiClient)
    }
    
    override func tearDown() {
        blocksProvider = nil
        super.tearDown()
    }
    
    func testFetchMostRecentBlocks() {
        XCTFail()
    }
    
}

