//
//  ContentView.swift
//  RelaxingNatureSounds
//
//  Created by Marko Kramar on 19/08/2020.
//  Copyright © 2020 Marko Kramar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let audioStore: AudioStore
    
    @State private var currentlyPlaying: String = ""
    
    var body: some View {
        List {
            ForEach(audioStore.allSounds, id: \.self) { sound in
                Button(action: {
                    self.currentlyPlaying = sound.id
                    AudioPlayer.shared.playSound(sound.audio)
                }) {
                    ZStack(alignment: .leading) {
                        Image(sound.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .opacity(self.currentlyPlaying == sound.id ? 1 : 0.7)
                            .animation(.spring())
                        
                        Triangle()
                            .fill(Color.white)
                            .frame(width: 100, height: 50)
                            .rotationEffect(.degrees(90.0))
                            .opacity(self.currentlyPlaying == sound.id ? 0.7 : 0)
                            .padding(.leading, -40.0)
                            .animation(.spring())
                        
                        Text("\(sound.name)")
                            .font(Font.custom("Luminari", size: 35))
                            .foregroundColor(.white)
                            .opacity(0.7)
                            .padding(.leading, self.currentlyPlaying == sound.id ? 40 : 10)
                            .animation(.spring())
                    }
                    .padding(.bottom, 5)
                    .listRowInsets(EdgeInsets())
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(audioStore: AudioStore())
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}
