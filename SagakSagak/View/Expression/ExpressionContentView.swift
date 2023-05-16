//
//  ExpressionContentView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/16.
//

import SwiftUI

struct ExpressionContentView: View {
    @StateObject private var emotionText = EmotionText()
    @State private var selectedText = "basic"
    
    var body: some View {
        VStack{
            HStack(spacing:16){
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(
                            .shadow(.inner(color: Color.init(hex: "579DFF").opacity(0.3), radius: 10, x:0, y:-4))
                        )
                        .frame(width: 100, height:60)
                        .foregroundColor(Color.system2)
                    
                    Image(UserDefaultsManager.shared.faceImage!) /// 표정 얼굴 모양이 들어감
                        .padding(.top, 10)
                }
                Text("표정의 이름은").font(FontManager.shared.nanumsquare(.bold, 28))
                        
                //TODO: 해당 표정 이름 들어가도록 하기
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(
                            .shadow(.inner(color: Color.init(hex: "579DFF").opacity(0.3), radius: 10, x:0, y:-4))
                        )
                        .frame(width: 100, height:60)
                        .foregroundColor(Color.system2)
                    
                    if let text = emotionText.textName {
                        Text(text).font(FontManager.shared.nanumsquare(.extrabold, 24))
                            .foregroundColor(.yellow)
                    }
                    //Text("HI")

                }
                Text("이야.").font(FontManager.shared.nanumsquare(.bold, 28))
            }
        }
        .frame(width: Const.glScreenWidth, height:230)
        .onChange(of: emotionText.textName) { _ in
            selectedText = emotionText.textName ?? "basic"
        }
    }
}

struct ExpressionContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExpressionContentView()
    }
}
