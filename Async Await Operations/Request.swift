//
//  Request.swift
//  Async Await Operations
//
//  Created by Macbook Air 2017 on 22. 11. 2023..
//

import Foundation
import UIKit

enum MyError: Error {
    case failedToGetUsers
}

class Request {
    
    static func fetchUsers() async -> Result<[User], Error> {
        guard let url = URL(string: URL_STRING) else {
            return .failure(MyError.failedToGetUsers)
        }
        var users = [User]()
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            users = try JSONDecoder().decode([User].self, from: data)
        }
        catch {
            return .failure(error)
        }
        
        return .success(users)
    }
}
