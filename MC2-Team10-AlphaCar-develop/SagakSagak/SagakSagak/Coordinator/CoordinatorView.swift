//
//  CoordinatorView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/07.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()
    @StateObject private var emotionFace = EmotionFace()
    init(){
           UINavigationBar.setAnimationsEnabled(false)
       }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .main) //TODO: 페이지 바꾸기
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
        }
//        .environmentObject(self.emotionFace)
        .environmentObject(coordinator)
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
