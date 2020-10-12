//
//  AppReducer.swift
//  ReduxUIKitDemo
//
//  Created by Orest Patlyka on 12.10.2020.
//

import Foundation
import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        loginState: loginReducer(action: action, state: state?.loginState)
    )
}

