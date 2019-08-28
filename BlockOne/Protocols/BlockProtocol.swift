//
//  BlockProtocol.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation

protocol BlockProtocol {
    
    var id: String { get }
    var previousBlockID: String { get }
    var producer: String { get }
    var producerSignature: String { get }
    
}

