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
   let price: String
   let currensy: String
   let maxPlayers: Int
   let minPlayers: Int
}
