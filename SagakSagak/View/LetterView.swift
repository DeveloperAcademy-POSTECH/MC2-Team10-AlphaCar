//
//  LetterView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/12.
//

import SwiftUI

struct LetterView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button("화면"){
                coordinator.push(.draw)
            }
        }
    }
}

struct LetterView_Previews: PreviewProvider {
    static var previews: some View {
        LetterView()
    }
}
