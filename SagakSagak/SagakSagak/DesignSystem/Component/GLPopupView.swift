//
//  GLPopupView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/13.
//

import SwiftUI

struct GLPopupView: View {
    let popupWidth: CGFloat
    let popupHeight: CGFloat
    let popupBgColor: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .fill(popupBgColor)
                .frame(width: popupWidth, height: popupHeight)
        }
        .background(popupBgColor)
    }
}
