//
//  SplashView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/07.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        
        VStack{
            Text("스플래시")
                .font(FontManager.shared.nanumsquare(.extrabold, 30))
                .foregroundColor(.system1)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.button_bg1)
                .frame(width:Const.glScriptWidth, height:Const.glScriptHeight)
            
            Button("메인 화면으로 이동"){
                coordinator.push(.main)
            }
        }
        .padding()
        .navigationTitle("스플래시 화면")
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
