//
//  LoginState.swift
//  ReduxUIKitDemo
//
//  Created by Orest Patlyka on 12.10.2020.
//

import ReSwift

struct LoginState: StateType {
    var loggedIn = false
    var error: String?
}

// MARK: - Models

struct Credentials {
    let username: String?
    let password: String?
}
