//
//  UserDefaultsManager.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/13.
//

import Foundation
import UIKit

enum UserDefaultKey: String {
    case faceImage
    case feel
    case snapShot
    case profile
}

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
   
    var snapShot: UIImage? {
        get {
            guard let snapShotData = UserDefaults.standard.value(forKey: UserDefaultKey.snapShot.rawValue) as? Data else { return nil }
            return UIImage(data: snapShotData)
        }
        
        set(snapShot) {
            guard let snapShot = snapShot else {
                UserDefaults.standard.removeObject(forKey: UserDefaultKey.snapShot.rawValue)
                return
            }
            let snapShotData = snapShot.jpegData(compressionQuality: 1.0)
            UserDefaults.standard.set(snapShotData, forKey: UserDefaultKey.snapShot.rawValue)
        }
    }
    
    var profile: UIImage? {
        get {
            guard let profileData = UserDefaults.standard.value(forKey: UserDefaultKey.profile.rawValue) as? Data else { return nil }
            return UIImage(data: profileData)
        }
        
        set(profile) {
            guard let profile = profile else {
                UserDefaults.standard.removeObject(forKey: UserDefaultKey.profile.rawValue)
                return
            }
            let profileData = profile.jpegData(compressionQuality: 1.0)
            UserDefaults.standard.set(profileData, forKey: UserDefaultKey.profile.rawValue)
        }
    }
    
    private init() {}

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
