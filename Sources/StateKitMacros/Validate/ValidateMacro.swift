//
//  File.swift
//  
//
//  Created by Benjamin Pisano on 24/08/2023.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics

public struct ValidateMacro: ExtensionMacro, MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        attachedTo declaration: some DeclGroupSyntax,
        providingExtensionsOf type: some TypeSyntaxProtocol,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [ExtensionDeclSyntax] {
        []
    }

    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard let stateArgument = node.arguments?.description else {
            context.diagnose(
                StateKitDiagnostic.error(
                    for: node,
                    message: "@Validtate should provide a state to validtate."
                )
            )
            return []
        }
        return [
            """
            let state = \(raw: stateArgument)
            """,
            """
            let shouldPerformValidation: PassthroughSubject<Void, Never> = .init()
            """
        ]
    }
}
