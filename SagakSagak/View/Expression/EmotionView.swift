//
//  EmotionView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/14.

//  TODO: Refactoring 필요함

import SwiftUI


struct EmotionView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var emotionText = EmotionText()
    @State private var selectedFace = "basic" // 초기 표정 설정
    @State private var selectedFeeling = "feeling"
    
    @State var onClicked: Bool ///넵바 버튼 조정을 위한 변수
    @State var textBlock: String
    ///테스트 비교 필요함 - 텍스트와 같으면 버튼 색깔 바꾸도록 하기
    
    private let soundManager = SoundManager.instance
    
    var body: some View {
        ZStack {
            Color.bg3.ignoresSafeArea()
            VStack(spacing:0){
                
                navBarView
                    .padding(.bottom, 68)
                contents
                    .padding(.bottom, 94)
                tabBarView
                    .padding(.bottom, 7.5)
            }
        }
        .onChange(of: emotionText.textName) { _ in
            selectedFeeling = emotionText.textName ?? "feeling"
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // MARK: navBar
    var navBarView: some View {
        ZStack{
            GLNavBarItem(backPage: .face, backButtonImg: "button_back", backEnabled : true, shadowOn: true, navBarTitle: "이 표정은 어떤 이름일까?", navBarBgColor: .system2, navBarFontColor: Color(hex: "5E9BF0"), nextButtonImg: "button_next", nextPage: .story1,
                         nextEnabled: selectedFeeling != "feeling" ? true : false) 
            Image("button_exit")
                .padding(.leading, 750)
                .padding(.top, 1)
                .onTapGesture {
                    coordinator.popToRoot()
                    soundManager.playSound(sound: .exit)
                }
                .shadow(color: Color(hex: "26775F").opacity(0.15),
                        radius: 30, x: 0, y: 4)

        }
        .frame(width: Const.glScreenWidth, height: 72)
        .padding(.top, 37)
        .onAppear(perform: {
            SoundManager.instance.playTts(sound: .facename)
        })
    }
    
    //MARK: Contents
    var contents: some View {
        VStack{
            HStack(spacing:16){
                Image(UserDefaultsManager.shared.faceImage!)
                    .frame(width: 100, height: 60)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.white).opacity(0.1), lineWidth: 5)
                            .shadow(color: Color(hex: "579DFF"), radius: 5, x: 0, y: -4)
                            .padding(-6)
                    )
                    .background(.white)
                    .cornerRadius(10)
                    .foregroundColor(.black)
                
                Text("표정의 이름은").font(FontManager.shared.nanumsquare(.bold, 28))

                let textType = emotionText.textName ?? "표정"
                
                Text(textType)
                    .font(FontManager.shared.nanumsquare(.extrabold, 24))
                    .foregroundColor(.white)
                    .frame(width: 100, height: 60)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.white).opacity(0.1), lineWidth: 5)
                        
                            .shadow(color: selectedFeeling != "feeling" ? Color(hex: "006AFF") : Color(hex: "579DFF"),
                                    radius: 5, x: 0, y: selectedFeeling != "feeling" ? -4 : 4)

                            .padding(-6)
                    )
                    .background(selectedFeeling != "feeling" ? Color(hex: "#89BAFF") : .white)
                    .cornerRadius(10)
                    .foregroundColor(.black)

                Text("이야.").font(FontManager.shared.nanumsquare(.bold, 28))
            }
        }
    }
    
    //MARK: TabBar
    var tabBarView: some View {
        Rectangle()
        .frame(width: Const.glScreenWidth, height:88)
        //.foregroundColor(.system2)
        .overlay{
            ExpressionTextBlock()
                .environmentObject(self.emotionText)
        }
        .onChange(of: emotionText.textName) { _ in
            selectedFeeling = emotionText.textName ?? "basic"
        }
    }
}


struct EmotionView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionView(onClicked: false, textBlock: "감정")
            .previewInterfaceOrientation(.landscapeRight)

    }
}
