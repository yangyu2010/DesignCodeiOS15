//
//  TabBar.swift
//  DesignCodeiOS15
//
//  Created by Yu Yang on 4/12/23.
//

import SwiftUI

struct TabBar: View {
    @AppStorage("selectedTab") private var selectedTab: Tab = .home
    @State private var color = Color.teal
    @State private var itemWidth: CGFloat = 0
    
    var body: some View {
        HStack {
            buttons
        }
        .padding(.horizontal, 8)
        .padding(.top, 14)
        .frame(height: 88, alignment: .top)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
        .background(
            background
        )
        .overlay(
            overlay
        )
//            .strokeStyle(cornerRadius: 34)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
    
    var buttons: some View {
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
            .blendMode(selectedTab == item.tab ? .overlay : .normal)
            .overlay(
                GeometryReader(content: { proxy in
                    //                            Text("\(proxy.size.width)")
                    
                    Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                })
            )
            .onPreferenceChange(TabPreferenceKey.self) { value in
                itemWidth = value
            }
        }
    }
    
    
    var background: some View {
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
            Circle().fill(color).frame(width: itemWidth)
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
        .padding(.horizontal, 8)
    }
    
    var overlay: some View {
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
                .frame(width: itemWidth)
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
        .padding(.horizontal, 8)
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
