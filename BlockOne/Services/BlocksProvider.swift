//
//  BlocksProvider.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation
import EosioSwift

class BlocksProvider: BlocksProviderProtocol {
    
    private let operationQueue = OperationQueue()
    private var blocks: [EosioRpcBlockResponse]
    private let rpcProvider: EosioRpcProvider
    
    init() {
        let baseURL = URL(string: "https://api.eosnewyork.io/")!
        self.rpcProvider = EosioRpcProvider(endpoint: baseURL)
        self.blocks = []
        operationQueue.maxConcurrentOperationCount = 1
    }
    
    func fetchMostRecentBlocks(count: Int, _ completion: @escaping ([EosioRpcBlockResponse]) -> Void) {
        blocks = []
        
        guard count > 0 else {
            completion([])
            return
        }
        
        let fetchBlockchainInfoOperation = FetchBlockchainInfoOperation(rpcProvider: rpcProvider)
        let fetchBlockOperations = serializedFetchBlockOperations(count: count)
        
        guard let firstFetchBlockOperation = fetchBlockOperations.first else {
            return
        }
        
        firstFetchBlockOperation.addDependency(fetchBlockchainInfoOperation)
        
        fetchBlockchainInfoOperation.completionBlock = { [weak fetchBlockchainInfoOperation, weak firstFetchBlockOperation] in
            firstFetchBlockOperation?.blockNum = fetchBlockchainInfoOperation?.blockchainInfo?.headBlockNum.value
        }
        
        let fetchOperations = [fetchBlockchainInfoOperation] + fetchBlockOperations
        let operationsToRun = addCompletionOperation(to: fetchOperations, withCompletion: completion)
        
        operationQueue.addOperations(operationsToRun, waitUntilFinished: false)
    }
    
    private func serializedFetchBlockOperations(count: Int) -> [FetchBlockOperation] {
        var operations = [FetchBlockOperation]()
        
        for _ in 1...count {
            let operationToAdd = FetchBlockOperation(rpcProvider: rpcProvider)
            
            /* nextOperation means the operation that should be executed after operationToAdd */
            if let nextOperation = operations.first {
                nextOperation.addDependency(operationToAdd)
                operationToAdd.completionBlock = { [weak nextOperation, weak operationToAdd, weak self] in
                    guard let previousID = operationToAdd?.block?.previous else {
                        return
                    }
                    /* NOTE: Seems to have a problem here because `previous` is a string but `getBlock` on the rpcProvider takes a UInt64 blockNum */
                    let blockNum = EosioUInt64.string(previousID)
                    nextOperation?.blockNum = blockNum.value
                    if let block = operationToAdd?.block {
                        self?.blocks.append(block)
                    }
                    
                }
            } else {
                operationToAdd.completionBlock = { [weak operationToAdd, weak self] in
                    if let block = operationToAdd?.block {
                        self?.blocks.append(block)
                    }
                }
            }
            
            /* Inserting at 0 so that the operations are ordered by their dependencies (e.g. operation at index 1 has a dependency on operation at index 0) */
            operations.insert(operationToAdd, at: 0)
        }
        
        return operations
    }
    
    private func addCompletionOperation(to operations: [Operation], withCompletion completion: @escaping ([EosioRpcBlockResponse]) -> Void) -> [Operation] {
        guard let lastOperation = operations.last else {
            return []
        }
        
        let completionOperation = CompletionOperation()
        completionOperation.completionBlock = { [weak self] in
            if let blocks = self?.blocks {
                completion(blocks)
            }
        }
        completionOperation.addDependency(lastOperation)
        
        return operations + [completionOperation]
    }
    
}


fileprivate class CompletionOperation: AsynchronousOperation {
    
    override func main() {
        finish()
    }
    
}
