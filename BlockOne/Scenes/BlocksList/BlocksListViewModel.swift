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
    
    func cellViewModel(for block: Block) -> BlockCellViewModel? {
        return nil
    }

}
