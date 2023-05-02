//
//  ContentView.swift
//  WorkoutJournal
//
//  Created by Jose Blanco on 4/3/23.
//

import SwiftUI
import AnimatedTabBar
import UIKit


struct Navigation: View {
    
    init() {
            //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.primary)]
        
            //Use this if NavigationBarTitle is with displayMode = .inline
            //UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
        }
    
    @Environment(\.colorScheme) var colorScheme
    @StateObject var db = DataBaseManager.shared
    
    @State private var selectedIndex = 0
    @State private var prevSelectedIndex = 0
    
    let names = ["doc.text.image", "dumbbell"]
    
    var body: some View {
        
        
//        ZStack(alignment: .bottom) {

//            if colorScheme == .dark {
//                Color(.systemGroupedBackground).ignoresSafeArea(.all)
//            } else {
//                Color(.systemGroupedBackground).ignoresSafeArea(.all)
//            }

//            switch selectedIndex {
//            case 0:
//                ListView()
//            case 1:
//                ChartView()
//            default:
//                Text("Error TabView")
//            }
//
//
//            VStack(spacing: 50) {
//
//                AnimatedTabBar(selectedIndex: $selectedIndex,
//                               views: (0..<names.count).map { wiggleButtonAt($0, name: names[$0]) })
//                .cornerRadius(16)
//                .selectedColor(colorScheme == .light ? Color.black : Color.white)
//                .unselectedColor(colorScheme == .light ? Color.black.opacity(0.3) : Color.white.opacity(0.3))
//                .ballColor(colorScheme == .dark ? .white : .black)
//                .barColor(colorScheme == .light ? Color(UIColor.lightGray).opacity(0.3) : Color(UIColor.darkGray))
//                .verticalPadding(28)
//                .ballTrajectory(.parabolic)
//            }.ignoresSafeArea(.keyboard, edges: .bottom)
//
//
//
//            .frame(maxWidth: .infinity)
//            .padding(8)
//
//
//        }
//        .onChange(of: selectedIndex) { [selectedIndex] _ in
//            prevSelectedIndex = selectedIndex
//        }
        TabView(selection: $selectedIndex) {
            
            ListView()
                .tabItem {
                    Label("Subscriptions", systemImage: "doc.text.image")
                }
                .tag(0)
            ChartView()
                .tabItem {
                    Label("Charts", systemImage: "chart.xyaxis.line")
                }
                .tag(1)
        }
        
    }
    
    
    
    func colorButtonAt(_ index: Int, type: ColorButton.AnimationType) -> some View {
        ColorButton(
            image: Image("colorTab\(index+1)"),
            colorImage: Image("colorTab\(index+1)Bg"),
            isSelected: selectedIndex == index,
            fromLeft: prevSelectedIndex < index,
            toLeft: selectedIndex < index,
            animationType: type)
    }
    
    func dropletButtonAt(_ index: Int) -> some View {
        DropletButton(imageName: "tab\(index+1)", dropletColor: .examplePurple, isSelected: selectedIndex == index)
    }
    
    func wiggleButtonAt(_ index: Int, name: String) -> some View {
        WiggleButton(image: Image(systemName: name), maskImage: Image(systemName: "\(name).fill"), isSelected: selectedIndex == index)
            .scaleEffect(1.2)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
