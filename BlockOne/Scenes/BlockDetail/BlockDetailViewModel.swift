//
//  BlockDetailViewModel.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation

struct BlockDetailViewModel {
    
    private let block: Block
    
    init(block: Block) {
        self.block = block
    }
    
    var textForProducerLabel: String {
        return block.producer
    }
    
    var textForTransactionsCountLabel: String {
        return "\(block.transactionsCount)"
    }
    
    var textForSignatureLabel: String {
        return block.producerSignature
    }
    
    var textForRawJSON: String {
        return block.jsonString ?? ""
    }
    
    var isRawViewHidden: Bool {
        return false
    }
    
    func textForToggleButton(forViewState viewState: ViewState) -> String {
        switch viewState {
        case .pretty:
            return "Show Raw JSON"
        case .raw:
            return "Hide Raw JSON"
        }
    }
    
    enum ViewState {
        case pretty
        case raw
    }
    
}
