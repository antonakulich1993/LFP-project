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
    let duration: Int?
    let price: Double
    let minPlayers: Int
    let maxPlayers: Int
    let partymaker: Int
    let isPriceTotal: Bool
}
//[{\"id\":4,\"created_at\":\"2021-11-26\",\"updated_at\":\"2021-11-26\",\"location\":\"Жудро\",\"game\":\"Football\",\"date\":\"2021-12-30\",\"time\":\"11:00:00\",\"duration\":60,\"price\":\"10.00\",\"currency\":\"BYN\",\"is_price_total\":true,\"min_players\":10,\"max_players\":15,\"partymaker\":1}
