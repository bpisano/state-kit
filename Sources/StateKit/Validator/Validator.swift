//
//  File.swift
//  
//
//  Created by Benjamin Pisano on 23/08/2023.
//

import Foundation
@preconcurrency import Combine

public protocol Validator: Sendable {
    associatedtype _State: State

    var state: _State { get }
    var nextState: _State { get }
    var isValid: Bool { get async }
    nonisolated var shouldPerformValidation: PassthroughSubject<Void, Never> { get }
}

extension Validator {
    public func eraseAsAnyValidator() -> AnyValidator<_State> {
        .init(self)
    }
}
