//
//  File.swift
//  
//
//  Created by Benjamin Pisano on 23/08/2023.
//

import Foundation
import Combine

public final class StateValidator<_State: State> {
    @Published public var currentState: _State

    private let initialState: _State
    private let validators: [AnyValidator<_State>]
    private var cancellableSubscribers: Set<AnyCancellable> = []

    public init(
        initialState: _State,
        @ValidatorBuilder<_State> _ validators: () -> [AnyValidator<_State>]) {
        self.currentState = initialState
        self.initialState = initialState
        self.validators = validators()
        observeValidators()
        performValidation()
    }

    public func performValidation() {
        currentState = getCurrentState()
    }

    private func observeValidators() {
        validators.forEach { validator in
            validator.shouldPerformValidation
                .receive(on: DispatchQueue.main)
                .sink { [weak self] in
                    self?.performValidation()
                }
                .store(in: &cancellableSubscribers)
        }
    }


    private func getCurrentState() -> _State {
        var currentState: _State = initialState
        while let validator = getValidator(for: currentState), validator.isValid {
            currentState = validator.nextState
        }
        return currentState
    }

    private func getValidator(for state: _State) -> AnyValidator<_State>? {
        validators.first(where: { $0.state == state })
    }
}
