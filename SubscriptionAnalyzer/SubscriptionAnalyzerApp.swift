//
//  SubscriptionAnalyzerApp.swift
//  SubscriptionAnalyzer
//
//  Created by Jose Blanco on 4/25/23.
//

import SwiftUI
@main
struct SubscriptionAnalyzerApp: App {
    
    
    var body: some Scene {
        WindowGroup {
            Navigation().onAppear() {
                DataBaseManager.shared.initDataBase()
                //MKiCloudSync.start(withPrefix: "sync")
            }.implementPopupView()
        }
    }
}
