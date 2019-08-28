//
//  Block.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation

struct Block: BlockProtocol, Decodable, JSONRepresentable {
    
    var json: Any?
    let id: String
    let previousBlockID: String
    let producer: String
    let producerSignature: String
    
    enum CodingKeys: String, CodingKey {
        case producer
        case previousBlockID = "previous"
        case producerSignature = "producer_signature"
        case id
        case transactions
    }
    
    init(id: String, previousBlockID: String, producer: String, producerSignature: String) {
        self.id = id
        self.previousBlockID = previousBlockID
        self.producer = producer
        self.producerSignature = producerSignature
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        previousBlockID = try container.decode(String.self, forKey: .previousBlockID)
        producer = try container.decode(String.self, forKey: .producer)
        producerSignature = try container.decode(String.self, forKey: .producerSignature)
    }
    
}
