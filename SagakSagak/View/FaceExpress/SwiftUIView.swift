//
//  SwiftUIView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/15.
//

import SwiftUI

struct SwiftUIView: View {
    @State var onTouch:Bool
    
    var body: some View {
        VStack{
            GLNavBarItem(backPage: .character1, backButtonImg: "button_modal_back", shadowOn: false, navBarTitle: "오늘의 이야기", navBarBgColor: .bg1, navBarFontColor: .system1, nextButtonImg: "button_modal_next", nextPage: .character2, nextEnabled: onTouch)
  
            
            Circle().frame(width:100, height: 100)
                .onTapGesture {
                    onTouch.toggle()
                }
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(onTouch: false)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
