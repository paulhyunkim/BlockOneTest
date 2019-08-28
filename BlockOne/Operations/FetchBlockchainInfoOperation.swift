//
//  FetchBlockchainInfoOperation.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation

class BlockchainInfoFetchOperation: AsynchronousOperation {
    
    var blockchainInfo: BlockchainInfo?
    var error: Error?
    var apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    override func main() {
        apiClient.fetchBlockchainInfo { [weak self] response in
            switch response {
            case .success(let blockchainInfo):
                self?.blockchainInfo = blockchainInfo
                self?.finish()
            case .failure(let error):
                self?.error = error
                self?.finish()
            }
        }
    }
    
}
