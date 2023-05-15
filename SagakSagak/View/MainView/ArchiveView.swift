//
//  ArchiveView.swift
//  SagakTrial
//
//  Created by 신정연 on 2023/05/12.
//

import SwiftUI

struct ArchiveView: View {
    @State private var isActive : Bool = false
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        ZStack {
            Image("background_archive")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 250/255, green: 248/255, blue: 229/255))
            
            ZStack{
                GLNavBarTitle(navBarTitle: "어쩌구한 이야기책", navBarBgColor: .white, navBarFontColor: .blue)
                    .offset(x: 0, y: -140)
                Image("greenButton")
                    .offset(x:350, y:-110.5)
                    .padding(.top, -53.5)
                    .padding(.leading, 50)
                    .onTapGesture {
                        coordinator.push(.main)
                    }
                Button(action: {
                    isActive = true
                }) {
                    Image("book")
                }
                .offset(x: -85, y: 65)
                .shadow(color: Color(red: 38/255, green: 119/255, blue: 95/255).opacity(0.3), radius: 15, x: 0, y: -4)
                if(isActive){
                    ArchiveOpenView()
                }
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear(perform: {
            SoundManager.instance.playBackgroundMusic(sound: .archive) 
        })
    }
}

struct ArchiveView_Previews: PreviewProvider {
    static var previews: some View {
        ArchiveView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
