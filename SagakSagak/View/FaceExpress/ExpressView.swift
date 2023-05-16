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
                Color.bg2.ignoresSafeArea()
                Image("background").resizable().ignoresSafeArea()
                    LottieView(jsonName: "basic")
                        .frame(width:370, height:370)
                        .padding(.top, 40)
        
                    ZStack{
                        VStack(){
                            navBarView
                           
                            Spacer().frame(height:220)
                            FaceView()
                            
                        }
                    }
        
                .padding()

            }
            .onChange(of: emotionFace.faceName) { _ in
                selectedFace = emotionFace.faceName ?? "basic"
            }
            .navigationBarBackButtonHidden(true)
        } else if isPrevBtnClicked {
            CharacterView2()
        } else {
            EmotionView(onClicked: false, textBlock: "감정").environmentObject(self.emotionFace)
                .navigationBarBackButtonHidden(true)
        }
        
        

    }
    
    
    var navBarView: some View {
        HStack{
            GLNavBarItem(backPage: .face, backButtonImg: "button_back", shadowOn: true, navBarTitle: "소중한 것을 떠올리면 어떤 표정이 될까", navBarBgColor: .system2, navBarFontColor: .system1, nextButtonImg: "button_next", nextPage: .story1, nextEnabled: false) //변수
            
            Spacer().frame(width:70)
            
            Button {
                coordinator.popToRoot()
            } label: {
                Image("button_exit")
                    .shadow(color: Color(hex: "26775F").opacity(0.15),
                            radius: 30,
                            x: 0,
                            y: 4)
                
            }
        }
        .frame(width: Const.glScreenWidth, height: 72)
        .padding(.top, 24)
        .padding(.trailing, 24)
        .padding(.leading, 142)
    }
    
}

struct ExpressView_Previews: PreviewProvider {
    static var previews: some View {
        ExpressView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
