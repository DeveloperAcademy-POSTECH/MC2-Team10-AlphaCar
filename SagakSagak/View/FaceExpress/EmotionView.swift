//
//  EmotionView.swift
//  SagakSagak
//
//  Created by 박리라 on 2023/05/11.
//

import SwiftUI

struct EmotionView: View {
   // @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //var selectedFace: String
    @EnvironmentObject private var coordinator: Coordinator
    @Binding var selectedFace: String
    
    var body: some View {
        ZStack {
            Color.bg2.ignoresSafeArea() // 배경화면 변경 필요
            
            HStack{
//                Button(action: {
//                    self.presentationMode.wrappedValue.dismiss()
//                }) {
//                    Image("button_back")
//                }
                Spacer()
                HStack {
                    Image(selectedFace)
                    Text("표정의 이름은").font(.title) // 폰트 지정
                    Text("이야.").font(.title) // 폰트 지정
                }
                Spacer()
                Image("button_next")
                    .onTapGesture {
                        coordinator.push(.story1)
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
        
    }
}

struct EmotionView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionView(selectedFace: .constant("pleased"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
