//
//  SagakSagakApp.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/02.
//

import SwiftUI
import ComposableArchitecture

@main
struct SagakSagakApp: App {
    var body: some Scene {
        WindowGroup {
           CoordinatorView()
            //LoginView(store: Store(initialState: LoginDomain.State(), reducer: LoginDomain()))
        }
    }
}
