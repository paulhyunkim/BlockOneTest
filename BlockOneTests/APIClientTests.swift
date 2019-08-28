//
//  APIClientTests.swift
//  BlockOneTests
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import XCTest
@testable import BlockOne

class APIClientTests: XCTestCase {
    
    private var urlSession: MockURLSession!
    private var apiClient: APIClient!
    
    override func setUp() {
        super.setUp()
        urlSession = MockURLSession()
        apiClient = APIClient(urlSession: urlSession)
    }
    
    override func tearDown() {
        apiClient = nil
        urlSession = nil
        super.tearDown()
    }
    
    func testFetchBlockchainInfo() {
        let expectedRequestURL = URL(string: "https://api.eosnewyork.io/v1/chain/get_info")!
        
        XCTAssertFalse(urlSession.dataTaskDidResume,
                       "Expected fetchBlockchainInfo data task to not be resumed before fetchBlockchainInfo is invoked.")
        apiClient.fetchBlockchainInfo { response in
        }
        
        XCTAssertEqual(expectedRequestURL, urlSession.lastURL,
                       "Expected fetchBlockchainInfo request url to be \(expectedRequestURL.absoluteString)")
        XCTAssertTrue(urlSession.dataTaskDidResume,
                      "Expected fetchBlockchainInfo data task to be resumed after fetchBlockchainInfo is invoked.")
    }
    
    func testFetchBlock() {
        let expectedRequestURL = URL(string: "https://api.eosnewyork.io/v1/chain/get_block")!

        XCTAssertFalse(urlSession.dataTaskDidResume,
                       "Expected fetchBlock data task to not be resumed before fetchBlock is invoked.")
        apiClient.fetchBlock(id: "someID") { response in
        }
        
        XCTAssertEqual(expectedRequestURL, urlSession.lastURL,
                       "Expected fetchBlock request url to be \(expectedRequestURL.absoluteString)")
        XCTAssertTrue(urlSession.dataTaskDidResume,
                      "Expected fetchBlock data task to be resumed after fetchBlock is invoked.")
    }
    
}

