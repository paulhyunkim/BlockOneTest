//
//  FetchBlockchainInfoOperation.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation
import EosioSwift

class FetchBlockchainInfoOperation: AsynchronousOperation {
    
    var blockchainInfo: EosioRpcInfoResponse?
    var error: EosioError?
    var rpcProvider: EosioRpcProvider
    
    init(rpcProvider: EosioRpcProvider) {
        self.rpcProvider = rpcProvider
    }
    
    override func main() {
        rpcProvider.getInfo { [weak self] (response: EosioResult<EosioRpcInfoResponse, EosioError>) in
            switch response {
            case .success(let info):
                self?.blockchainInfo = info
                self?.finish()
            case .failure(let error):
                self?.error = error
                self?.finish()
            }
        }
    }
    
}
