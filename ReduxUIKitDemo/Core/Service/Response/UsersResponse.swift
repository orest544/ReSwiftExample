//
//  UsersResponse.swift
//  ReduxUIKitDemo
//
//  Created by Orest Patlyka on 07.10.2020.
//

import Foundation

struct UsersResponse: Decodable {
    let data: [UserResponse]
}

struct UserResponse: Decodable {
    let id: Int
    let name: String?
    let age: Int?
}

extension UsersResponse {
    static func mock() -> Self {
        return Self.init(data: [
            UserResponse(id: 1, name: "Ivan", age: 23),
            UserResponse(id: 2, name: "Petro", age: 52),
            UserResponse(id: 3, name: "Petro", age: nil)
        ])
    }
}
