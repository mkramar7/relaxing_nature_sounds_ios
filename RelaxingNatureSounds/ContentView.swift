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
                    ZStack {
                        Image("Cave")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .opacity(self.currentlyPlaying == sound.id ? 1 : 0.5)
                        
                        Text("\(sound.name)")
                            .font(.largeTitle)
                            .foregroundColor(.white)
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
