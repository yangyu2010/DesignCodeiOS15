//
//  HomeView.swift
//  DesignCodeiOS15
//
//  Created by Yu Yang on 4/19/23.
//

import SwiftUI

struct HomeView: View {
    @State private var hasScrolled = false
    
    var body: some View {
        ScrollView {
            GeometryReader { proxy in
                Text("\(proxy.frame(in: .named("scroll")).minY)")
                
                Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
            }
            
            TabView {
                ForEach(courses) { item in
                    FeaturedItem(course: item)
                }
            }
//            .tabViewStyle(.page(indexDisplayMode: .never))
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 430)
            .background(
                Image("Blob 1")
                    .offset(x: 250, y:-100)
            )
            
            Color.clear.frame(height: 1000)
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                hasScrolled = value < 0
            }
        })
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 70)
        })
        .overlay {
            NavigationBar(title: "Featured", hasScrolled: $hasScrolled)
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
