//
//  ContentView.swift
//  DesignCodeiOS15
//
//  Created by Yu Yang on 3/13/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") private var selectedTab: Tab = .home

    var body: some View {
        ZStack(alignment: .bottom) {
            switch selectedTab {
            case .home:
                HomeView()
            case .explore:
                AccountView()
            case .notifications:
                AccountView()
            case .library:
                AccountView()
            }
            
            TabBar()
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 44)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
            .previewDevice("iPhone 14")
            .preferredColorScheme(.light)
        
        ContentView()
            .previewDevice("iPhone 14")
            .preferredColorScheme(.dark)

    }
}
