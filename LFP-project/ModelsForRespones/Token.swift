//
//  Token.swift
//  LFP-project
//
//  Created by MacBook on 20.12.21.
//

import Foundation

struct Token: Codable {
    
    enum CodingKeys: String, CodingKey {
        case token
    }
    let token: String
    
    init(token: String) {
        self.token = token
        DefaultsManager.token = token
    }
}
