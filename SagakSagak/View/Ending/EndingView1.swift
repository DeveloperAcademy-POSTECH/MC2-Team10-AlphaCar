//
//  EndingView1.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/12.
//

import SwiftUI

struct EndingView1: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack{
            Text("스토리2")
            Button("화면"){
                coordinator.push(.end2)
            }
        }
    }
}

struct EndingView1_Previews: PreviewProvider {
    static var previews: some View {
        EndingView1()
    }
}
