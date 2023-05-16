//
//  StoryView1.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/12.
//

import SwiftUI

struct StoryView1: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    private let soundManager = SoundManager.instance

    var body: some View {
        ZStack {
            Image("background").padding(.top, 20)
            ZStack {
//                Image("storyBoard")
//                    .padding(.top, 20)
//                    .offset(x:0, y: 0)
//                RoundedRectangle(cornerRadius: 30)
//                    .fill(Color.system2)
//                    .frame(width: 580, height:320)
                Image("storyBoard")
                    .padding(.top, 20)
                    .offset(x:0, y: 0)
                
                
                
                if let image = UserDefaultsManager.shared.snapShot {
                    
                    ZStack{
//                        Rectangle()
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 300, height: 150)
                            .padding(.top, 110)
                            .foregroundColor(.yellow)
                        
                        Text("나에게 가장 소중한 것은")
                            .font(FontManager.shared.nanumsquare(.bold, 22))
                            .padding(.top, -70)
                        
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(hex: "F2F7FF"))
                            .frame(width: 360, height:170)
                            .foregroundColor(.white)
                            .padding(.top, 110)
                    }
                } else {
                    Text("Snapshot image is not available.")
                }
                
                ZStack{
                    GLNavBarItem(
                        backPage: .emotion, backButtonImg: "button_modal_back", backEnabled : true, shadowOn: true, navBarTitle: "오늘의 이야기", navBarBgColor: Color(hex: "F2F7FF"), navBarFontColor: Color(hex: "5E9BF0"), nextButtonImg: "button_modal_next", nextPage: .story2, nextEnabled: true)
                    .padding(.leading, 0).padding(.top, 30)
                    
                    Image("button_exit")
                        .padding(.leading, 750)
                        .padding(.top, -20)
                        .onTapGesture {
                            coordinator.popToRoot()
                            soundManager.playSound(sound: .exit)
                        }
                }.padding(.bottom, 260)
                    .onAppear(perform: {
                        SoundManager.instance.playTts(sound: .story1)
                    })
            }
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bg2)
        .ignoresSafeArea()
    }
}

struct StoryView1_Previews: PreviewProvider {
    static var previews: some View {
        StoryView1().previewInterfaceOrientation(.landscapeRight)
    }
}
