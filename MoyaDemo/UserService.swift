//
//  UserService.swift
//  MoyaDemo
//
//  Created by Steven.Hsieh on 2021/5/11.
//

import Foundation
import Moya

enum UserService: TargetType {
    case getData
}

extension UserService {
    
    typealias Response = [UserModel]
    
    var baseURL: URL {
        if let url = URL(string:  "https://jsonplaceholder.typicode.com") {
            return url
        } else {
            return URL(string: "")!
        }
    }
    
    var path: String {
        return "/users"
    }
    
    var method: Moya.Method {
        .get
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        Task.requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    
    struct UserModel: Decodable {
        let id: Int
        let name: String
        let username: String
        let email: String
        let address: Address
        let phone: String
        let website: String
    }
    
    struct Address: Decodable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String
    }
    
}

