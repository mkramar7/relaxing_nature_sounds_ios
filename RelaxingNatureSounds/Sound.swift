//
//  Sound.swift
//  RelaxingNatureSounds
//
//  Created by Marko Kramar on 20/08/2020.
//  Copyright © 2020 Marko Kramar. All rights reserved.
//

import Foundation

class Sound: Hashable, Identifiable, ObservableObject {
    var id = UUID()
    var name: String
    var audio: URL
    var image: String
    @Published var currentlyPlaying = false {
        willSet {
            // If sound is set to be currently playing, all other sounds should be marked as not currently playing
            if newValue {
                AudioStore.allSounds.forEach { $0.currentlyPlaying = false }
            }
        }
    }
    
    init(name: String, audio: URL, image: String) {
        self.name = name
        self.audio = audio
        self.image = image
    }
    
    static func == (lhs: Sound, rhs: Sound) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
