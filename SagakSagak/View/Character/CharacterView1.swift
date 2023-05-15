//
//  CharacterView1.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/12.
//

import SwiftUI

struct CharacterView1: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State private var isNextBtnClicked = false
    @State private var isPrevBtnClicked = false
    
    var body: some View {
        
//        if let image = UserDefaultsManager.shared.snapShot {
//              Image(uiImage: image)
//                .resizable()
//                .frame(width: 300, height: 300) ///프레임 사이즈 결정
//        }
        
        Image(uiImage: image)
            .resizable()
            .frame(width: 300, height: 300)
        
        
        Image(uiImage: UserDefaultsManager.shared.snapShot!)
            .resizable()
            .frame(width: 400, height: 300)


            ZStack {
                Image("background")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                GeometryReader { geometry in
                    ZStack {
                        Ellipse()
                            .foregroundColor(.bg4)
                            .frame(width: 1000, height: 400)
                            .offset(y: 100)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)



                }
                HStack{
                    GLNavBarItem(navBarTitle: "정말 멋진 그림이야!", navBarBgColor: .system2, navBarFontColor: .system3)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

            VStack{
                LottieView(jsonName: "great", loopMode: .loop)
                    .frame(height: 340)
                }
                .navigationBarBackButtonHidden(true)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()

            ZStack{
                    GLButtonSet(nextpage: .character2, backButtonImage: "button_back", forwardButtonImage: "button_next")

                }
                .navigationBarBackButtonHidden(true)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
            .background(Color.bg2)
        }

}

struct CharacterView1_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView1()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
