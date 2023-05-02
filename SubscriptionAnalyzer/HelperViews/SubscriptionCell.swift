//
//  SubscriptionCell.swift
//  SubscriptionAnalyzer
//
//  Created by Jose Blanco on 4/25/23.
//

import Foundation
import SwiftUI

struct SubscriptionCell: View {
    var subscription: Subscription
    var geometryWidth: CGFloat
    
    var body: some View {
        
        HStack {
            Spacer()
                .frame(width: 50)
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [determineColor(subscription: subscription), determineColor(subscription: subscription).opacity(0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                
                
                
                VStack {
                    Text(String(format: "$%.02f", subscription.price/100))
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                    
                }
                //.frame(minWidth: UIScreen.main.bounds.width * 0.9)
            }
            .frame(width: geometryWidth * (1/4), height: 100, alignment: .leading)
            
            .padding(10)
            
            VStack(alignment: .leading) {
                Text(subscription.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .padding(.bottom, 5)
                    .multilineTextAlignment(.leading)
                    
                Text(subscription.description)
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .padding(.bottom, 5)
                    .multilineTextAlignment(.leading)
                
            }
            .frame(width: geometryWidth * (3/4), height: 100, alignment: .leading)
            .padding(.horizontal, 0)
        }
        .padding(0)
        .frame(width: geometryWidth, height: 150)
        .background(.thinMaterial)
        .cornerRadius(25)
            
    
//        .onTapGesture {
////            EditMiddlePopUp(title: subscription.name, description: subscription.description, date: subscription.startDate, recurrenceDate: subscription.recurrenceDate, selected: subscription.category.rawValue, selectedRecurrence: subscription.recurrence.rawValue, price: subscription.price, uuid: subscription.id).present()
//        }
    }
    
    
}


