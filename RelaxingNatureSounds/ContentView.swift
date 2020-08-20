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
    
    var body: some View {
        List {
            Section(header: Text("Sounds of nature")) {
                ForEach(audioStore.allSounds, id: \.self) { sound in
                    Button("\(sound.name)") {
                        AudioPlayer.shared.playSound(sound.audio)
                    }
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(audioStore: AudioStore())
    }
}
