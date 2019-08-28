//
//  FetchBlockOperation.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation

class FetchBlockOperation: AsynchronousOperation {
    
    var blockID: String?
    var block: Block?
    var error: Error?
    var apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    override func main() {
        guard let blockID = blockID else {
            finish()
            return
        }
        
        apiClient.fetchBlock(id: blockID) { [weak self] response in
            switch response {
            case .success(let block):
                self?.block = block
            case .failure(let error):
                self?.error = error
            }
            self?.finish()
        }
    }
    
}
