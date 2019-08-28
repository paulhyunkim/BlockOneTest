//
//  APIClientTest.swift
//  BlockOneTests
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import XCTest
@testable import BlockOne

class APIClientTest: XCTestCase {
    
    var apiClient: APIClient!
    
    override func setUp() {
        super.setUp()
        apiClient = APIClient()
    }
    
    override func tearDown() {
        apiClient = nil
        super.tearDown()
    }
    
    func testFetchBlockchainInfo() {
        XCTFail()
    }
    
    func testFetchBlock() {
        XCTFail()
    }
    
}

