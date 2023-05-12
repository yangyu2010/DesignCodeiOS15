//
//  CourserView.swift
//  DesignCodeiOS15
//
//  Created by Yu Yang on 5/9/23.
//

import SwiftUI

struct CourserView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    @State var appear = [false, false, false]
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
                
                content
                    .offset(y: 100)
                    .padding(.top, 30)
                    .padding(.bottom, 200)
                    .opacity(appear[2] ? 1 : 0)
            }
            .background(Color("Background"))
            .ignoresSafeArea()

            button
        }.onAppear {
            withAnimation(.easeOut.delay(0.3)) {
                appear[0] = true
            }
            withAnimation(.easeOut.delay(0.4)) {
                appear[1] = true
            }
            withAnimation(.easeOut.delay(0.5)) {
                appear[2] = true
            }
        }
        .onChange(of: show) { newValue in
            appear[0] = false
            appear[1] = false
            appear[2] = false
        }
    }

    var cover: some View {
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .foregroundColor(.black)
        .background(
            Image("Illustration 9")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "background_image", in: namespace)
        )
        .background(
            Image("Background 5")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        }
        .overlay {
            VStack(alignment: .leading, spacing: 12) {
                Text("SwiftUI")
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("20 sections - 3 hours".uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)

                Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                    .font(.footnote)
                    .matchedGeometryEffect(id: "text", in: namespace)

                Divider()
                    .opacity(appear[0] ? 1 : 0)
                HStack {
                    Image("Avatar Default")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .cornerRadius(10)
                        .padding(8)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .strokeStyle(cornerRadius: 18)
                    Text("Taught by Meng to")
                        .font(.footnote)
                }
                .opacity(appear[1] ? 1 : 0)
            }
            .padding(20)
            .background {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                    }
                    .matchedGeometryEffect(id: "blur", in: namespace)
            }
            .offset(y: 250)
            .padding(20)
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("SwiftUI is hands-down the best way for designers to take a first step into code. ")
                .font(.title3.weight(.medium))
            
            Text("This course")
                .font(.title.bold())
            
            Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")

        }
        .padding(.horizontal, 20)
    }
    
    
    var button: some View {
        Button {
            withAnimation(.closeCard) {
                show.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .padding(.top, 20)
        .ignoresSafeArea()
    }
}

struct CourserView_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        CourserView(namespace: namespace, show: .constant(false))
    }
}
