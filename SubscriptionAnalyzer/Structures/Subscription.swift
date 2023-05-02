//
//  Subscription.swift
//  SubscriptionAnalyzer
//
//  Created by Jose Blanco on 4/25/23.
//

import Foundation

enum Recurrence: String, Codable, CaseIterable {
    
    static var allCases: [Recurrence] {
        return [.bimonthly, .biweekly, .monthly, .sixMonths, .weekly, .yearly]
    }
    
    case weekly = "Weekly"
    case biweekly = "Biweekly"
    case monthly = "Monthly"
    case yearly = "Yearly"
    case bimonthly = "Bimonthly"
    case sixMonths = "Every six months"
    
}

enum Category: String, Codable, CaseIterable {
    
    static var allCases: [Category] {
        return [.entertainment, .utility, .productivity, .health, .lifestyle, .donation, .food, .shopping]
    }
    
    case entertainment = "Entertainment"
    case utility = "Utility"
    case productivity = "Productivity"
    case health = "Health"
    case lifestyle = "Lifestyle"
    case donation = "Donation"
    case food = "Food"
    case shopping = "Shopping"
}

struct Subscription: Identifiable, Hashable, Codable {
    
    var id: UUID
    var name: String
    var description: String
    var price: Double
    var recurrence: Recurrence
    var recurrenceDate: Date
    var startDate: Date
    var stopDate: Date?
    var category: Category
    
    
}


