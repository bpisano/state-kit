//
//  File.swift
//  
//
//  Created by Benjamin Pisano on 23/08/2023.
//

import Foundation
import Combine
import StateKit

final class TestValidator: Validator {
    public let state: AppState
    public let nextState: AppState?
    public var isValid: Bool {
        didSet {
            shouldPerformValidation.send()
        }
    }
    public let shouldPerformValidation: PassthroughSubject<Void, Never> = .init()

    init(
        state: AppState,
        nextState: AppState? = nil,
        isValid: Bool
    ) {
        self.state = state
        self.nextState = nextState
        self.isValid = isValid
    }
}

extension Validator where Self == TestValidator {
    static func test(state: AppState, nextState: AppState?, isValid: Bool) -> Self {
        .init(state: state, nextState: nextState, isValid: isValid)
    }
}
