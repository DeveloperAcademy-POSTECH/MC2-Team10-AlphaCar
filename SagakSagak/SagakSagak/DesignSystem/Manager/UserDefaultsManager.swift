//
//  UserDefaultsManager.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/13.
//

import Foundation

enum UserDefaultKey: String {
    case faceImage ///표정(faceView 화면에서 선택)
    case feel ///감정(emotionView 화면에서 선택)
}

class UserDefaultsManager{
    static let shared = UserDefaultsManager()
    
    var faceImage: String? {
        get{
            guard let faceImage = UserDefaults.standard.value(forKey: UserDefaultKey.faceImage.rawValue) as? String else { return "sad" }
            return faceImage
        }
        
        set(faceImage){
            UserDefaults.standard.set(faceImage, forKey: UserDefaultKey.faceImage.rawValue)
        }
    }
    
    var feel: String? {
        get{
            guard let feel = UserDefaults.standard.value(forKey: UserDefaultKey.feel.rawValue) as? String else { return "슬픔" }
            return feel
        }
        
        set(feel){
            UserDefaults.standard.set(feel, forKey: UserDefaultKey.feel.rawValue)
        }
    }
    
}
