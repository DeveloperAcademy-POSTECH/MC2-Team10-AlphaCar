//
//  CharacterView1.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/12.
//

import SwiftUI

struct CharacterView1: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var snapshotImage: SnapshotImage
    @State private var isNextBtnClicked = false
    @State private var isPrevBtnClicked = false
    
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
                        Spacer()
                        GLBavBarItem(navBarTitle: "정말 멋진 그림이야!", navBarBgColor: .system2, navBarFontColor: .system3)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding(.trailing, 24)
                    .padding(.top, 18)
                    
                VStack{
                    LottieView(jsonName: "great", loopMode: .loop)
                        .frame(height: 330)
                    }
                    .navigationBarBackButtonHidden(true)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .padding(.bottom, geometry.safeAreaInsets.bottom)
                    
                ZStack{
                        GLButtonSet(page: .character2, backButtonImage: "button_back", forwardButtonImage: "button_next")
                        
                    }
                    .navigationBarBackButtonHidden(true)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .padding(.trailing, 24)
                    .padding(.bottom, 18)

                }
            }
            .background(Color.bg2)
            .ignoresSafeArea()
        }

}

struct CharacterView1_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView1()
    }
}
