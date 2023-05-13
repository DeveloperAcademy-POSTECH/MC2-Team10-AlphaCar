//
//  UserDefaultsManager.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/13.
//

import Foundation

enum UserDefaultKey: String {
    case faceImage
    case feel
}

class UserDefaultsManager{
    static let shared = UserDefaultsManager()
    
    var faceImage: String? {
        get{
            guard let faceImage = UserDefaults.standard.value(forKey: UserDefaultKey.faceImage.rawValue) as? String else { return nil }
            return faceImage
        }
        
        set(faceImage){
            UserDefaults.standard.set(faceImage, forKey: UserDefaultKey.faceImage.rawValue)
        }
    }
    
    var feel: String? {
        get{
            guard let feel = UserDefaults.standard.value(forKey: UserDefaultKey.feel.rawValue) as? String else { return nil }
            return feel
        }
        
        set(feel){
            UserDefaults.standard.set(feel, forKey: UserDefaultKey.feel.rawValue)
        }
    }
    
}