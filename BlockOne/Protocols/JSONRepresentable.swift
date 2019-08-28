//
//  File.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation

protocol JSONRepresentable {
    
    var json: [String: Any]? { get set }
    var jsonString: String? { get }
    
}

extension JSONRepresentable {
    
    var jsonString: String? {
        guard let data = try? JSONSerialization.data(withJSONObject: json as Any, options: .prettyPrinted) else {
            return nil
        }
        let text = String(data: data, encoding: .utf8)
        return text
    }
    
}
