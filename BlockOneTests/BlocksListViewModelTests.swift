//
//  BlocksListViewModelTests.swift
//  BlockOneTests
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import XCTest
@testable import BlockOne

class BlocksListViewModelTests: XCTestCase {
    
    private var blocks: [Block]!
    private var viewModel: BlocksListViewModel!
    
    override func setUp() {
        super.setUp()
        let blockA = Block(id: "048d149364b2589f3d59ffd6b293aaf9d59bc1d16c23cb0da48ee18e370d19de",
                          previousBlockID: "048d1492d52780dedde46fc9eadd976dcf4b8a71c3888371344cad9dc1a845a8",
                          producer: "certikeosorg",
                          producerSignature: "SIG_K1_KY3dZBpVJfRY62ytY8fq1vQ2tHNDkGK1uHwDV8gbqNSBPpL7h1D9kJES4AGPn3vhjEzwtF6pb3njdewGvQw3iPk7wCZQpq")
        let blockB = Block(id:"048d1492d52780dedde46fc9eadd976dcf4b8a71c3888371344cad9dc1a845a8",
                           previousBlockID: "048d149169d5f38b32f735164cc95d8ed4c3fbd66bba5b2241d262cc47aaa767",
                           producer: "bitfinexeos1",
                           producerSignature: "SIG_K1_K6jKPQkYagwoY2KY4xiwSfM3mgJbLATvQc68QQLtk9XKs5Pw8q5ybSHv8L6PpZMvkbTaZqWkHTfbBc9Hfas6VJ33mf67aw")
        blocks = [blockA, blockB]
        viewModel = BlocksListViewModel(blocks: [blockA, blockB])
    }
    
    override func tearDown() {
        blocks = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testNumberOfRows() {
        XCTAssertEqual(viewModel.numberOfRows, blocks.count,
                       "Expected same number of rows as block count.")
    }
    
    
    func testCellViewModelForIndex() {
        guard blocks.count > 0 else {
            XCTFail("Expected some mock data")
            return
        }
        let lastBlockIndex = blocks.count - 1
        XCTAssertNotNil(viewModel.cellViewModel(forRow: lastBlockIndex),
                        "Expected a view model when index is in range.")
        
        let outOfRangeIndex = -1
        XCTAssertNil(viewModel.cellViewModel(forRow: outOfRangeIndex),
                     "Did not expect a view model when index is out of range.")
    }
    
    func testBlockForRow() {
        guard blocks.count > 0 else {
            XCTFail("Expected some mock data")
            return
        }
        let lastBlockIndex = blocks.count - 1
        let lastBlock = viewModel.block(forRow: lastBlockIndex)
        XCTAssert(lastBlock?.id == blocks.last?.id,
                  "Expected block with same ID for given index.")
        
        let outOfRangeIndex = -1
        XCTAssertNil(viewModel.cellViewModel(forRow: outOfRangeIndex),
                     "Did not expect a block when index is out of range.")
    }

}

