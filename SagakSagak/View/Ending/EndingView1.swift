//
//  EndingView1.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/12.
//

import SwiftUI

struct EndingView1: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        ZStack {
            Image("background").padding(.top, 20)

            ZStack {
                GLNavBarItem(backPage: .story2, backButtonImg: "button_back", shadowOn: true, navBarTitle: "이야기 들려줘서 고마워!", navBarBgColor: Color(hex: "FFFFFF"), navBarFontColor: Color(hex: "383838"), nextButtonImg: "button_next", nextPage: .end2, nextEnabled: true)
                
                Image("button_exit")
                    .padding(.leading, 750)
                    .onTapGesture {
                        coordinator.popToRoot()
                    }
            }.padding(.bottom, 280)
            
            GeometryReader { geometry in
                ZStack {
                    Ellipse()
                        .foregroundColor(Color(hex: "C8E9DF"))
                        .frame(width: 1000, height: 400)
                        .offset(y: 100)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            
            VStack{
                LottieView(jsonName: "happy", loopMode: .loop)
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
    
struct EndingView1_Previews: PreviewProvider {
    static var previews: some View {
        EndingView1()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
