//
//  MockURLSession.swift
//  BlockOneTests
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation

/// An instance of MockURLSession comes with one data task with visibility into its resume state.
/// Once the task has ran, the session is dirty and you must create a new instance for subsequent tests.
class MockURLSession: URLSession {
    
    let nextDataTask = MockURLSessionDataTask()
    private(set) var lastURL: URL?
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        lastURL = request.url
        return nextDataTask
    }
    
}
