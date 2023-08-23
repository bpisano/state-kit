//
//  File.swift
//  
//
//  Created by Benjamin Pisano on 23/08/2023.
//

import XCTest

extension XCTestCase {
    func wait(forSeconds seconds: TimeInterval) {
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for \(seconds) seconds")], timeout: seconds)
    }
}
