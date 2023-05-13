//
//  GLNavBarTitleView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/11.
//

import SwiftUI

struct GLNavBarTitle: View {
    let navBarTitle: String ///네비게이션바 타이틀 내용  ex) 오늘의 이야기, 액자에 사진을 걸어보자
    let navBarBgColor: Color ///네비게이션바 타이틀 백그라운드 색상
    let navBarFontColor: Color ///네비게이션바 타이틀 폰트 색상
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(navBarBgColor)
                .frame(width:Const.glScriptWidth, height:Const.glScriptHeight)
                .overlay{
                    Text(navBarTitle)
                        .foregroundColor(navBarFontColor)
                        .font(FontManager.shared.nanumsquare(.bold, 18))
                }
        }
    }
}


//struct GLNavBarTitleView_Previews: PreviewProvider {
//    static var previews: some View {
//        GLNavBarTitleView()
//    }
//}
