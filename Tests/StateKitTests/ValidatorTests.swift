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
            TestValidator(state: .onboarding, nextState: .setup, isValid: true)
            TestValidator(state: .setup, nextState: .authentication, isValid: false)
            TestValidator(state: .authentication, nextState: .app, isValid: false)
        }
        XCTAssertEqual(stateValidator.currentState, .setup)
    }

    func testValidStateAfterInvalidState() {
        let stateValidator: StateValidator<AppState> = StateValidator(initialState: .onboarding) {
            TestValidator(state: .onboarding, nextState: .setup, isValid: true)
            TestValidator(state: .setup, nextState: .authentication, isValid: false)
            TestValidator(state: .authentication, nextState: .app, isValid: true)
        }
        XCTAssertEqual(stateValidator.currentState, .setup)
    }

    func testAllInvalidStates() {
        let stateValidator: StateValidator<AppState> = StateValidator(initialState: .onboarding) {
            TestValidator(state: .onboarding, nextState: .setup, isValid: false)
            TestValidator(state: .setup, nextState: .authentication, isValid: false)
            TestValidator(state: .authentication, nextState: .app, isValid: false)
        }
        XCTAssertEqual(stateValidator.currentState, .onboarding)
    }

    func testStateValidatorChange() {
        let onboardingValidator: TestValidator = TestValidator(state: .onboarding, nextState: .setup, isValid: true)
        let stateValidator: StateValidator<AppState> = StateValidator(initialState: .onboarding) {
            onboardingValidator
            TestValidator(state: .setup, nextState: .authentication, isValid: false)
            TestValidator(state: .authentication, nextState: .app, isValid: false)
        }
        XCTAssertEqual(stateValidator.currentState, .setup)
        onboardingValidator.isValid = false
        wait(forSeconds: 0.1)
        XCTAssertEqual(stateValidator.currentState, .onboarding)
    }
}
