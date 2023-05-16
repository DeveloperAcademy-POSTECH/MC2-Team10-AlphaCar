//
//  CharacterView2.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/12.
//

import SwiftUI

struct CharacterView2: View {
    @State private var isNextBtnClicked = false
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        ZStack {
            Image("background").padding(.top, 20)
            
            ZStack {
                GLNavBarItem(
                    backPage: .character1, backButtonImg: "button_back", shadowOn: true, navBarTitle: "소중한 것을 떠올리면 어떤 표정이 될까?" , navBarBgColor: Color(hex: "FFFFFF"), navBarFontColor: Color(hex: "5E9BF0"), nextButtonImg: "button_next", nextPage: .face, nextEnabled: true)
                Image("button_exit")
                    .padding(.leading, 750)
                    .onTapGesture {
                        coordinator.push(.main)
                    }
            }.padding(.bottom, 280)
            
            GeometryReader { geometry in
                ZStack {
                    Ellipse()
                        .foregroundColor(Color(hex: "C8E9DF"))
                        .frame(width: 1000, height: 400)
                        .offset(y: 100)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            VStack{
                LottieView(jsonName: "love", loopMode: .loop)
                    .frame(height: 340)
                    .offset(y:35)
            }
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bg2)
        .ignoresSafeArea()
        }

}

struct CharacterView2_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView2()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
