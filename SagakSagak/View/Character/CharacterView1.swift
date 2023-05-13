//
//  CharacterView1.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/12.
//

import SwiftUI

struct CharacterView1: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var snapshotImage: SnapshotImage
    @State private var isNextBtnClicked = false
    @State private var isPrevBtnClicked = false
    
    var body: some View {
        if !isNextBtnClicked && !isPrevBtnClicked {
            VStack{
                Text("캐릭터")
                Button("화면"){
                    isNextBtnClicked = true
                }
            }.navigationBarBackButtonHidden(true)
        } else {
            CharacterView2()
        }
    }
}

struct CharacterView1_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView1()
    }
}
