//
//  AddPartyModel.swift
//  LFP-project
//
//  Created by MacBook on 28.12.21.
//

import Foundation

struct AddPartyModel: Codable {
    
   let game: String
   let location: String
   let date: String
   let time: String
   let duration: Int
   let price: Int
   let currenсy: String
   let maxPlayers: String
   let minPlayers: String
    
    enum CodingKeys: String, CodingKey {
        
        case game
        case location
        case date
        case time
        case duration
        case price
        case currenсy
        case maxPlayers = "max_players"
        case minPlayers = "min_players"
    }
}
