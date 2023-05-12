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
    
    enum SoundOption: String {
        case clock = "clock_sound"
        case button = "button_sound"
        case paper = "paper_sound"
        case curtain = "curtain_sound"
        case pop = "pop_sound"
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
    
    
}
