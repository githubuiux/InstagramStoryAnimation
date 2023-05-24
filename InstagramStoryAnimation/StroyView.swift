//
//  StroyView.swift
//  InstagramStoryAnimation
//
//  Created by Levent on 24.05.2023.
//

import SwiftUI

struct StroyView: View {
    @Binding var showStory: Bool
    let storyNamespace: Namespace.ID
    let thumbNamesace: Namespace.ID
    let index: Int
    
    var body: some View {
        ZStack {
            if showStory {
                ZStack{
                    
                    // Background
                    Image("story\(index)")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                    
                    // foreground view
                }
                .matchedGeometryEffect(id: "story\(index)", in: storyNamespace)
                .transition(.scale(scale: 0.99))

            }
            
            VStack {
                HStack{
                    if showStory {
                        Image("thumb\(index)")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .matchedGeometryEffect(id: "thumb\(index)", in: thumbNamesace)
                            .transition(.scale(scale: 0.99))
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                        
                    Spacer()
                }
                Spacer()
            }
            .padding(.top, 24)
        }
    }
}
