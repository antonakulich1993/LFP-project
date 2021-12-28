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


//Thread 10: Fatal error: 'try!' expression unexpectedly raised an error: Swift.DecodingError.typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))
//"{\"id\":4,\"created_at\":\"2021-11-26\",\"updated_at\":\"2021-11-26\",\"location\":\"Жудро\",\"game\":\"Football\",\"date\":\"2021-12-30\",\"time\":\"11:00:00\",\"duration\":60,\"price\":\"10.00\",\"currency\":\"BYN\",\"is_price_total\":true,\"min_players\":10,\"max_players\":15,\"partymaker\":1,\"joined_usernames\":[\"Gaagle93\",\"kopytok\",\"test1\",\"Vlad\",\"Anya\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"],\"joined_cnt\":5}"
