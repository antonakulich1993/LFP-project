//
//  Players.swift
//  LFP-project
//
//  Created by MacBook on 28.12.21.
//

import Foundation

struct PlayersModel: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case usernames = "joined_usernames"
        case joinedUsers = "joined_cnt"
    }
    let usernames: [String]
    let joinedUsers: Int
}
