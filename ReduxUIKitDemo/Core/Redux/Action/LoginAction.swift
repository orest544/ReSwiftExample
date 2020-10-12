//
//  LoginAction.swift
//  ReduxUIKitDemo
//
//  Created by Orest Patlyka on 12.10.2020.
//

import ReSwift
import ReSwiftThunk

enum LoginAction: Action {
    case loggedIn
    case error(String)
}

enum LoginActionCreator: Action {
    static func login(credentials: Credentials) -> Thunk<AppState> {
        return .init { (dispatch, getState) in
            if PredefinedCredentials.isValid(credentials: credentials) {
                dispatch(LoginAction.loggedIn)
            } else {
                dispatch(LoginAction.error("Wrong credentials"))
            }
        }
    }
}
