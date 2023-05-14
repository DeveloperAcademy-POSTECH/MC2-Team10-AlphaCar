//
//  CharacterView2.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/12.
//

import SwiftUI

struct CharacterView2: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {

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
                    
                    HStack{
                        GLBavBarItem(navBarTitle: "소중한 것을 떠올리면 어떤 표정이 될까?", navBarBgColor: .system2, navBarFontColor: .system1)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    
                VStack{
                    LottieView(jsonName: "happy", loopMode: .loop)
                        .frame(height: 360)
                        .offset(y: 20)
                    }
                    .navigationBarBackButtonHidden(true)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .padding(.bottom, geometry.safeAreaInsets.bottom)
                    
                ZStack{
                        GLButtonSet(page: .character2, backButtonImage: "button_back", forwardButtonImage: "button_next")
                        
                    }
                    .navigationBarBackButtonHidden(true)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)

                }
            }
            .background(Color.bg2)
            .ignoresSafeArea()
        }

}

struct CharacterView2_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView2()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
