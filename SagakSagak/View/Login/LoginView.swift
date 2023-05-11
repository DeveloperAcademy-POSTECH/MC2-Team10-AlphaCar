//
//  LoginView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/07.
//

//import SwiftUI
//import ComposableArchitecture
//
//
//struct LoginView: View {
//    let store: StoreOf<LoginDomain>
//    @State var isNavigationActivr = false
//    @EnvironmentObject private var coordinator: Coordinator
//    
//    
//    var body: some View {
//        WithViewStore(self.store) {viewStore in
//            NavigationView {
//                VStack(spacing: 10){
//                    TextField("아이디", text: Binding(get: {viewStore.id}, set: {viewStore.send(.id($0))}))
//                        .textFieldStyle(.roundedBorder)
//                    SecureField("비밀번호", text: Binding(get: {viewStore.password}, set: {viewStore.send(.password($0))}))
//                        .textFieldStyle(.roundedBorder)
//                    HStack{
//                        Button("로그인"){
//                            print("메인화면으로 이동")
//                        }
//                        
//                        Button("회원가입"){
//                            coordinator.push(.signup) //TODO: 수정 필요
//                        }
//                    }
//                }
//                .padding()
//            }
//            
//        }
//    }
//}


//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
