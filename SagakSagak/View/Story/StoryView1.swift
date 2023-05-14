//
//  StoryView1.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/12.
//

import SwiftUI

struct StoryView1: View {
    @AppStorage(UserDefaultKey.snapShot.rawValue) var snapShotData: Data?
    @EnvironmentObject private var coordinator: Coordinator
    @State private var isNextBtnClicked = false
    @State private var isPrevBtnClicked = false

    var body: some View {
        if !isNextBtnClicked && !isPrevBtnClicked { 
            ZStack {
                Image("Group 10226").padding(.top,20)
                Rectangle().foregroundColor(Color(hex: "D5F0E7").opacity(0.5)).ignoresSafeArea()
                
                ZStack{
                    GLButtonSet(nextpage: .story2, backButtonImage: "button_back", forwardButtonImage: "button_next")
                }
                .navigationBarBackButtonHidden(true)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)

                ZStack {
                    if let data = snapShotData, let snapshot = UIImage(data: data) {
                        Image("letterBody")
                        VStack{
                            Image("오늘의_이야기").padding(.top,10)
                            Image("나에게 가장 소중한 것은").padding(.vertical,20).padding(.top,-10)
                        }.padding(.bottom,200)
                        ZStack{
                            Image("imageBody").resizable().frame(width:450, height:200)
                            Image("button_modal_back").offset(x: -360, y: 80)
                                .onTapGesture {
                                    isNextBtnClicked = true
                                }
                            Image("button_modal_next").offset(x: 360 , y: 80)
                                .onTapGesture {
                                    isNextBtnClicked = true
                                }
                            Image(uiImage: snapshot)
                                .resizable().scaledToFit().frame(width:450,height:450)
                                .offset(x:-15,y:0)
                        }.padding(.top,90)
                    } else {
                        Text("Snapshot image is not available.")
                    }
                }
            }.navigationBarBackButtonHidden(true)
        } else {
            StoryView2()
        }
    }
}

struct StoryView1_Previews: PreviewProvider {
    static var previews: some View {
        StoryView1().previewInterfaceOrientation(.landscapeRight)
    }
}
