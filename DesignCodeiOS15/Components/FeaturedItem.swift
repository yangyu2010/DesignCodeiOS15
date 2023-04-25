//
//  FeaturedItem.swift
//  DesignCodeiOS15
//
//  Created by Yu Yang on 4/19/23.
//

import SwiftUI

struct FeaturedItem: View {
    let course: Course
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Image(course.logo)
//                .resizable()
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26, height: 26)
                .cornerRadius(20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
            Text(course.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .lineLimit(1)
            Text(course.subtitle)
                .font(.footnote)
                .fontWeight(.semibold)
//                .foregroundColor(.secondary)
                .foregroundStyle(.secondary)
            Text(course.text)
                .font(.footnote)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
//                .offset(y: 50)
        }
        .padding(.all, 20.0)
        .padding(.vertical ,20.0)
        .frame(height: 350)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .overlay (
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(.linearGradient(colors: [.white.opacity(0.3), .black.opacity(0.1)], startPoint: .top, endPoint: .bottom))
                .blendMode(.overlay)
//                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .bevel, miterLimit: .infinity, dash: [20, 20], dashPhase: 20))
        )
        .padding(.horizontal ,20.0)
    }

}

struct FeaturedItem_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItem(course: courses[0])
    }
}
