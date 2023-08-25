//
//  File.swift
//  
//
//  Created by Benjamin Pisano on 24/08/2023.
//

import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct Plugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        ValidateMacro.self
    ]
}
