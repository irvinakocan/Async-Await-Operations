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
    
    static func fetchUsers(from urlString: String) async -> Result<[User], Error> {
        guard let url = URL(string: urlString) else {
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
