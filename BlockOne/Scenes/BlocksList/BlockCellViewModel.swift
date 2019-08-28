//
//  BlockCellViewModel.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation

struct BlockCellViewModel {
    
    private let block: Block
    
    init(block: Block) {
        self.block = block
    }
    
    var textForMainLabel: String {
        return block.id
    }
    
}
