//
//  APIClientProtocol.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation

protocol APIClientProtocol {
    
    func fetchBlockchainInfo(_ completion: @escaping (APIResponse<BlockchainInfo>) -> Void)
    func fetchBlock(id: String, _ completion: @escaping (APIResponse<Block>) -> Void)
    
}

enum APIResponse<T> {
    
    case success(result: T)
    case failure(error: Error)
    
}
