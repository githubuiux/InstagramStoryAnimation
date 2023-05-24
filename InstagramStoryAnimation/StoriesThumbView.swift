//
//  StoriesThumbView.swift
//  InstagramStoryAnimation
//
//  Created by Levent on 24.05.2023.
//

import SwiftUI

struct StoriesThumbView: View {
    @Binding var showStory: Bool
    @Binding var showBarrier: Bool
    @Binding var selectedIndex: Int
    
    let storyNamespace: Namespace.ID
    let thumbNamesace: Namespace.ID
    let duration: Double
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(1..<11) { index in
                    
                    ZStack{
                        Circle()
                            .stroke(lineWidth: 2.0)
                            .frame(width: 108, height: 108)
                            .foregroundColor(.pink)
                        
                        if selectedIndex == index && !showStory {
                            ZStack{
                                
                                // Background
                                Image("story\(index)")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 4))
                                
                                // foreground view
                            }
                        .matchedGeometryEffect(id: "story\(index)", in: storyNamespace)
                        .transition(.scale(scale: 1))
                        .frame(width: 40, height: 80)
                        }

                        
                        if !showStory || selectedIndex != index {
                            Image("thumb\(index)")
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .matchedGeometryEffect(id: "thumb\(index)", in: thumbNamesace)
                                .transition(.scale(scale: 1))
                                .frame(width: 100, height: 100)
                                .onTapGesture {
                                    selectedIndex = index
                                    withAnimation(.easeOut(duration: duration)) {
                                        showStory.toggle()
                                    }
                                    withAnimation(.linear.delay(duration)) {
                                    showBarrier.toggle()
                                    }
                                }
                        }
                    }
                }
            }
            .padding(16)
        }
    }
}
