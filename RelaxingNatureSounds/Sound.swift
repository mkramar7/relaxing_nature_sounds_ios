//
//  Sound.swift
//  RelaxingNatureSounds
//
//  Created by Marko Kramar on 20/08/2020.
//  Copyright © 2020 Marko Kramar. All rights reserved.
//

import Foundation

class Sound: Hashable {
    var id: String = UUID().uuidString
    var name: String
    var audio: URL
    var image: String
    
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
