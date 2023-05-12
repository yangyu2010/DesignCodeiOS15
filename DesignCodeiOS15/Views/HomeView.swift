//
//  HomeView.swift
//  DesignCodeiOS15
//
//  Created by Yu Yang on 4/19/23.
//

import SwiftUI

struct HomeView: View {
    @State private var hasScrolled = false
    @Namespace private var namespace
    @State private var show = false
    @State private var showStatusBar = true

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()

            ScrollView {
                scrollDetection
                featured

                Text("Courses".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                if show == false {
                    CourserItem(namespace: namespace, show: $show)
                        .onTapGesture {
                            withAnimation(.openCard) {
                                show.toggle()
                            }
                        }
                }
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

            if show {
                CourserView(namespace: namespace, show: $show)
                    .zIndex(1)
                    .transition(.asymmetric(insertion: .opacity.animation(.easeInOut(duration: 0.1)), removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))))
//                    .transition()
            }
        }
        .onChange(of: show, perform: { newValue in
            withAnimation(.closeCard) {
                if newValue {
                    showStatusBar = false
                } else {
                    showStatusBar = true
                }
            }
        })
        .statusBar(hidden: !showStatusBar)
    }

    var scrollDetection: some View {
        GeometryReader { proxy in
//                Text("\(proxy.frame(in: .named("scroll")).minY)")
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
    }

    var featured: some View {
        TabView {
            ForEach(courses) { course in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX

                    FeaturedItem(course: course)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX / 40))
                        .overlay {
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .offset(x: 32, y: -80)
                                .offset(x: minX / 2)
                        }
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
