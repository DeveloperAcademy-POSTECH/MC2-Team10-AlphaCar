//
//  SoundManager.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/12.
//

import Foundation
import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    var backgroundMusicPlayer: AVAudioPlayer?
    var currentBackgroundMusic: SoundOption?
    
    enum SoundOption: String {
        case clock = "clock_sound"
        case button = "button_sound"
        case paper = "paper_sound"
        case curtain = "curtain_sound"
        case pop = "pop_sound"
        case main = "main_music"
        case archive = "archive_music"
        case splash = "splash_music"
        case approve = "approve_sound"
        case click = "click_sound"
        case select = "select_sound"
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func playBackgroundMusic(sound: SoundOption) {
        guard sound != currentBackgroundMusic else { return } // 같은 음악일 경우 계속 재생
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        do {
            backgroundMusicPlayer?.stop()
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url)
            backgroundMusicPlayer?.numberOfLoops = -1  // Infinite loop
            backgroundMusicPlayer?.play()
            currentBackgroundMusic = sound
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func stopBackgroundMusic() {
        backgroundMusicPlayer?.stop()
    }
    
}
