//
//  CharacterView1.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/12.
//

import SwiftUI

struct CharacterView1: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        ZStack {
            Image("background").padding(.top, 20)
            //                    .resizable()
            //                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            ZStack {
                GLNavBarItem(backPage: .draw, backButtonImg: "button_back", shadowOn: true, navBarTitle: "정말 멋진 그림이야!", navBarBgColor: Color(hex: "FFFFFF"), navBarFontColor: Color(hex: "383838"), nextButtonImg: "button_next", nextPage: .character2, nextEnabled: true)
                
                Image("button_exit")
                    .padding(.leading, 750)
                    .onTapGesture {
                        coordinator.push(.main)
                    }
            }.padding(.bottom, 280)
            
            GeometryReader { geometry in
                ZStack {
                    Ellipse()
                        .foregroundColor(.bg4)
                        .frame(width: 1000, height: 400)
                        .offset(y: 100)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            
            VStack{
                LottieView(jsonName: "great", loopMode: .loop)
                    .frame(height: 340)
                    .offset(y:35)
            }
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bg2)
        .ignoresSafeArea()
        }

}

struct CharacterView1_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView1()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

//        if let image = UserDefaultsManager.shared.snapShot {
//              Image(uiImage: image)
//                .resizable()
//                .frame(width: 300, height: 300) ///프레임 사이즈 결정
//        }
            
//        Image(uiImage: UserDefaultsManager.shared.snapShot!)
//            .resizable()
//            .frame(width: 400, height: 300)
