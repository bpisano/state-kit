//
//  ValidatorTests.swift
//  
//
//  Created by Benjamin Pisano on 23/08/2023.
//

import XCTest
import StateKit

final class ValidatorTests: XCTestCase {
    func testStateValidation() {
        let stateValidator: StateValidator<AppState> = StateValidator(initialState: .onboarding) {
            TestValidator(state: .onboarding, nextState: .authentication, isValid: true)
            TestValidator(state: .authentication, nextState: .app, isValid: false)
            TestValidator(state: .app, isValid: false)
        }
        XCTAssertEqual(stateValidator.currentState, .authentication)
    }

    func testValidStateAfterInvalidState() {
        let stateValidator: StateValidator<AppState> = StateValidator(initialState: .onboarding) {
            TestValidator(state: .onboarding, nextState: .authentication, isValid: true)
            TestValidator(state: .authentication, nextState: .app, isValid: false)
            TestValidator(state: .app, isValid: true)
        }
        XCTAssertEqual(stateValidator.currentState, .authentication)
    }

    func testAllInvalidStates() {
        let stateValidator: StateValidator<AppState> = StateValidator(initialState: .onboarding) {
            TestValidator(state: .onboarding, nextState: .authentication, isValid: false)
            TestValidator(state: .authentication, nextState: .app, isValid: false)
            TestValidator(state: .app, isValid: false)
        }
        XCTAssertEqual(stateValidator.currentState, .onboarding)
    }

    func testStateValidatorChange() {
        let onboardingValidator: TestValidator = TestValidator(state: .onboarding, nextState: .authentication, isValid: true)
        let stateValidator: StateValidator<AppState> = StateValidator(initialState: .onboarding) {
            onboardingValidator
            TestValidator(state: .authentication, nextState: .app, isValid: false)
            TestValidator(state: .app, isValid: false)
        }
        XCTAssertEqual(stateValidator.currentState, .authentication)
        onboardingValidator.isValid = false
        wait(forSeconds: 0.1)
        XCTAssertEqual(stateValidator.currentState, .onboarding)
    }
}
