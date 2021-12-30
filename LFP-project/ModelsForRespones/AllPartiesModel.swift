//
//  AllPartiesResponse.swift
//  LFP-project
//
//  Created by MacBook on 21.12.21.
//

import Foundation

struct AllPartiesModel: Decodable {
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case currency
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case location
        case game
        case date
        case time
        case duration
        case price
        case minPlayers = "min_players"
        case maxPlayers = "max_players"
        case partymaker
        case isPriceTotal = "is_price_total"
    }
    
    let id : Int
    let currency: String
    let createdAt: String
    let updatedAt: String
    let location: String
    let game: String
    let date: String
    let time: String
    let duration: Int
    let price: String
    let minPlayers: Int
    let maxPlayers: Int
    let partymaker: Int
    let isPriceTotal: Bool
}

