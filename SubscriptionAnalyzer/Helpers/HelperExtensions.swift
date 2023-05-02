//
//  HelperExtensions.swift
//  SubscriptionAnalyzer
//
//  Created by Jose Blanco on 4/26/23.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

extension  UITextField {
   @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
      self.resignFirstResponder()
   }
}

func determineColor(subscription: Subscription) -> Color {
    switch subscription.category {
    case .donation:
        return Color.indigo
    case .entertainment:
        return Color.pink
    case .food:
        return Color.orange
    case .health:
        return Color.red
    case .lifestyle:
        return Color.green
    case .productivity:
        return Color.purple
    case .utility:
        return Color.blue
    case .shopping:
        return Color.yellow
    }
}

func determineColor(cases: Category) -> Color {
    switch cases {
    case .donation:
        return Color.indigo
    case .entertainment:
        return Color.pink
    case .food:
        return Color.orange
    case .health:
        return Color.red
    case .lifestyle:
        return Color.green
    case .productivity:
        return Color.purple
    case .utility:
        return Color.blue
    case .shopping:
        return Color.yellow
    }
}
