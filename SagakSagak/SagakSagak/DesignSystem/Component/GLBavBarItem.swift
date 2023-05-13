//
//  GLBavBarItem.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/13.
//

import SwiftUI

struct GLBavBarItem: View {
    let navBarTitle: String
    let navBarBgColor: Color
    let navBarFontColor: Color
    
    var body: some View {
        HStack{
            GLNavBarTitle(navBarTitle: navBarTitle, navBarBgColor: navBarBgColor, navBarFontColor: navBarFontColor)
            
            Image("button_exit")
                .padding(EdgeInsets(top: 5, leading: 128, bottom: 5, trailing: 0))
        }
    }
}

struct GLBavBarItem_Previews: PreviewProvider {
    static var previews: some View {
        GLBavBarItem(navBarTitle: "가람이에게 가장 소중한 것을 그려보자1", navBarBgColor: .system1, navBarFontColor: .system2)
    }
}
