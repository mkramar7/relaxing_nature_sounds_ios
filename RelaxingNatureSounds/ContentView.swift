//
//  ContentView.swift
//  RelaxingNatureSounds
//
//  Created by Marko Kramar on 19/08/2020.
//  Copyright © 2020 Marko Kramar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var countdownMinutes = 0
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    if countdownMinutes != 0 {
                        Text("\(self.countdownMinutes)")
                    }
                    
                    ForEach(AudioStore.allSounds) { sound in
                        Button(action: {
                            self.playOrStopPlaying(sound)
                        }) {
                            SoundImageView(sound: sound)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.bottom, 92)
                
                GoogleAdBannerView()
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: NavigationLink(destination: AlarmView(minutesUntilStop: $countdownMinutes),
                                                        label: { Image(systemName: "clock").resizable().scaleEffect(1.4) }
            ), trailing: Button(action: {
                
            }) {
               Image(systemName: "info.circle")
                    .resizable()
                    .scaleEffect(1.4)
            })
            .navigationBarTitle("Sounds of Nature")
        }
        .environment(\.colorScheme, .dark)
    }
    
    func playOrStopPlaying(_ sound: AudioStore.Sound) {
        if (sound.currentlyPlaying) {
            AudioPlayer.shared.stopPlayingSound(sound)
            return;
        }
        
        AudioPlayer.shared.playSound(sound)
    }
}
