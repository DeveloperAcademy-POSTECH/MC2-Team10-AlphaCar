//
//  StoryView1.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/11.
//

import SwiftUI

struct StoryView1: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack{
            Text("스토리뷰")
            Button("화면"){
                coordinator.push(.story2)
            }
        }
    }
}

struct StoryView1_Previews: PreviewProvider {
    static var previews: some View {
        StoryView1()
    }
}
