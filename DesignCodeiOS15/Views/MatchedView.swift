//
//  MatchedView.swift
//  DesignCodeiOS15
//
//  Created by Yu Yang on 5/4/23.
//

import SwiftUI

struct MatchedView: View {
    @Namespace private var namespace
    @State private var show = false
    
    var body: some View {
        ZStack {
            if !show {
                
            } else {
                
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
            }
        }
    }

}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
