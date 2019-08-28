//
//  BlocksProvider.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation

class BlocksProvider: BlocksProviderProtocol {
    
    private let operationQueue = OperationQueue()
    private let apiClient: APIClientProtocol
    private var blocks: [Block]
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
        self.blocks = []
    }
    
    func fetchMostRecentBlocks(count: Int, _ completion: @escaping ([Block]) -> Void) {
        
    }
    
}
