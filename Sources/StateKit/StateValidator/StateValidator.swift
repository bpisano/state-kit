//
//  File.swift
//  
//
//  Created by Benjamin Pisano on 23/08/2023.
//

import Foundation
import Observation
import Combine

@MainActor
@Observable
public final class StateValidator<_State: State> {
    public var currentState: _State {
        didSet {
            currentStatePublisher.send(currentState)
        }
    }
    @ObservationIgnored public var currentStatePublisher: CurrentValueSubject<_State, Never>

    @ObservationIgnored private let initialState: _State
    @ObservationIgnored private let validators: [AnyValidator<_State>]
    @ObservationIgnored private var cancellableSubscribers: Set<AnyCancellable> = []

    public init(
        initialState: _State,
        @ValidatorBuilder<_State> _ validators: () -> [AnyValidator<_State>]
    ) {
        self.currentState = initialState
        self.currentStatePublisher = .init(initialState)
        self.initialState = initialState
        self.validators = validators()
        observeValidators()
        performValidation()
    }

    public func performValidation() {
        Task {
            currentState = await getCurrentState()
        }
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

    private func getCurrentState() async -> _State {
        var currentState: _State = initialState
        while let validator = getValidator(for: currentState), await validator.isValid {
            currentState = validator.nextState
        }
        return currentState
    }

    private func getValidator(for state: _State) -> AnyValidator<_State>? {
        validators.first(where: { $0.state == state })
    }
}
