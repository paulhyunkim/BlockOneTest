//
//  BlockchainInfo.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation

struct BlockchainInfo: BlockchainInfoProtocol, Decodable {
    
    let headBlockID: String
    
    enum CodingKeys: String, CodingKey {
        case headBlockID = "head_block_id"
    }
    
    init(headBlockID: String) {
        self.headBlockID = headBlockID
    }
    
}
