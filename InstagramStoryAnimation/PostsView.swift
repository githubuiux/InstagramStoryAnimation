//
//  PostsView.swift
//  InstagramStoryAnimation
//
//  Created by Levent on 24.05.2023.
//

import SwiftUI

struct PostsView: View {
    var body: some View {
        ForEach(1..<20) {_ in
            RoundedRectangle(cornerRadius: 16)
            
                .fill(LinearGradient(gradient: Gradient(colors: [.purple, .red, .pink]),
                                     startPoint: .topLeading,
                                     endPoint: .bottomTrailing)
                )
                .frame(height: 300)
                .padding(.horizontal, 16)
            
        }
    }
}


struct Previews_PostsView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
