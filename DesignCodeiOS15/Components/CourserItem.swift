//
//  CourserItem.swift
//  DesignCodeiOS15
//
//  Created by Yu Yang on 5/9/23.
//

import SwiftUI

struct CourserItem: View {
    var namespace: Namespace.ID
    @Binding var show: Bool

    var body: some View {
        VStack {
            Spacer()
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
            }
            .padding(20)
            .background {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                    }
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur", in: namespace)
            }
        }
        .foregroundColor(.white)
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
        .frame(height: 300)
        .padding(20)
    }
}

struct CourserItem_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        CourserItem(namespace: namespace, show: .constant(false))
    }
}
