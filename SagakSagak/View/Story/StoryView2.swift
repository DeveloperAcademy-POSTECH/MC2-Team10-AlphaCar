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
    
    var body: some View {
        if !isNextBtnClicked && !isPrevBtnClicked {
            ZStack {
                Image("Group 10226").padding(.top,20)
                Rectangle().foregroundColor(Color(hex: "D5F0E7").opacity(0.5)).ignoresSafeArea()
                
                HStack(spacing: 14){
                    Button {
                        
                    } label: {
                        Image("button_back")
                    }
                    
                    Spacer().frame(width:120)
                    
                    Image("faceBgImage")
                        .overlay{
                            Image(UserDefaultsManager.shared.faceImage ?? "twinkle")
                        }
            
                
                    Text("표정의 이름은")
                        .font(FontManager.shared.nanumsquare(.bold, 24))
                        .frame(width:160)
                   
                    Image("faceBgImage")
                        .overlay{
                            Text(UserDefaultsManager.shared.feel ?? "사랑")
                                .font(FontManager.shared.nanumsquare(.bold, 24))
                        }
                    Text("이야")
                        .font(FontManager.shared.nanumsquare(.bold, 24))
                        .frame(width:60)
                    
                    Spacer().frame(width:70)
                    Button {
                        coordinator.push(.end1)
        //                    .environmentObject(snapshotImage)
                    } label: {
                        Image("button_next")
                    }
                    
                }
//                ZStack {
//                    if let faceEmoji = emotionFace.faceName {
//                        Image("letterBody")
//                        VStack{
//                            Image("오늘의_이야기").padding(.top,10)
//                            Image("나에게 가장 소중한 것은").padding(.vertical,20).padding(.top,-10)
//                        }.padding(.bottom,200)
//                        ZStack{
//                            Image("imageBody").resizable().frame(width:450, height:200)
//                            Image("button_modal_back").offset(x: -360, y: 80)
//                                .onTapGesture {
//                                    isNextBtnClicked = true
//                                }
//                            Image("button_modal_next").offset(x: 360 , y: 80)
//                                .onTapGesture {
//                                    isNextBtnClicked = true
//                                }
//                            Image(faceEmoji)
//                                .padding(20)
//                                .foregroundColor(Color(red: 52/255, green: 57/255, blue: 133/255))
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .stroke(Color(.white).opacity(0.5),
//                                                lineWidth: 2)
//                                        .shadow(color: Color(hex: "579DFF"),
//                                                radius: 3, x: 0, y: -7)
//                                        .clipShape(
//                                            RoundedRectangle(cornerRadius: 10)
//                                        )
//                                        .shadow(color: Color.white, radius: 2, x: -2, y: -2)
//                                        .clipShape(
//                                            RoundedRectangle(cornerRadius: 10)
//                                        )
//                                )
//                                .background(.white)
//                                .cornerRadius(20)
//                                .offset(x:-15,y:0)
//                        }.padding(.top,90)
//                    } else {
//                        Text("Face Emoji not available.")
//                    }
//                }
            }
        } else {
            MainView()
        }
    }
}

struct StoryView2_Previews: PreviewProvider {
    static var previews: some View {
        StoryView2()
    }
}
