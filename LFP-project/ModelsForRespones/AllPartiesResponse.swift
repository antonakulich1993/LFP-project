//
//  AllPartiesResponse.swift
//  LFP-project
//
//  Created by MacBook on 21.12.21.
//

import Foundation

struct AllPartiesResponse: Codable {
    
    enum CodingKeys: String, CodingKey {
        case currency
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case location
        case game
        case date
        case time
        case duration
        case price
        case isPriceTotal = "is_price_total"
        case minPlayers = "min_players"
        case maxPlayers = "max_players"
        case partymaker
    }
    let currency: String?
    let createdAt: String?
    let updatedAt: String?
    let location: String?
    let game: String?
    let date: String?
    let time: String?
    let duration: String?
    let price: String?
    let isPriceTotal: String?
    let minPlayers: String?
    let maxPlayers: String?
    let partymaker: String?
}
