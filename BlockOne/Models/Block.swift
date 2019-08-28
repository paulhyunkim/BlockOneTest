//
//  Block.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation

struct Block: BlockProtocol, Decodable {
    
    let id: String
    let previousBlockID: String
    let producer: String
    let producerSignature: String
    
    enum CodingKeys: String, CodingKey {
        case producer
        case previousBlockID = "previous"
        case producerSignature = "producer_signature"
        case id
    }
    
    init(id: String, previousBlockID: String, producer: String, producerSignature: String) {
        self.id = id
        self.previousBlockID = previousBlockID
        self.producer = producer
        self.producerSignature = producerSignature
    }
    
}
