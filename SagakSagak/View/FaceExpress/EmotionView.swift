//
//  EmotionView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/14.
//

import SwiftUI

struct EmotionView: View {
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
                
//                GLNavBarItem(navBarTitle: "이 표정은 어떤 이름일까?", navBarBgColor: .system2, navBarFontColor: .system3)
//
                VStack{
//                    LottieView(jsonName: "love", loopMode: .loop)
//                        .frame(height: 360)
//                        .offset(y: 20)
                }
                .navigationBarBackButtonHidden(true)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, geometry.safeAreaInsets.bottom)
                
                ZStack{
                    //                        GLButtonSet(nextpage: .end3, backButtonImage: "button_back", forwardButtonImage: "button_next")
                    Button {
                        coordinator.push(.story1)
                    } label: {
                        Text("다음으로")
                    }

                    
                    
                }
                .navigationBarBackButtonHidden(true)
                
            }
        }
        .background(Color.bg2)
        .ignoresSafeArea()
    }
}



struct EmotionView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionView()
    }
}
