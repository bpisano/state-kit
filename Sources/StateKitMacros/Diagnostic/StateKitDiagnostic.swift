//
//  File.swift
//  
//
//  Created by Benjamin Pisano on 25/08/2023.
//

import Foundation
import SwiftSyntax
import SwiftDiagnostics

struct StateKitDiagnostic: Error, DiagnosticMessage {
    let message: String
    let diagnosticID: MessageID
    let severity: DiagnosticSeverity

    static func note<S: SyntaxProtocol>(
        for node: S,
        message: String,
        id: String = UUID().uuidString
    ) -> Diagnostic {
        diagnostic(
            for: node,
            message: message,
            id: id,
            severity: .note
        )
    }

    static func warning<S: SyntaxProtocol>(
        for node: S,
        message: String,
        id: String = UUID().uuidString
    ) -> Diagnostic {
        diagnostic(
            for: node,
            message: message,
            id: id,
            severity: .warning
        )
    }

    static func error<S: SyntaxProtocol>(
        for node: S,
        message: String,
        id: String = UUID().uuidString
    ) -> Diagnostic {
        diagnostic(
            for: node,
            message: message,
            id: id,
            severity: .error
        )
    }

    private static func diagnostic<S: SyntaxProtocol>(
        for node: S,
        message: String,
        id: String = UUID().uuidString,
        severity: DiagnosticSeverity
    ) -> Diagnostic {
        .init(
            node: node,
            message: StateKitDiagnostic(
                message: message,
                diagnosticID: .init(
                    domain: "validate",
                    id: id
                ),
                severity: severity
            )
        )
    }
}
