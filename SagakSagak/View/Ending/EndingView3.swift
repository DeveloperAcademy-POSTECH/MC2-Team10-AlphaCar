//
//  EndingView3.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/12.
//

import SwiftUI

struct EndingView3: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack{
            LottieView(jsonName: "stamp", delay: 0.7)
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                coordinator.push(.main)
            }
        }
        
    }
}

struct EndingView3_Previews: PreviewProvider {
    static var previews: some View {
        EndingView3()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

