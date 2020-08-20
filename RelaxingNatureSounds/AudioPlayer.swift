//
//  AudioPlayer.swift
//  RelaxingNatureSounds
//
//  Created by Marko Kramar on 19/08/2020.
//  Copyright © 2020 Marko Kramar. All rights reserved.
//

import Foundation
import AVFoundation

class AudioPlayer {
    static let shared = AudioPlayer()
    var audioPlayer: AVAudioPlayer!
    
    func playSound(_ soundUrl: URL) {
        audioPlayer = try! AVAudioPlayer(contentsOf: soundUrl)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    func stopPlayingSound() {
        guard let audioPlayer = audioPlayer else { return }
        audioPlayer.stop()
    }
}
