//
//  BlocksListViewModel.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation

struct BlocksListViewModel {
    
    private let blocks: [Block]
    
    init(blocks: [Block]) {
        self.blocks = blocks
    }
    
    var textForRefreshBlocksButton: String {
        return ""
    }
    
    var numberOfRows: Int {
        return blocks.count
    }
    
    func cellViewModel(forRow rowIndex: Int) -> BlockCellViewModel? {
        guard rowIndex < blocks.count && rowIndex >= 0 else {
            return nil
        }
        let block = blocks[rowIndex]
        return BlockCellViewModel(block: block)
    }
    
    func block(forRow rowIndex: Int) -> Block? {
        guard rowIndex < blocks.count && rowIndex >= 0 else {
            return nil
        }
        return blocks[rowIndex]
    }

}
