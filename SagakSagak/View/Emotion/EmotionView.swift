//
//  EmotionView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/14.
//

import SwiftUI
import UniformTypeIdentifiers

struct EmotionView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var snapshotImage: SnapshotImage
    
    var body: some View {
        VStack(spacing:0){
            ZStack{
                Rectangle().fill(Color.bg3).ignoresSafeArea()
                VStack{
                    navBar
                    contentView
                    
                }
            }
            Rectangle().frame(height:88).foregroundColor(Color.system2)
                .ignoresSafeArea()
                .overlay{
                    HStack{
                        Spacer().frame(width:50)
                        GLBlockView()
                    }
                }
        }
        .ignoresSafeArea()
    }
    
    //MARK: 네비게이션 바
    var navBar: some View {
        HStack{
            Spacer().frame(width:200)
            GLNavBarTitle(navBarTitle: "이 표정은 어떤 이름일까?", navBarBgColor: .system2, navBarFontColor: .system1)
            Button{
                coordinator.popToRoot()
            }label:{
                Image("button_exit")
                    .padding(EdgeInsets(top: 5, leading: 128, bottom: 5, trailing: 24))
            }
        }
    }
    
    //MARK: 중간 버튼
    var contentView: some View {
        HStack(spacing: 14){
            Button {
                
            } label: {
                Image("button_back")
            }
            
            Spacer().frame(width:120)
            
            Image("faceBgImage")
                .overlay{
                    Image(UserDefaultsManager.shared.faceImage ?? "twinkle")
                }
    
        
            Text("표정의 이름은")
                .font(FontManager.shared.nanumsquare(.bold, 24))
                .frame(width:160)
           
            Image("faceBgImage")
                .overlay{
                    Text(UserDefaultsManager.shared.feel ?? "사랑")
                        .font(FontManager.shared.nanumsquare(.bold, 24))
                }
            Text("이야")
                .font(FontManager.shared.nanumsquare(.bold, 24))
                .frame(width:60)
            
            Spacer().frame(width:70)
            Button {
                coordinator.push(.story1)
//                    .environmentObject(snapshotImage)
            } label: {
                Image("button_next")
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .frame(height:200)
    }
    
}


struct EmotionView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionView()
    }
}
