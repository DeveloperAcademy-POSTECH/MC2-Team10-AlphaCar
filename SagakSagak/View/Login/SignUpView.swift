//
//  SignUpView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/12.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject private var coordinator: Coordinator
    var body: some View {
        Button("스플래시 화면으로 이동"){
            coordinator.popToRoot()
        }
        .navigationTitle("회원가입 뷰")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
