//
//  User.swift
//  ReduxUIKitDemo
//
//  Created by Orest Patlyka on 07.10.2020.
//

import Foundation

struct User {
    let name: String
    let age: Int
}

extension User {
    init(userResponse: UserResponse) {
        name = userResponse.name ?? "Unknown"
        age = userResponse.age ?? 0
    }
}
