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
        // Note: need to replace with mock session
        apiClient = APIClient(urlSession: URLSession.shared)
    }
    
    override func tearDown() {
        apiClient = nil
        super.tearDown()
    }
    
    func testFetchBlockchainInfoSuccess() {
        let expectation = self.expectation(description: "Status code: 200")
        apiClient.fetchBlockchainInfo { response in
            switch response {
            case .success:
                expectation.fulfill()
            case .failure:
                XCTFail("Expected successful blockchainInfo fetch")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testFetchBlockSuccess() {
        let blockID = "048013e1a30e82641fd1f6413eb1af0d1b72274e81564f7ef85c4b29d9d3271d"
        let expectation = self.expectation(description: "Status code: 200")
        apiClient.fetchBlock(id: blockID) { response in
            switch response {
            case .success:
                expectation.fulfill()
            case .failure:
                XCTFail("Expected successful block fetch")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
}

