//
//  File.swift
//  
//
//  Created by Benjamin Pisano on 24/08/2023.
//

@attached(extension, conformances: Validator)
@attached(member, names: named(state), named(nextState), named(shouldPerformValidation))
public macro Validate<_State: State>(_ state: _State) = #externalMacro(module: "StateKitMacros", type: "ValidateMacro")
