//
//  MockURLSession.swift
//  BlockOneTests
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation

class MockURLSession: URLSession {
    
    var nextDataTask: MockURLSessionDataTask!
    private(set) var lastURL: URL?
    
    var shouldReturnData: Bool = true
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        lastURL = request.url
        return nextDataTask
    }
    
}
