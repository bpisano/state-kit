//
//  File.swift
//  
//
//  Created by Benjamin Pisano on 25/08/2023.
//

import XCTest
import StateKitMacros
import SwiftSyntaxMacrosTestSupport

final class ValidateMacroTests: XCTestCase {
    func testValidateMacro() {
        assertMacroExpansion(
            """
            @Validate(AppState.onboarding)
            struct OnboardingValidator {
            }
            """
            ,
            expandedSource:
            """
            struct OnboardingValidator {

                let state = AppState.onboarding

                let shouldPerformValidation: PassthroughSubject<Void, Never> = .init()
            }
            """,
            macros: [
                "Validate": ValidateMacro.self
            ]
        )
    }
}
