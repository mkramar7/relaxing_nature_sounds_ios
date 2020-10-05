//
//  ContentView.swift
//  RelaxingNatureSounds
//
//  Created by Marko Kramar on 19/08/2020.
//  Copyright © 2020 Marko Kramar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack {
                        ForEach(AudioStore.allSounds) { sound in
                            Button(action: {
                                self.playOrStopPlaying(sound)
                            }) {
                                SoundImageView(sound: sound)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .padding(.bottom, 75)
                
                GoogleAdBanner()
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: Button(action: {
                    
            }) {
                Image(systemName: "clock")
                    .resizable()
                    .scaleEffect(1.4)
            }, trailing: Button(action: {
                
            }) {
               Image(systemName: "info.circle")
                    .resizable()
                    .scaleEffect(1.4)
            })
            .navigationBarTitle("Sounds of Nature")
        }
    }
    
    func playOrStopPlaying(_ sound: Sound) {
        if (sound.currentlyPlaying) {
            AudioPlayer.shared.stopPlayingSound(sound)
            return;
        }
        
        AudioPlayer.shared.playSound(sound)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
