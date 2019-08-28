//
//  MockAPIClient.swift
//  BlockOneTests
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation
@testable import BlockOne

class MockAPIClient: APIClientProtocol {
    
    private var blockchainInfo: BlockchainInfo!
    private var blocks: [Block]!
    
    init() {
        buildBlockchainInfo()
        buildBlocks()
    }
    
    func fetchBlockchainInfo(_ completion: @escaping (APIResponse<BlockchainInfo>) -> Void) {
        completion(.success(result: blockchainInfo))
    }
    
    func fetchBlock(id: String, _ completion: @escaping (APIResponse<Block>) -> Void) {
        guard let block = blocks.first(where: { $0.id == id }) else {
            let error = NSError(domain: "Cannot find mock block with id \(id)", code: 0, userInfo: nil)
            completion(.failure(error: error))
            return
        }
        completion(.success(result: block))
    }
    
    
    private func buildBlockchainInfo() {
        let blockchainInfo = BlockchainInfo(headBlockID: "048d149364b2589f3d59ffd6b293aaf9d59bc1d16c23cb0da48ee18e370d19de")
        self.blockchainInfo = blockchainInfo
    }
    
    private func buildBlocks() {
        let blockA = Block(id: "048d149364b2589f3d59ffd6b293aaf9d59bc1d16c23cb0da48ee18e370d19de",
                           previousBlockID: "048d1492d52780dedde46fc9eadd976dcf4b8a71c3888371344cad9dc1a845a8",
                           producer: "certikeosorg",
                           producerSignature: "SIG_K1_KY3dZBpVJfRY62ytY8fq1vQ2tHNDkGK1uHwDV8gbqNSBPpL7h1D9kJES4AGPn3vhjEzwtF6pb3njdewGvQw3iPk7wCZQpq")
        let blockB = Block(id:"048d1492d52780dedde46fc9eadd976dcf4b8a71c3888371344cad9dc1a845a8",
                           previousBlockID: "048d149169d5f38b32f735164cc95d8ed4c3fbd66bba5b2241d262cc47aaa767",
                           producer: "bitfinexeos1",
                           producerSignature: "SIG_K1_K6jKPQkYagwoY2KY4xiwSfM3mgJbLATvQc68QQLtk9XKs5Pw8q5ybSHv8L6PpZMvkbTaZqWkHTfbBc9Hfas6VJ33mf67aw")
        let blockC = Block(id:"048d149169d5f38b32f735164cc95d8ed4c3fbd66bba5b2241d262cc47aaa767",
                           previousBlockID: "048d14907429b4e77dacc766b5ff37b7e578d055e1f44533e893cd31f90a4508",
                           producer: "bitfinexeos1",
                           producerSignature: "SIG_K1_JwLhKyW526pRGwEfxdW25qzejtME6JztXikDQXiUXPKmJsMhWxuir6KEcX4VbKsKiAD9zVyeweTYx81v3X88HxWzaZHXry")
        let blockD = Block(id:"048d14907429b4e77dacc766b5ff37b7e578d055e1f44533e893cd31f90a4508",
                           previousBlockID: "048d148ffafa98efec6487337cf1c1eaa3c1ffccb460f5eaad976afe0dc3437b",
                           producer: "bitfinexeos1",
                           producerSignature: "SIG_K1_Jw81JmMNiajBrWApPfhxuvGZkQeQ15tffrP9CySq7yxmwVZTqB4rjhr7YPA5XynLGHMApcQ58thMXy8eZXKyLif1jDUVaF")
        let blockE = Block(id:"048d148ffafa98efec6487337cf1c1eaa3c1ffccb460f5eaad976afe0dc3437b",
                           previousBlockID: "048d148e9764dde1425fcd9237e432d463e6fa599dcd309c73a90c412225a97a",
                           producer: "bitfinexeos1",
                           producerSignature: "SIG_K1_KXQ7ua7dLp1gvxjFwojh8VVHuttcvaD8bCH1U2M33eTQ9T8WxyJQ1YptTb2zRURKxynmxanouMV7kkKhGZBaZQoSTM7hCa")
        self.blocks = [blockA, blockB, blockC, blockD, blockE]
    }
    
}
