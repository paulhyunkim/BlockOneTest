//
//  FetchBlockOperation.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation
import EosioSwift

class FetchBlockOperation: AsynchronousOperation {
    
    var blockNum: UInt64?
    var block: EosioRpcBlockResponse?
    var error: EosioError?
    var rpcProvider: EosioRpcProvider
    
    init(rpcProvider: EosioRpcProvider) {
        self.rpcProvider = rpcProvider
    }
    
    override func main() {
        guard let blockNum = blockNum else {
            finish()
            return
        }
        
        let blockRequest = EosioRpcBlockRequest(blockNumOrId: blockNum)
        
        rpcProvider.getBlock(requestParameters: blockRequest) { [weak self] (response: EosioResult<EosioRpcBlockResponse, EosioError>) in
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
