//
//  APIClient.swift
//  ReduxUIKitDemo
//
//  Created by Orest Patlyka on 07.10.2020.
//

import Foundation

typealias ResponseCallback<T: Decodable> = (Result<T, Error>) -> Void

struct UsersResponse: Decodable {
    let data: [UserResponse]
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

struct UserResponse: Decodable {
    let id: Int
    let name: String?
    let age: Int?
}

class APIClient {
    static func getUsers(callback: @escaping ResponseCallback<UsersResponse>) {
        // loading simulation
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            return callback(.success(.mock()))
        }
    }
    
    static func getNewUser(callback: @escaping ResponseCallback<UserResponse>) {
        // loading simulation
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            return callback(.success(UserResponse(id: lastId + 1, name: "New name", age: 25)))
        }
    }
}

private var lastId = 3
