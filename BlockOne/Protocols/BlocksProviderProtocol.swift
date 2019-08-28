//
//  BlocksProviderProtocol.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation
import EosioSwift

protocol BlocksProviderProtocol {
    
    // Note: could add completion with error but can add it later
    func fetchMostRecentBlocks(count: Int, _ completion: @escaping ([EosioRpcBlockResponse]) -> Void)
    
}
