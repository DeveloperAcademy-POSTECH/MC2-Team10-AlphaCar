//
//  Login.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/07.
//

import Foundation
import ComposableArchitecture
import SwiftUI

struct LoginDomain: ReducerProtocol{
    
    //앱의 상태 정의
    struct State: Equatable{
        var id = ""
        var password = ""
        var isNavigationActive: Bool = false
    }
    
    //상태들을 변화시키는 사용자의 액션
    enum Action: Equatable{
        case id(String)
        case password(String)
        case navigateToNextScreen(Bool)
    }
    
   // struct Environment {}
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action{
        case let .id(id):
            state.id = id
            return .none
        case let .password(password):
            state.password = password
            return .none
        case .navigateToNextScreen(let isActive):
            state.isNavigationActive = isActive
            return .none
        }
    }
}
