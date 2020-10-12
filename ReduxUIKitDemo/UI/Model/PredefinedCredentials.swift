//
//  PredefinedCredentials.swift
//  ReduxUIKitDemo
//
//  Created by Orest Patlyka on 07.10.2020.
//

import Foundation

enum PredefinedCredentials {
    static let username = "admin"
    static let password = "admin"
    
    static func isValid(credentials: Credentials) -> Bool {
        return
            credentials.username == PredefinedCredentials.username
            &&
            credentials.password == PredefinedCredentials.password
    }
}
