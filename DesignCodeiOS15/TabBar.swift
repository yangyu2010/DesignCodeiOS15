//
//  TabBar.swift
//  DesignCodeiOS15
//
//  Created by Yu Yang on 4/12/23.
//

import SwiftUI

struct TabBar: View {
    @State private var selectedTab: Tab = .home
    @State private var color = Color.teal
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home:
                    ContentView()
                case .explore:
                    AccountView()
                case .notifications:
                    AccountView()
                case .library:
                    AccountView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                ForEach(tabItems) { item in
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            selectedTab = item.tab
                            color = item.color
                        }
                    } label: {
                        VStack(spacing: 0) {
                            Image(systemName: item.icon)
                                .symbolVariant(.fill)
                                .font(.body.bold())
                                .frame(width: 44, height: 29)
                            Text(item.text)
                                .font(.caption2)
                                .lineLimit(1)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .foregroundColor(selectedTab == item.tab ? .primary : .secondary)
                }
            } 
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
            .background(
                HStack {
                    if selectedTab == .library {
                        Spacer()
                    }
                    if selectedTab == .explore {
                        Spacer()
                    }
                    if selectedTab == .notifications {
                        Spacer()
                        Spacer()
                    }
                    Circle().fill(color).frame(width: 80)
                    if selectedTab == .home {
                        Spacer()
                    }
                    if selectedTab == .explore {
                        Spacer()
                        Spacer()
                    }
                    if selectedTab == .notifications {
                        Spacer()
                    }
                }
            )
            .overlay(
                HStack {
                    if selectedTab == .library {
                        Spacer()
                    }
                    if selectedTab == .explore {
                        Spacer()
                    }
                    if selectedTab == .notifications {
                        Spacer()
                        Spacer()
                    }
                    Rectangle()
                        .fill(color)
                        .frame(width: 28, height: 5)
                        .cornerRadius(3)
                        .frame(width: 88)
                        .frame(maxHeight: .infinity, alignment: .top)
                    if selectedTab == .home {
                        Spacer()
                    }
                    if selectedTab == .explore {
                        Spacer()
                        Spacer()
                    }
                    if selectedTab == .notifications {
                        Spacer()
                    }
                }
            )
//            .strokeStyle(cornerRadius: 34)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
}

//struct TabBar: View {
//    var body: some View {
//        TabView {
//            ContentView()
//                .tabItem {
//                    Image(systemName: "house")
//                    Text("Learn Now")
//                }
//            AccountView()
//                .tabItem {
//                    Image(systemName: "magnifyingglass")
//                    Text("Explore")
//                }
//        }
//    }
//}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
