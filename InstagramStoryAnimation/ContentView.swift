//
//  ContentView.swift
//  InstagramStoryAnimation
//
//  Created by Levent on 24.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showStory = false
    @State private var offsetY: CGFloat = 0
    @State private var scale: CGFloat = 1
    @State private var showBarrier = false
    @State private var opacity: Double = 1
    @State private var selectedIndex = 0
    
    @Namespace private var storyNamespace
    @Namespace private var thumbNamespace
    
    private let storyOpeningDuration = 0.2
    
    private let deviceHeight = UIScreen.self.main.bounds.height
    
    var body: some View {
        ZStack {
            NavigationView{
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        StoriesThumbView(
                            showStory: $showStory,
                            showBarrier: $showBarrier,
                            selectedIndex: $selectedIndex,
                            storyNamespace: storyNamespace,
                            thumbNamesace: thumbNamespace,
                            duration: storyOpeningDuration
                        )
                        PostsView()
                    }
                }
                .navigationTitle("Instagram")
                .navigationBarTitleDisplayMode(.inline)
            }
            
            if showBarrier {
                Rectangle()
                    .foregroundColor(.black.opacity(opacity))
                    .ignoresSafeArea()
            }
            
            ForEach(1..<11) { index in
                if selectedIndex == index {
                    StroyView(
                        showStory: $showStory,
                        storyNamespace: storyNamespace,
                        thumbNamesace: thumbNamespace,
                        index: index
                    )
                    .offset(y: offsetY)
                    .scaleEffect(scale)
                    .gesture(
                        DragGesture()
                            .onChanged(onDrag)
                            .onEnded(onDragEnd)
                    )
                }
            }
        }
    }
    private func onDrag(_ value: DragGesture.Value) {
        let dy = value.translation.height
        if dy >= 0.0 {
            offsetY = dy / 2
            scale = 1 - ((dy / deviceHeight) / 10)
            opacity = dy / deviceHeight
        }
    }
    private func onDragEnd(_ value: DragGesture.Value) {
        let dy = value.translation.height
        
        if dy >= 0.0 {
            if dy <= deviceHeight / 2 {
                withAnimation{
                    offsetY = 0.0
                    scale = 1.0
                    opacity = 1.0
                }
            } else {
                showBarrier.toggle()
                withAnimation(.easeIn(duration: 0.4)){
                    showStory.toggle()
                }
                offsetY = 0.0
                scale = 1.0
                opacity = 1.0
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
