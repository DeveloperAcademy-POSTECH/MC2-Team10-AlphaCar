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
            LottieView(jsonName: "stamp")
            }
            .navigationBarBackButtonHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
    }
}

struct EndingView3_Previews: PreviewProvider {
    static var previews: some View {
        EndingView3()
    }
}

