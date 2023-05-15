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
                    //TODO: Clicked 필요함
                    Image("twinkle")
                        .frame(width:80, height:36)
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(
                                    .shadow(.inner(color: Color(hex: "579DFF").opacity(0.3), radius: 10, x:0, y:-4))
                                )
                                .foregroundColor(Color.init(hex: "FFFFFF")))
                }
                
                Button(action: {
                    emotionFace.faceName = "pleased"
                    UserDefaultsManager.shared.faceImage = emotionFace.faceName
                    
                }) {
                    Image("pleased")
                        .frame(width:80, height:36)
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(
                                    .shadow(.inner(color: Color(hex: "579DFF").opacity(0.3), radius: 10, x:0, y:-4))
                                )
                                .foregroundColor(Color.init(hex: "FFFFFF")))
                }
                Button(action: {
                    emotionFace.faceName = "heart"
                    UserDefaultsManager.shared.faceImage = emotionFace.faceName
                }) {
                    Image("heart")
                        .frame(width:80, height:36)
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(
                                    .shadow(.inner(color: Color(hex: "579DFF").opacity(0.3), radius: 10, x:0, y:-4))
                                )
                                .foregroundColor(Color.init(hex: "FFFFFF")))
                }
                Button(action: {
                    emotionFace.faceName = "soso"
                    UserDefaultsManager.shared.faceImage = emotionFace.faceName
                }) {
                    Image("soso")
                        .frame(width:80, height:36)
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(
                                    .shadow(.inner(color: Color(hex: "579DFF").opacity(0.3), radius: 10, x:0, y:-4))
                                )
                                .foregroundColor(Color.init(hex: "FFFFFF")))
                }
                Button(action: {
                    emotionFace.faceName = "sad"
                    UserDefaultsManager.shared.faceImage = emotionFace.faceName
                }) {
                    Image("sad")
                        .frame(width:80, height:36)
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(
                                    .shadow(.inner(color: Color(hex: "579DFF").opacity(0.3), radius: 10, x:0, y:-4))
                                )
                                .foregroundColor(Color.init(hex: "FFFFFF")))
                }
                Button(action: {
                    emotionFace.faceName = "angry"
                    UserDefaultsManager.shared.faceImage = emotionFace.faceName
                }) {
                    Image("angry")
                        .frame(width:80, height:36)
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(
                                    .shadow(.inner(color: Color(hex: "579DFF").opacity(0.3), radius: 10, x:0, y:-4))
                                )
                                .foregroundColor(Color.init(hex: "FFFFFF")))
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
