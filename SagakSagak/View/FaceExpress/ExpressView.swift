//
//  ExpressView.swift
//  Faceapp
//
//  Created by 박리라 on 2023/05/10.
//

import SwiftUI

struct ExpressView: View {
    @State private var isNextBtnClicked = false
    @State private var isPrevBtnClicked = false
    @State private var isExitBtnClicked = false
    @State private var selectedFace = "basic" // 초기 표정 설정
    @StateObject private var emotionFace = EmotionFace()
    @EnvironmentObject private var coordinator: Coordinator
    
    
    var body: some View {
        if !isNextBtnClicked && !isPrevBtnClicked && !isExitBtnClicked{
            ZStack {
                Image("background").resizable().scaledToFill()
                Color.bg2.ignoresSafeArea().opacity(0.5)
                VStack {
                    ZStack {
                        Image("text").frame(alignment: .center)
                        Image("button_exit").offset(x:380)
                            .onTapGesture {
                                
//                                isExitBtnClicked = true
                            }
                    }
                    
                    HStack{
                        Image("button_back")
                            .onTapGesture {
                                isPrevBtnClicked = true
                            }
                        if let image = emotionFace.faceName {
                            LottieView(jsonName: image)
                                .id(image)
                      
                        }else{
                            LottieView(jsonName: "basic")
                        }
                        Image("button_next")
                            .onTapGesture {
                                if selectedFace != "basic" {
                                    isNextBtnClicked = true
                                    coordinator.push(.emotion)
                                }
                            }
                    }
                }
                .padding()
                FaceView()
                    .environmentObject(self.emotionFace)
                    .offset(y:150)
            }
            .onChange(of: emotionFace.faceName) { _ in
                selectedFace = emotionFace.faceName ?? "basic"
            }
            .navigationBarBackButtonHidden(true)
        } else if isPrevBtnClicked {
            CharacterView2()
        } else {
            EmotionView(onClicked: false, textBlock: "감정").environmentObject(self.emotionFace)
        }
    }
}

struct ExpressView_Previews: PreviewProvider {
    static var previews: some View {
        ExpressView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
