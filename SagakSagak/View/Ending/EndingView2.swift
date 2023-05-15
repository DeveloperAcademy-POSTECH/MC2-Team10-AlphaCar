//
//  EndingView2.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/12.
//

import SwiftUI

struct EndingView2: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        ZStack {
            Image("background").padding(.top, 20)
            
            ZStack {
                GLNavBarItem(backPage: .end1, backButtonImg: "button_back", shadowOn: true, navBarTitle: "내일 또 만나자!", navBarBgColor: Color(hex: "FFFFFF"), navBarFontColor: Color(hex: "383838"), nextButtonImg: "button_next", nextPage: .end3, nextEnabled: true)
                
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
                LottieView(jsonName: "love", loopMode: .loop)
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

struct EndingView2_Previews: PreviewProvider {
    static var previews: some View {
        EndingView2()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
