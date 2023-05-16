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
    var ttsPlayer: AVAudioPlayer?
    var currentBackgroundMusic: SoundOption?
    
    enum SoundOption: String {
        case clock = "clock_sound"
        case button = "button_sound"
        case paper = "paper_sound"
        case curtain = "curtain_sound"
        case pop = "pop_sound"
        case main = "main_music"
        case archive = "archive_music"
        case letter = "letter_music"
        case splash = "splash_music"
        case approve = "approve_sound"
        case click = "click_sound"
        case select = "select_sound"
        case exit = "exit_sound"
        case intro = "intro_tts"
        case draw = "draw_tts"
        case character1 = "character1_tts"
        case character2 = "character2_tts"
        case facename = "facename_tts"
        case story1 = "story1_tts"
        case story2 = "story2_tts"
        case ending1 = "ending1_tts"
        case ending2 = "ending2_tts"
        case frame = "frame_tts"
        case weather = "weather_tts"
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
    
    func playTts(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        do {
            ttsPlayer?.stop()
            ttsPlayer = try AVAudioPlayer(contentsOf: url)
            ttsPlayer?.numberOfLoops = 0 // 한 번만 재생
            ttsPlayer?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func stopTts() {
        ttsPlayer?.stop()
    }
}
