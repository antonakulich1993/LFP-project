//
//  DefaultsManager.swift
//  LFP-project
//
//  Created by MacBook on 21.12.21.
//

import Foundation

class DefaultsManager {
    class var token: String? {
        
        get {
            return UserDefaults.standard.value(forKey: "token") as? String
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "token")
        }
    }
}
