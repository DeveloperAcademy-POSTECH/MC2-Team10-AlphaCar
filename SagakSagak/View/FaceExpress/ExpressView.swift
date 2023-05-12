//
//  ExpressView.swift
//  Faceapp
//
//  Created by 박리라 on 2023/05/10.
//

import SwiftUI

struct ExpressView: View {
    @State private var selectedFace = "basic" // 초기 표정 설정
    @StateObject private var emotionFace = EmotionFace()
    
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
                        if let image = emotionFace.faceName {
                            LottieView(jsonName: image)
                                .id(image)
                        }else{
                            LottieView(jsonName: "basic")
                        }
                        NavigationLink(destination: EmotionView(selectedFace: selectedFace)) {
                            Image("button_next")
                        }.navigationBarBackButtonHidden(true) // < Back 없애기
                    }
                }
                .padding()
                FaceView()
                    .environmentObject(self.emotionFace)
                    .offset(y:150)
            }
        }
        .onChange(of: emotionFace.faceName) { _ in
            selectedFace = emotionFace.faceName ?? "basic"
        }
    }
}

struct ExpressView_Previews: PreviewProvider {
    static var previews: some View {
        ExpressView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
