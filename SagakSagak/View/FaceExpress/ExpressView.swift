//
//  ExpressView.swift
//  Faceapp
//
//  Created by 박리라 on 2023/05/10.
//

import SwiftUI

struct ExpressView: View {
    @State private var selectedFace = "face_happy" // 초기 표정 설정
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background").resizable().scaledToFill()
                Color.bg2.ignoresSafeArea().opacity(0.5)
                VStack {
                    ZStack {
                        Image("text").frame(alignment: .center)
                        Image("button_exit").offset(x:380)
                    }
                    
                    HStack{
                        Image("button_back")
                        CharacterExpressView(selectedFace: $selectedFace)
                        NavigationLink(destination: EmotionView(selectedFace: selectedFace)) {
                            Image("button_next")
                        }.navigationBarBackButtonHidden(true) // < Back 없애기
                    }
                }
                .padding()
                FaceView(selectedFace: $selectedFace)
                    .offset(y:150)
                
            }
        }
    }
}

struct ExpressView_Previews: PreviewProvider {
    static var previews: some View {
        ExpressView()
    }
}
