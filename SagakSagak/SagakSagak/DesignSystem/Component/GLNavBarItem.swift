//
//  GLBavBarItem.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/13.
//

import SwiftUI

struct GLNavBarItem: View {
    @EnvironmentObject private var coordinator: Coordinator
    ///이전 페이지로(이미지, 페이지명)
    let backPage: Page
    let backButtonImg: String
    
    ///섀도우 여부
    let shadowOn: Bool
    
    ///네비게이션바 (타이틀, 백그라운드 컬러, 폰트 컬러)
    let navBarTitle: String
    let navBarBgColor: Color
    let navBarFontColor: Color
    
    ///다음 페이지로(이미지, 페이지명)
    let nextButtonImg: String
    let nextPage: Page
    let nextEnabled: Bool
    private let soundManager = SoundManager.instance
    
    var body: some View {
        HStack(spacing:10){
            Button {
                coordinator.push(backPage)
                soundManager.playSound(sound: .select)
            } label: {
                Image(backButtonImg)
                    .shadow(color: shadowOn ?
                            Color(hex: "26775F").opacity(0.15) : .system2,
                            radius: shadowOn ? 30 : 0,
                            x: shadowOn ? 0 : 0,
                            y: shadowOn ? 4 : 0)
            }
            
            GLNavBarTitle(navBarTitle: navBarTitle, navBarBgColor: navBarBgColor, navBarFontColor: navBarFontColor)
            
            Button {
                coordinator.push(nextPage)
                soundManager.playSound(sound: .approve)
            } label: {
                if(nextEnabled){
                    Image(nextButtonImg)
                        .shadow(color: shadowOn ?
                                Color(hex: "26775F").opacity(0.15) : .system2,
                                radius: shadowOn ? 30 : 0,
                                x: shadowOn ? 0 : 0,
                                y: shadowOn ? 0 : 0)
                }else{
                    Image("button_next_enabled")
                        .shadow(color: shadowOn ?
                                Color(hex: "26775F").opacity(0.15) : .system2,
                                radius: shadowOn ? 30 : 0,
                                x: shadowOn ? 0 : 0,
                                y: shadowOn ? 0 : 0)
                }
            }
            .disabled(nextEnabled ? false : true)
        }
    }
    
}

struct GLBavBarItem_Previews: PreviewProvider {
    static var previews: some View {
        //쉐도우 버전
//        GLNavBarItem(backPage: .character1, backButtonImg: "button_back", shadowOn: true, navBarTitle: "이 표정은 어떤 이름일까?", navBarBgColor: .system2, navBarFontColor: .system1, nextButtonImg: "button_next", nextPage: .character2, nextEnabled: true)
//            .previewInterfaceOrientation(.landscapeRight)
        
        //쉐도우 없는 버전
        GLNavBarItem(backPage: .character1, backButtonImg: "button_modal_back", shadowOn: false, navBarTitle: "오늘의 이야기", navBarBgColor: .bg1, navBarFontColor: .system1, nextButtonImg: "button_modal_next", nextPage: .character2, nextEnabled: true)
            .previewInterfaceOrientation(.landscapeRight)
    }
    
}
