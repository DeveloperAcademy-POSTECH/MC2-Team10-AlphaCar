//
//  SplashView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/12.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                CoordinatorView()
            } else {
                HStack{
                    ZStack{
                        LottieView(jsonName: "splash", delay: 0.5)
        
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
                .onAppear(perform: {
                    SoundManager.instance.playBackgroundMusic(sound: .splash)
    
                    }
        
                )
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

    

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

