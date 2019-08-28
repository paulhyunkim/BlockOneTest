//
//  BlockCellViewModelTests.swift
//  BlockOneTests
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import XCTest
@testable import BlockOne

class BlockCellViewModelTests: XCTestCase {
    
    var block: Block!
    var viewModel: BlockCellViewModel!
    
    override func setUp() {
        super.setUp()
        block = Block(id: "048d149364b2589f3d59ffd6b293aaf9d59bc1d16c23cb0da48ee18e370d19de",
                      previousBlockID: "048d1492d52780dedde46fc9eadd976dcf4b8a71c3888371344cad9dc1a845a8",
                      producer: "certikeosorg",
                      producerSignature: "SIG_K1_KY3dZBpVJfRY62ytY8fq1vQ2tHNDkGK1uHwDV8gbqNSBPpL7h1D9kJES4AGPn3vhjEzwtF6pb3njdewGvQw3iPk7wCZQpq")
        viewModel = BlockCellViewModel(block: block)
    }
    
    override func tearDown() {
        block = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testTextForBlockIDLabel() {
        XCTAssertEqual(viewModel.textForBlockIDLabel, block.id,
                       "Expected text for block id label to be the block's id")
    }
    
}
