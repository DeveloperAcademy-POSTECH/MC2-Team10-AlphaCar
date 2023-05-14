//
//  GLBasicView_type1.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/14.
//

import SwiftUI

struct GLBasicView_type1: View {
    let navBarTitle: String
    let navBarBgColor: Color
    let navBarFontColor: Color
    let customView: any View
    
    var body: some View {
        
        ZStack {
            Image("background")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            GeometryReader { geometry in
                GLNavBarItem(navBarTitle: "가람이에게 가장 소중한 것을 그려보자!", navBarBgColor: navBarBgColor, navBarFontColor: navBarFontColor)
                
                VStack{
                    //TODO 커스텀 뷰 여기에 추가
                    
                    
                }
                .navigationBarBackButtonHidden(true)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, geometry.safeAreaInsets.bottom)
                
                ZStack{
                    GLButtonSet(nextpage: .end3, backButtonImage: "button_back", forwardButtonImage: "button_next")
                    
                }
                .navigationBarBackButtonHidden(true)
                
            }
        }
        .background(Color.bg2)
        .ignoresSafeArea()
        
        
    }
}



struct GLBasicView_type1_Previews: PreviewProvider {
    static var previews: some View {
        GLBasicView_type1(navBarTitle: "가람이에게 가장 소중한 것을 그려보자!", navBarBgColor: .system2, navBarFontColor: .system1, customView: Rectangle())
    }
}
