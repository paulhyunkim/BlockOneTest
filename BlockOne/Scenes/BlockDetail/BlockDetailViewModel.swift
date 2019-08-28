//
//  BlockDetailViewModel.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation
import EosioSwift

struct BlockDetailViewModel {
    
    private let block: EosioRpcBlockResponse
    
    init(block: EosioRpcBlockResponse) {
        self.block = block
    }
    
    var textForProducerLabel: String {
        return block.producer
    }
    
    var textForTransactionsCountLabel: String {
        return "\(block.transactions.count)"
    }
    
    var textForSignatureLabel: String {
        return block.producerSignature
    }
    
    var textForRawJSON: String {
        guard let data = try? JSONSerialization.data(withJSONObject: block._rawResponse as Any, options: .prettyPrinted) else {
            return ""
        }
        return String(data: data, encoding: .utf8) ?? ""
        
    }
    
    func isRawViewHidden(forViewState viewState: ViewState) -> Bool {
        switch viewState {
        case .pretty:
            return true
        case .raw:
            return false
        }
    }
    
    func isPrettyViewHidden(forViewState viewState: ViewState) -> Bool {
        return !isRawViewHidden(forViewState: viewState)
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
