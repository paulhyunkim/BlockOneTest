//
//  MockURLSessionDataTask.swift
//  BlockOneTests
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation

class MockURLSessionDataTask: URLSessionDataTask {
    
    private(set) var resumeWasCalled = false

    override func resume() {
        resumeWasCalled = true
    }
    
}
