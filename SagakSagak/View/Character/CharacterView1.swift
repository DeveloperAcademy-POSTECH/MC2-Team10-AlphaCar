//
//  CharacterView1.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/11.
//

import SwiftUI

struct CharacterView1: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack{
            Text("캐릭터")
            Button("화면"){
                coordinator.push(.character2)
            }
        }
    }
}

struct CharacterView1_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView1()
    }
}
