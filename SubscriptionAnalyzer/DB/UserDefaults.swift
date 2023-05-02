//
//  UserDefaults.swift
//  SubscriptionAnalyzer
//
//  Created by Jose Blanco on 4/25/23.
//

import Foundation

class UserDefaultsStorage: ObservableObject {
    let defaults = UserDefaults.standard
    
    private let subscriptionKey = "subscriptionKey"
    
    func saveSubscriptions(data: Data) {
        defaults.set(data, forKey: subscriptionKey)
    }
    
    func getSubscriptions() -> Data? {
        if let object = defaults.object(forKey: subscriptionKey) as? Data {
            return object
        } else {
            return nil
        }
    }
    
    class var shared: UserDefaultsStorage {
        struct Static {
            static let instance = UserDefaultsStorage()
        }
        
        return Static.instance
    }
    
}
