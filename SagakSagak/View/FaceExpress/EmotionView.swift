//
//  EmotionView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/14.
//

import SwiftUI
import UniformTypeIdentifiers

enum textType: String {
    case text1
    case text2
}

struct EmotionView: View {
    var body: some View {
        DropText()
        GLBlockView()
    }
}


struct DropText: View {
    @State var myText: String = ""
    @State var targeted: Bool = false
    @State private var onDrag = false
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(onDrag ? Color.block_bg2 : Color.block_bg3) //TODO: 컬러 확인
                .frame(width: 100, height: 60)  // TODO: 그림자 효과(innershadow, blur) 재조정 필요

            Text(myText)
                .font(FontManager.shared.nanumsquare(.extrabold, 24))
                .foregroundColor(onDrag ? Color.block_bg3: Color.block_bg2)
        }
        .onDrop(of: [UTType.text], delegate: DragRelocateDelegate(dropText: $myText, onDrag: $onDrag))

    }
}



struct EmotionView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionView()
    }
}
