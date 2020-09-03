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
                List {
                    ForEach(AudioStore.allSounds) { sound in
                        Button(action: {
                            self.playOrStopPlaying(sound)
                        }) {
                            SoundImage(sound: sound)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                
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
            .onAppear {
                UITableView.appearance().separatorStyle = .none
            }
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

struct SoundImage: View {
    @ObservedObject var sound: Sound
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image(sound.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(sound.currentlyPlaying ? 1 : 0.8)
                .cornerRadius(8)
                .animation(.spring())
            
            Triangle()
                .fill(Color.white)
                .frame(width: 70, height: 35)
                .rotationEffect(.degrees(90.0))
                .opacity(sound.currentlyPlaying ? 0.8 : 0)
                .padding(.leading, -17)
                .offset(x: 0, y: 5)
                .animation(.spring())
            
            Text("\(sound.name)")
                .font(Font.custom("Noteworthy", size: 50))
                .foregroundColor(.white)
                .opacity(sound.currentlyPlaying ? 1 : 0.8)
                .padding(.leading, sound.currentlyPlaying ? 40 : 10)
                .animation(.spring())
        }
        .padding(3)
        .listRowInsets(EdgeInsets())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
