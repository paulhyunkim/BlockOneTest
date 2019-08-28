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
        return ""
    }
    
    var textForTransactionCountLabel: String {
        return ""
    }
    
    var textForSignatureLabel: String {
        return ""
    }
    
    var textForRawJSON: String {
        return ""
    }
    
    var isRawViewHidden: Bool {
        return false
    }
    
    func textForToggleButton(forViewState viewState: ViewState) -> String {
        return ""
    }
    
    enum ViewState {
        case pretty
        case raw
    }
    
}
