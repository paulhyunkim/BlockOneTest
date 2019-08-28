//
//  BlockDetailViewModelTests.swift
//  BlockOneTests
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import XCTest
@testable import BlockOne

class BlockDetailViewModelTests: XCTestCase {
    
    private var block: Block!
    private var viewModel: BlockDetailViewModel!
    
    override func setUp() {
        super.setUp()
        block = Block(id: "048d149364b2589f3d59ffd6b293aaf9d59bc1d16c23cb0da48ee18e370d19de",
                      previousBlockID: "048d1492d52780dedde46fc9eadd976dcf4b8a71c3888371344cad9dc1a845a8",
                      producer: "certikeosorg",
                      producerSignature: "SIG_K1_KY3dZBpVJfRY62ytY8fq1vQ2tHNDkGK1uHwDV8gbqNSBPpL7h1D9kJES4AGPn3vhjEzwtF6pb3njdewGvQw3iPk7wCZQpq")
        viewModel = BlockDetailViewModel(block: block)
    }
    
    override func tearDown() {
        block = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testTextForProducerLabel() {
        XCTAssertEqual(viewModel.textForProducerLabel, block.producer,
                       "Expected text for producerLabel to be the block's producer.")
    }
    
    func testTextForTransactionCountLabel() {
        XCTAssertEqual(viewModel.textForTransactionsCountLabel, "\(block.transactionsCount)",
                       "Expected text for transactionsCountLabel to be the block's transactionCount.")
    }
    
    func testTextForSignatureLabel() {
        XCTAssertEqual(viewModel.textForSignatureLabel, block.producerSignature,
                       "Expected text for signature label to be the block's producerSignature.")
    }
    
    func testTextForRawJSON() {
        /* Note: needs updating because the mock block doesn't have json */
        XCTAssertEqual(viewModel.textForRawJSON, block.jsonString,
                       "Expected text for rawJSON to be the block's jsonString.")
    }
    
    func testIsRawViewHidden() {
        var viewState: BlockDetailViewModel.ViewState = .raw
        XCTAssertFalse(viewModel.isRawViewHidden(forViewState: viewState),
                       "Expected raw view to be not hidden when view state is .raw.")
        viewState = .pretty
        XCTAssertTrue(viewModel.isRawViewHidden(forViewState: viewState),
                      "Expected raw view to be hidden when view state is .pretty.")
    }
    
    func testIsPrettyViewHidden() {
        var viewState: BlockDetailViewModel.ViewState = .pretty
        XCTAssertFalse(viewModel.isPrettyViewHidden(forViewState: viewState),
                       "Expected pretty view to be not hidden when view state is .pretty.")
        viewState = .raw
        XCTAssertTrue(viewModel.isPrettyViewHidden(forViewState: viewState),
                      "Expected pretty view to be hidden when view state is .raw.")
    }
    
    func testTextForToggleButton() {
        var viewState: BlockDetailViewModel.ViewState = .pretty
        XCTAssertEqual(viewModel.textForToggleButton(forViewState: viewState), "Show Raw JSON",
                       "Expected text for rawJSON to be the block's jsonString.")
        viewState = .raw
        XCTAssertEqual(viewModel.textForToggleButton(forViewState: viewState), "Hide Raw JSON",
                       "Expected text for rawJSON to be the block's jsonString.")
    }
    
    
    
}

