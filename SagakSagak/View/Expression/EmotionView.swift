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
    
    var body: some View {
        ZStack {
            Color.bg3.ignoresSafeArea()
            VStack(spacing:0){
                navBarView
                    .padding(.bottom, 76)
                contents
                    .padding(.bottom, 94)
                tabBarView
            }
        }
        .onChange(of: emotionText.textName) { _ in
            selectedFeeling = emotionText.textName ?? "feeling"
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // MARK: navBar
    var navBarView: some View {
        HStack{
            GLNavBarItem(backPage: .face, backButtonImg: "button_back", shadowOn: true, navBarTitle: "이 표정은 어떤 이름일까?", navBarBgColor: .system2, navBarFontColor: .system1, nextButtonImg: "button_next", nextPage: .story1, nextEnabled: selectedFeeling != "feeling" ? true : false)
            
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
    }
}
