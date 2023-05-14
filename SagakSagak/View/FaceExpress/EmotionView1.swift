//
//  EmotionView.swift
//  SagakSagak
//
//  Created by 박리라 on 2023/05/11.
//

import SwiftUI

struct EmotionView1: View {
   // @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isNextBtnClicked = false
    @State private var isPrevBtnClicked = false
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var emotionFace: EmotionFace
    
    var body: some View {
        if !isNextBtnClicked && !isPrevBtnClicked{
            ZStack {
                Color.bg2.ignoresSafeArea() // 배경화면 변경 필요
                
                HStack{
                    Image("button_next")
                        .onTapGesture {
                            isPrevBtnClicked = true
                        }
                    Spacer()
                    HStack {
                        Image(emotionFace.faceName ?? "basic")
                            .padding(20)
                            .foregroundColor(Color(red: 52/255, green: 57/255, blue: 133/255))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(.white).opacity(0.5),
                                            lineWidth: 2)
                                    .shadow(color: Color(hex: "579DFF"),
                                            radius: 3, x: 0, y: -7)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 10)
                                    )
                                    .shadow(color: Color.white, radius: 2, x: -2, y: -2)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 10)
                                    )
                            )
                            .background(.white)
                            .cornerRadius(20)
                        Text("표정의 이름은").font(.title) // 폰트 지정
                        Text("이야.").font(.title) // 폰트 지정
                    }
                    Spacer()
                    Image("button_next")
                        .onTapGesture {
                            isNextBtnClicked = true
                        }
                }
                ZStack {
                    Rectangle()
                        .frame(width: 844, height: 88)
                        .foregroundColor(.white)
                    HStack{
                        Text("blocks")
                    }
                }.offset(y:150)
            }
        } else if isPrevBtnClicked {
            ExpressView()
        } else {
            StoryView1()
        }
    }
}

struct EmotionView1_Previews: PreviewProvider {
    static var previews: some View {
        EmotionView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
