//
//  SoundsStore.swift
//  RelaxingNatureSounds
//
//  Created by Marko Kramar on 20/08/2020.
//  Copyright © 2020 Marko Kramar. All rights reserved.
//

import Foundation

struct AudioStore {
    static let allSounds = [
        Sound(name: "Birds", audio: Bundle.main.url(forResource: "Birds", withExtension: "wav")!, image: "Birds"),
        Sound(name: "Cave", audio: Bundle.main.url(forResource: "Cave", withExtension: "wav")!, image: "Cave"),
        Sound(name: "Cold winter day", audio: Bundle.main.url(forResource: "Cold winter day", withExtension: "wav")!, image: "Cold winter day"),
        Sound(name: "Desert", audio: Bundle.main.url(forResource: "Desert", withExtension: "wav")!, image: "Desert"),
        Sound(name: "Hot summer day", audio: Bundle.main.url(forResource: "Hot summer day", withExtension: "wav")!, image: "Hot summer day"),
        Sound(name: "Mountains", audio: Bundle.main.url(forResource: "Mountains", withExtension: "wav")!, image: "Mountains"),
        Sound(name: "Rain", audio: Bundle.main.url(forResource: "Rain", withExtension: "wav")!, image: "Rain"),
        Sound(name: "Rainforest", audio: Bundle.main.url(forResource: "Rainforest", withExtension: "wav")!, image: "Rainforest")
    ]
    
    static func findSound(id: UUID) -> Sound {
        allSounds.filter { $0.id == id }.first!
    }
    
    static func currentlyPlayingSound() -> Sound? {
        AudioStore.allSounds.filter({ $0.currentlyPlaying }).first
    }
    
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
}
