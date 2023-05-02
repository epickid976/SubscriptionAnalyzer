//
//  DatabaseManager.swift
//  SubscriptionAnalyzer
//
//  Created by Jose Blanco on 4/25/23.
//

import Foundation

class DataBaseManager: ObservableObject {
    
    private init() {
        
    }
    
    private let storage = UserDefaultsStorage.shared
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    @Published var subscriptions = [Subscription]()
    
    func initDataBase() {
        
        subscriptions = getSubscriptions()
    }
    
    func getSubscriptions() -> [Subscription] {
        do {
            let data = storage.getSubscriptions()
            
            guard let data = data else {
                return []
            }
            
            return try decoder.decode([Subscription].self, from: data)
        } catch {
            return []
        }
    }
    
    func addSubscription(subscription: Subscription) -> Bool {
        
        do {
            var subscriptions = getSubscriptions()
            
            guard subscriptions.firstIndex(where: {subscription.id == $0.id }) == nil else { return false}
            
            subscriptions.append(subscription)
            let data = try encoder.encode(subscriptions)
            
            storage.saveSubscriptions(data: data)
            
            self.subscriptions = subscriptions
            
            return true
        } catch {
            return false
        }
    }
    
    func updateSubscription(subscription: Subscription) -> Bool {
        
        if !deleteSubscription(subscription: subscription) {
            return false
        }
        
        return addSubscription(subscription: subscription)
    }
    
    func deleteSubscription(subscription: Subscription) -> Bool {
        
        var subscriptions = getSubscriptions()
        
        guard let index = subscriptions.firstIndex(where: {$0.id == subscription.id }) else { return false}
        
        subscriptions.remove(at: index)
        
        do {
            storage.saveSubscriptions(data: try encoder.encode(subscriptions))
            self.subscriptions = subscriptions
            return true
        } catch {
            return false
        }
    }
    
    //STATIC instance
    class var shared: DataBaseManager {
        struct Static {
            static let instance = DataBaseManager()
        }
        
        return Static.instance
    }
}
