//
//  File.swift
//  
//
//  Created by Benjamin Pisano on 23/08/2023.
//

import Foundation

@resultBuilder
public struct ValidatorBuilder<_State: State> {
    public static func buildBlock<E: Validator>(_ e: E) -> [AnyValidator<_State>] where E._State == _State {
        [e.eraseAsAnyValidator()]
    }

    public static func buildBlock<E1: Validator, E2: Validator>(_ e1: E1, _ e2: E2) -> [AnyValidator<_State>] where E1._State == _State, E2._State == _State {
        [e1.eraseAsAnyValidator(), e2.eraseAsAnyValidator()]
    }

    public static func buildBlock<E1: Validator, E2: Validator, E3: Validator>(_ e1: E1, _ e2: E2, _ e3: E3) -> [AnyValidator<_State>] where E1._State == _State, E2._State == _State, E3._State == _State {
        [e1.eraseAsAnyValidator(), e2.eraseAsAnyValidator(), e3.eraseAsAnyValidator()]
    }

    public static func buildBlock<E1: Validator, E2: Validator, E3: Validator, E4: Validator>(_ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4) -> [AnyValidator<_State>] where E1._State == _State, E2._State == _State, E3._State == _State, E4._State == _State {
        [e1.eraseAsAnyValidator(), e2.eraseAsAnyValidator(), e3.eraseAsAnyValidator(), e4.eraseAsAnyValidator()]
    }

    public static func buildBlock<E1: Validator, E2: Validator, E3: Validator, E4: Validator, E5: Validator>(_ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5) -> [AnyValidator<_State>] where E1._State == _State, E2._State == _State, E3._State == _State, E4._State == _State, E5._State == _State {
        [e1.eraseAsAnyValidator(), e2.eraseAsAnyValidator(), e3.eraseAsAnyValidator(), e4.eraseAsAnyValidator(), e5.eraseAsAnyValidator()]
    }

    public static func buildBlock<E1: Validator, E2: Validator, E3: Validator, E4: Validator, E5: Validator, E6: Validator>(_ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6) -> [AnyValidator<_State>] where E1._State == _State, E2._State == _State, E3._State == _State, E4._State == _State, E5._State == _State, E6._State == _State {
        [e1.eraseAsAnyValidator(), e2.eraseAsAnyValidator(), e3.eraseAsAnyValidator(), e4.eraseAsAnyValidator(), e5.eraseAsAnyValidator(), e6.eraseAsAnyValidator()]
    }

    public static func buildBlock<E1: Validator, E2: Validator, E3: Validator, E4: Validator, E5: Validator, E6: Validator, E7: Validator>(_ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6, _ e7: E7) -> [AnyValidator<_State>] where E1._State == _State, E2._State == _State, E3._State == _State, E4._State == _State, E5._State == _State, E6._State == _State, E7._State == _State {
        [e1.eraseAsAnyValidator(), e2.eraseAsAnyValidator(), e3.eraseAsAnyValidator(), e4.eraseAsAnyValidator(), e5.eraseAsAnyValidator(), e6.eraseAsAnyValidator(), e7.eraseAsAnyValidator()]
    }

    public static func buildBlock<E1: Validator, E2: Validator, E3: Validator, E4: Validator, E5: Validator, E6: Validator, E7: Validator, E8: Validator>(_ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6, _ e7: E7, _ e8: E8) -> [AnyValidator<_State>] where E1._State == _State, E2._State == _State, E3._State == _State, E4._State == _State, E5._State == _State, E6._State == _State, E7._State == _State, E8._State == _State {
        [e1.eraseAsAnyValidator(), e2.eraseAsAnyValidator(), e3.eraseAsAnyValidator(), e4.eraseAsAnyValidator(), e5.eraseAsAnyValidator(), e6.eraseAsAnyValidator(), e7.eraseAsAnyValidator(), e8.eraseAsAnyValidator()]
    }

    public static func buildBlock<E1: Validator, E2: Validator, E3: Validator, E4: Validator, E5: Validator, E6: Validator, E7: Validator, E8: Validator, E9: Validator>(_ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6, _ e7: E7, _ e8: E8, _ e9: E9) -> [AnyValidator<_State>] where E1._State == _State, E2._State == _State, E3._State == _State, E4._State == _State, E5._State == _State, E6._State == _State, E7._State == _State, E8._State == _State, E9._State == _State {
        [e1.eraseAsAnyValidator(), e2.eraseAsAnyValidator(), e3.eraseAsAnyValidator(), e4.eraseAsAnyValidator(), e5.eraseAsAnyValidator(), e6.eraseAsAnyValidator(), e7.eraseAsAnyValidator(), e8.eraseAsAnyValidator(), e9.eraseAsAnyValidator()]
    }

    public static func buildBlock<E1: Validator, E2: Validator, E3: Validator, E4: Validator, E5: Validator, E6: Validator, E7: Validator, E8: Validator, E9: Validator, E10: Validator>(_ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6, _ e7: E7, _ e8: E8, _ e9: E9, _ e10: E10) -> [AnyValidator<_State>] where E1._State == _State, E2._State == _State, E3._State == _State, E4._State == _State, E5._State == _State, E6._State == _State, E7._State == _State, E8._State == _State, E9._State == _State, E10._State == _State {
        [e1.eraseAsAnyValidator(), e2.eraseAsAnyValidator(), e3.eraseAsAnyValidator(), e4.eraseAsAnyValidator(), e5.eraseAsAnyValidator(), e6.eraseAsAnyValidator(), e7.eraseAsAnyValidator(), e8.eraseAsAnyValidator(), e9.eraseAsAnyValidator(), e10.eraseAsAnyValidator()]
    }
}

