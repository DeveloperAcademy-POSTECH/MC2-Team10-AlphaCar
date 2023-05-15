//
//  ExpressView.swift
//  Faceapp
//
//  Created by 박리라 on 2023/05/10.
//

import SwiftUI

struct ExpressView: View {
    @State private var isNextBtnClicked = false
    @State private var isPrevBtnClicked = false
    @State private var isExitBtnClicked = false
    @State private var selectedFace = "basic" // 초기 표정 설정
    @StateObject private var emotionFace = EmotionFace()
    @EnvironmentObject private var coordinator: Coordinator
    
    
    var body: some View {
        Rectangle()
        
        Button {
            coordinator.push(.emotion)
        } label: {
            Text("다음으로)")
        }

    }
}

struct ExpressView_Previews: PreviewProvider {
    static var previews: some View {
        ExpressView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
