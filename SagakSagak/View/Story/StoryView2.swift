//
//  StoryView2.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/12.
//

import SwiftUI

struct StoryView2: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var emotionFace: EmotionFace
    @State private var isNextBtnClicked = false
    @State private var isPrevBtnClicked = false
    
    private let soundManager = SoundManager.instance
    
    var body: some View {
        ZStack {
            Image("background").padding(.top, 20)
            ZStack {
                Image("storyBoard")
                    .padding(.top, 20)
                    .offset(x:0, y: 0)
                
                    VStack {
//                        Spacer().frame(width:120)
                        HStack {
                            Text("소중한 것을 떠올리면")
                                .font(FontManager.shared.nanumsquare(.bold, 24))
                            //                            .frame(width:160)
                            
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
                            
                            
                            Text("한 표정이 돼.")
                                .font(FontManager.shared.nanumsquare(.bold, 24))
                        }
                        HStack{
                            Text("이 표정의 이름은")
                                .font(FontManager.shared.nanumsquare(.bold, 24))
                            
                            Text(UserDefaultsManager.shared.feel!)
                                .font(FontManager.shared.nanumsquare(.extrabold, 24))
                                .foregroundColor(Color.system2)
                                .frame(width: 100, height: 60)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(.white).opacity(0.1), lineWidth: 6)
                                        .shadow(color: Color(hex: "579DFF"),
                                                radius: 5, x: 0, y: -4)
                                        .padding(-6)

                                )
                                .background(Color(hex: "89BAFF"))
                                .cornerRadius(10)
                                .foregroundColor(.black)
  
                            Text("이야")
                                .font(FontManager.shared.nanumsquare(.bold, 24))
                        }
                    }.padding(.top, 50)
                
                ZStack{
                    GLNavBarItem(
                        backPage: .story1, backButtonImg: "button_modal_back", backEnabled : true, shadowOn: true, navBarTitle: "오늘의 이야기", navBarBgColor: Color(hex: "F2F7FF"), navBarFontColor: Color(hex: "5E9BF0"), nextButtonImg: "button_modal_next", nextPage: .end1, nextEnabled: true)
                    .padding(.leading, 0).padding(.top, 30)
                    
                    Image("button_exit")
                        .padding(.leading, 750)
                        .padding(.top, -20)
                        .onTapGesture {
                            coordinator.popToRoot()
                            soundManager.playSound(sound: .exit)
                        }
                }.padding(.bottom, 260)
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bg2)
        .ignoresSafeArea()
    }
}
struct StoryView2_Previews: PreviewProvider {
    static var previews: some View {
        StoryView2().previewInterfaceOrientation(.landscapeRight)
    }
}


