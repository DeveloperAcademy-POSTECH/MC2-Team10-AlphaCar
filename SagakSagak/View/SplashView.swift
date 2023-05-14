//
//  SplashView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/12.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        HStack{
            ZStack{
                LottieView(jsonName: "splash", delay: 0.5)
                Button("화면을 터치하세요"){
                    coordinator.push(.main)
                }
                .foregroundColor(.system2)
                .offset(y: 130)
                .bold()
            
                
            }
            .padding()
            .navigationTitle("스플래시 화면")
            .navigationBarBackButtonHidden(true)
            .frame(maxWidth: 700, maxHeight: .infinity)
            .ignoresSafeArea()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color.bg4)
        
    }
}

    

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

