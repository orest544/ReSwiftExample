//
//  LoginReducer.swift
//  ReduxUIKitDemo
//
//  Created by Orest Patlyka on 12.10.2020.
//

import ReSwift

func loginReducer(action: Action, state: LoginState?) -> LoginState {
    var state = state ?? .init()
     
    guard let action = action as? LoginAction else {
        return state
    }
    
    switch action {
    case .loggedIn:
        state.loggedIn = true
        state.error = nil
    case .error(let error):
        state.error = error
        state.loggedIn = false
    }
    
    return state
}

