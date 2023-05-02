//
//  ListView.swift
//  SubscriptionAnalyzer
//
//  Created by Jose Blanco on 4/25/23.
//

import SwiftUI
import AdvancedList
import PopupView
import UIKit
import Introspect

//TO DO
//1. Edit MiddlePopUp
//2. Update + Button
//3. Add swipe gestures (delete,edit)
//4. Add Charts (Create Info Class with arrays of all the data)
//5. Add pause subscription mechanism

struct ListView: View {
    @StateObject var db = DataBaseManager.shared
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        @State var listState: ListState = .items
        NavigationView {
            GeometryReader { geometry in // <- Move Geometry reader here
            ScrollView {
                
                LazyVStack(alignment: .leading, spacing: 10) {
                    
                    ForEach(db.subscriptions, id: \.id) { subscription in
                        SubscriptionCell(subscription: subscription, geometryWidth: geometry.size.width)
                    }
                    
                }
                
            }
            }
            .navigationTitle("Subscriptions")
            .navigationBarItems(trailing: Image(systemName: "plus.circle.fill").onTapGesture {
                AddMiddlePopUp().present()
            })
            .padding(10)
        }
    }
}





struct MiddlePopUp_Previews: PreviewProvider {
    static var previews: some View {
        AddMiddlePopUp()
    }
}


