//
//  StoryView2.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/11.
//

import SwiftUI

struct StoryView2: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack{
            Text("스토리2")
            Button("화면"){
                coordinator.push(.end1)
            }
        }
    }
}

struct StoryView2_Previews: PreviewProvider {
    static var previews: some View {
        StoryView2()
    }
}
