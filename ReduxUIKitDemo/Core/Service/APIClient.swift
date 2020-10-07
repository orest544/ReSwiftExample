//
//  APIClient.swift
//  ReduxUIKitDemo
//
//  Created by Orest Patlyka on 07.10.2020.
//

import Foundation

typealias ResponseCallback<T: Decodable> = (Result<T, Error>) -> Void

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
    
    static private var lastId = 3
}
