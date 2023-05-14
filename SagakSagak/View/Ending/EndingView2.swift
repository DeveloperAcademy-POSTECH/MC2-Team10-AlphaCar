//
//  EndingView2.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/12.
//

import SwiftUI

struct EndingView2: View {
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
                        GLBavBarItem(navBarTitle: "내일 또 만나자, 사랑해♥︎", navBarBgColor: .system2, navBarFontColor: .system3)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    
                VStack{
                    LottieView(jsonName: "love", loopMode: .loop)
                        .frame(height: 360)
                        .offset(y: 20)
                    }
                    .navigationBarBackButtonHidden(true)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .padding(.bottom, geometry.safeAreaInsets.bottom)
                    
                ZStack{
                        GLButtonSet(page: .end2, backButtonImage: "button_back", forwardButtonImage: "button_next")
                        
                    }
                    .navigationBarBackButtonHidden(true)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)

                }
            }
            .background(Color.bg2)
            .ignoresSafeArea()
        }
}

struct EndingView2_Previews: PreviewProvider {
    static var previews: some View {
        EndingView2()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
