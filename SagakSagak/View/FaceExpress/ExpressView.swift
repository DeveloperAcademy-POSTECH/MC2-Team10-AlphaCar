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
    private let soundManager = SoundManager.instance
    
    var body: some View {
        ZStack {
            Image("background")
                .padding(.top, 20)
            
            if let image = emotionFace.faceName {
                LottieView(jsonName: image)
                    .id(image)
                    .frame(width:370, height:370)
                    .padding(.top, 40)
            } else {
                LottieView(jsonName: "basic")
                    .frame(width:370, height:370)
                    .padding(.top, 40)
            }
            
            ZStack{
                VStack(){
                    navBarView
                        .padding(.trailing, 1)
                        .padding(.top, 6)
                    Spacer().frame(height:225)
                    FaceView()
                        .environmentObject(self.emotionFace)
                        
                }
            }
//            .padding()
        }
        .onChange(of: emotionFace.faceName) { _ in
            selectedFace = emotionFace.faceName ?? "basic"
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bg2)
        
    }
    
    
    var navBarView: some View {
        ZStack{
            ZStack{
                GLNavBarItem(backPage: .character2, backButtonImg: "button_back", backEnabled : true, shadowOn: true, navBarTitle: "소중한 것을 떠올리면 어떤 표정이 될까?", navBarBgColor: .system2, navBarFontColor: Color(hex: "5E9BF0"), nextButtonImg: "button_next", nextPage: .emotion,
                             nextEnabled: selectedFace == "basic" ? false : true) //변수
                .padding(.top, 4)
                Spacer().frame(width:70)
                
                Image("button_exit")
                    .padding(.leading, 750)
                    .onTapGesture {
                        coordinator.popToRoot()
                    }.padding(.top, 4)
//                    .padding(.leading, -1)
                    .shadow(color: Color(hex: "26775F").opacity(0.15),
                            radius: 30, x: 0, y: 4)
            }
        }
        .frame(width: Const.glScreenWidth, height: 72)
        .padding(.top, 23)
        .padding(.trailing, 24)
        .padding(.leading, 25)
        
    }
    
}

struct ExpressView_Previews: PreviewProvider {
    static var previews: some View {
        ExpressView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
