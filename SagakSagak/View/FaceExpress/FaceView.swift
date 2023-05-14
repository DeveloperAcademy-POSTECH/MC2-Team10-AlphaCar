//
//  FaceView.swift
//  Faceapp
//
//  Created by 박리라 on 2023/05/10.
//

import SwiftUI

class EmotionFace: ObservableObject {
    @Published var faceName: String?
}

struct FaceView: View {
    @EnvironmentObject private var emotionFace: EmotionFace
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 844, height: 88)
                .foregroundColor(.white)
            HStack{
                Button(action: {
                    emotionFace.faceName = "twinkle"
                    UserDefaultsManager.shared.faceImage = emotionFace.faceName
                }) {
                    Image("twinkle")
                }
                Button(action: {
                    emotionFace.faceName = "pleased"
                    UserDefaultsManager.shared.faceImage = emotionFace.faceName
                }) {
                    Image("pleased")
                }
                Button(action: {
                    emotionFace.faceName = "heart"
                    UserDefaultsManager.shared.faceImage = emotionFace.faceName
                }) {
                    Image("heart")
                }
                Button(action: {
                    emotionFace.faceName = "soso"
                    UserDefaultsManager.shared.faceImage = emotionFace.faceName
                }) {
                    Image("soso")
                }
                Button(action: {
                    emotionFace.faceName = "sad"
                    UserDefaultsManager.shared.faceImage = emotionFace.faceName
                }) {
                    Image("sad")
                }
                Button(action: {
                    emotionFace.faceName = "angry"
                    UserDefaultsManager.shared.faceImage = emotionFace.faceName
                }) {
                    Image("angry")
                }
            }
        }
    }
}


struct FaceView_Previews: PreviewProvider {
    static var previews: some View {
        FaceView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
