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
                Image("background")
                    .resizable()
                    .scaledToFill()
                
                Color.bg2
                    .ignoresSafeArea()
                    .opacity(0.5)
                
                VStack {
                    ZStack {
                        Image("button_exit")
                            .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 15))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .onTapGesture {
//                                isExitBtnClicked = true
                            }
                    }
                    
                    ZStack{
                        GeometryReader { geometry in
                            VStack{
                                if let image = emotionFace.faceName {
                                    LottieView(jsonName: image)
                                        .id(image)
                                        .frame(width: 400, height: 400)
                                        .onDisappear {
                                                    // 애니메이션 정리 코드 추가
                                                }
                                }else{
                                    LottieView(jsonName: "basic")
                                        .frame(width: 400, height: 400)
                                        .onDisappear {
                                                    // 애니메이션 정리 코드 추가
                                                }
                                }
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                        }
                        
                        HStack(spacing: 530){
                            Image("button_back")
                                .onTapGesture {
                                    isPrevBtnClicked = true
                                }
                            Image("button_next")
                                .onTapGesture {
                                    if selectedFace != "basic" {
                                        isNextBtnClicked = true
                                    }
                                }
                        }
                        .offset(y: -20)
                        
                    }
                }

                VStack {
                    Spacer()
                    FaceView()
                        .environmentObject(self.emotionFace)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            .onChange(of: emotionFace.faceName) { _ in
                selectedFace = emotionFace.faceName ?? "basic"
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            
        } else if isPrevBtnClicked {
            CharacterView2()
        } else {
            EmotionView().environmentObject(self.emotionFace)
        }
    }
}

struct ExpressView_Previews: PreviewProvider {
    static var previews: some View {
        ExpressView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
