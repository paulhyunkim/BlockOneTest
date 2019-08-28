//
//  APIClient.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation

class APIClient: APIClientProtocol {
    
    func fetchBlockchainInfo(_ completion: @escaping (APIResponse<BlockchainInfoProtocol>) -> Void) {
       
    }
    
    func fetchBlock(id: String, _ completion: @escaping (APIResponse<BlockProtocol>) -> Void) {
        
    }
    
}
