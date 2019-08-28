//
//  MockURLSession.swift
//  BlockOneTests
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation

/// An instance of MockURLSession comes with one data task with visibility into its resume state.
/// Once the task has ran, the session becomes dirty and you must build up a new session for subsequence tests.
class MockURLSession: URLSession {
    
    private let dataTask = MockURLSessionDataTask()
    private(set) var lastURL: URL?
    
    var dataTaskDidResume: Bool {
        return dataTask.resumeWasCalled
    }
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        lastURL = request.url
        return dataTask
    }
    
}
