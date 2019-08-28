//
//  APIClient.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation

class APIClient: APIClientProtocol {
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    func fetchBlockchainInfo(_ completion: @escaping (APIResponse<BlockchainInfo>) -> Void) {
        
    }
    
    func fetchBlock(id: String, _ completion: @escaping (APIResponse<Block>) -> Void) {
        
    }
    
}
