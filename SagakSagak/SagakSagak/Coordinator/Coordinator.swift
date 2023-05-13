//
//  Coordinator.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/07.
//

import SwiftUI
import ComposableArchitecture

enum Page: String, Identifiable {
    case splash, main, letter, draw, character1, character2, face, emotion, story1, story2, end1, end2, end3
    //, login, signup
    
    var id: String {
        self.rawValue
    }
}

//ObservableObject
class Coordinator: ObservableObject{
    @Published var path = NavigationPath() //16버전부터만 가능
    

    // MARK: 화면 전환
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot(){
        path.removeLast(path.count)
    }
    
    // MARK: ViewBuilder
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .splash:
            SplashView()
        case .main:
            MainView()
        case .letter:
            LetterView()
        case .draw:
            DrawingView()
        case .character1:
            CharacterView1()
        case .character2:
            CharacterView2()
        case .face:
            ExpressView()
        case .emotion:
            EmotionView() //TODO: Fix
//            EmotionView(selectedFace: .constant("pleased")) //TODO: Fix
        case .story1:
            StoryView1()
        case .story2:
            StoryView2()
        case .end1:
            EndingView1()
        case .end2:
            EndingView2()
        case .end3:
            EndingView3()
        //        case .login:
        //            LoginView(store: Store(initialState: LoginDomain.State(), reducer: LoginDomain()))
        //        case .signup:
        //            SignUpView()
        }
    }
    
}

