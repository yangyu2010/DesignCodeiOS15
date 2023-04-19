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
            Group {
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
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            TabBar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14")
            .preferredColorScheme(.dark)
        
        ContentView()
            .previewDevice("iPhone 14")
            .preferredColorScheme(.light)
    }
}
