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
        if !isNextBtnClicked {
            VStack{
                Text("캐릭터2")
                Button("화면"){
                    //                coordinator.push(.face)
                    isNextBtnClicked = true
                }
            }.navigationBarBackButtonHidden(true)
        } else {
          ExpressView()
        }
    }
}

struct CharacterView2_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView2()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
