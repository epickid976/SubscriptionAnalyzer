//
//  OvalTextFieldStyle.swift
//  SubscriptionAnalyzer
//
//  Created by Jose Blanco on 4/26/23.
//

import Foundation
import SwiftUI


struct OvalTextFieldStyle: TextFieldStyle {
    var color: Color
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [color.opacity(0.9), color.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
    }
}
