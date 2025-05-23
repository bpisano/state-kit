//
//  File.swift
//  
//
//  Created by Benjamin Pisano on 23/08/2023.
//

import Foundation
import Combine

public struct AnyValidator<_State: State>: Validator {
    private let validator: any Validator

    public var state: _State { validator.state as! _State }
    public var isValid: Bool {
        get async { await validator.isValid }
    }
    public var nextState: _State { validator.nextState as! _State }
    public var shouldPerformValidation: PassthroughSubject<Void, Never> { validator.shouldPerformValidation }

    public init<V: Validator>(_ validator: V) where V._State == _State {
        self.validator = validator
    }
}
