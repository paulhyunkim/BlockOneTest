//
//  BlockCellViewModel.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation
import EosioSwift

struct BlockCellViewModel {
    
    private let block: EosioRpcBlockResponse
    
    init(block: EosioRpcBlockResponse) {
        self.block = block
    }
    
    var textForBlockIDLabel: String {
        return block.id
    }
    
}
