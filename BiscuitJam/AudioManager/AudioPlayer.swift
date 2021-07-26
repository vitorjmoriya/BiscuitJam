//
//  AudioPlayer.swift
//  BiscuitJam
//
//  Created by Paulo Bassani on 21/07/21.
//

import Foundation
import AVFoundation

class AudioManager {
    public static var shared = AudioManager()
    private var musicPlayer: AVAudioPlayer?
    
    private init() {
        
    }
    
    public func playMusic(name:String, musicExtension:String) {
        if let musicURL = Bundle.main.url(forResource: name, withExtension: musicExtension){
            do { musicPlayer = try AVAudioPlayer(contentsOf: musicURL)} catch{}
            musicPlayer?.play()
            musicPlayer?.numberOfLoops = -1
        }
    }
    
    public func playSoundEffect(name:String, soundExtension:String) {
        var player = AVAudioPlayer()
        if let soundURL = Bundle.main.url(forResource: name, withExtension: soundExtension){
            do { player = try AVAudioPlayer(contentsOf: soundURL)} catch{}
            player.play()
        }
    }
}
