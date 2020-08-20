//
//  Sound.swift
//  RelaxingNatureSounds
//
//  Created by Marko Kramar on 20/08/2020.
//  Copyright © 2020 Marko Kramar. All rights reserved.
//

import Foundation

struct Sound: Hashable {
    var id: String = UUID().uuidString
    var name: String
    var audio: URL
    var image: String
}
