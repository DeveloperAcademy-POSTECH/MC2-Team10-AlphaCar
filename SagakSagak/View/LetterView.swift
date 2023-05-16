//
//  LetterView.swift
//  SagakSagak
//
//  Created by 채영민 on 2023/05/13.
//

import SwiftUI

struct LetterView: View {
    @State private var coverPosition: CGFloat = 50
    @State private var letterPosition: CGFloat = 50
    @State private var isAnimating: Bool = false
    @State private var letterOpacity: Double = 1
    @State private var letterOpacityReverse: Double = 0
    
    @EnvironmentObject private var coordinator: Coordinator
    
    func animateOpacityAndPosition(opacity: Double, position: CGFloat, duration: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(Animation.easeOut(duration: duration)) {
                self.letterOpacity = opacity
                self.coverPosition = position
            }
        }
    }
    
    func animateOpacity(opacity: Double, duration: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(Animation.easeOut(duration: duration)) {
                self.letterOpacityReverse = opacity
            }
        }
    }
    
    func animatePosition(position: CGFloat, duration: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(Animation.easeOut(duration: duration)) {
                self.letterPosition = position
            }
        }
    }

    var body: some View {
        ZStack {
            Image("background").padding(.top, 20)
            
            ZStack{
                Image("letterHead")
                    .offset(x:0, y:coverPosition + 8)
                    .opacity(letterOpacity)
                    .onAppear {
                        animateOpacityAndPosition(opacity: 0, position: 300, duration: 2)
                    }
                ZStack{
                    Image("letterBody")
                        .offset(x:0, y: letterPosition + 215)
                        .onAppear {
                            animatePosition(position: -200, duration: 0.75)
                        }
                    
                    Image("나에게 가장 소중한 것은 무엇일까_")
                        .offset(x:0, y: letterPosition + 230)
                    
                    ZStack{
                        GLNavBarItem(
                            backPage: .main, backButtonImg: "", shadowOn: true, navBarTitle: "오늘의 이야기", navBarBgColor: Color(hex: "F2F7FF"), navBarFontColor: Color(hex: "5E9BF0"), nextButtonImg: "button_modal_next", nextPage: .draw, nextEnabled: true)
                        .offset(x:0, y: letterPosition + 90)
                        .padding(.leading, 40)
                        .opacity(letterOpacityReverse)
                    }.onAppear {
                        animateOpacity(opacity: 1, duration: 0.5)
                    }
                    Image("greenButton")
                        .offset(x:350, y:-110.5)
                        .padding(.top, -53.5)
                        .padding(.leading, 50)
                        .opacity(letterOpacityReverse)
                        .onAppear {
                            animateOpacity(opacity: 1, duration: 1)
                        }
                        .onTapGesture {
                            coordinator.push(.main)
                        }
                }
                
                Image("letterFoot").offset(x:0, y:coverPosition + 115)
                    .opacity(letterOpacity)
                    .onAppear {
                        animateOpacityAndPosition(opacity: 0, position: 100, duration: 2)
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bg2)
        .ignoresSafeArea()
    }
}

struct LetterView_Previews: PreviewProvider {
    static var previews: some View {
        LetterView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
