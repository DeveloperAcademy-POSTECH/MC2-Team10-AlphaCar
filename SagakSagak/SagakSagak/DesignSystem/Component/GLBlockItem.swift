//
//  GLBlockItem.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/13.
//

import SwiftUI

enum BlockItemType{
    case weatherItem
    case faceItem
    case textItem
}

struct GLBlockItem: View {
    static let blockItemType: BlockItemType = .textItem
    
    let imageName: String
    let textName: String
    
    var body: some View {
        setUI(GLBlockItem.blockItemType)
    }
    
    ///블럭의 종류에 따라 View를 setup함
    /// - Parameter Request: BlockItemType
    /// - Returns: View를 리턴함
    func setUI(_ type: BlockItemType) -> some View{
        switch type{
        case .weatherItem:
            return AnyView(
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.block_bg1)
                        .frame(width: 60, height: 60)
                        .mask(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.yellow.opacity(0.5)) ///color
                        .innerShadow(color: Color.block_bg1.opacity(0.5))) ///color
                    Image(imageName)
                }
            )
            
        case .faceItem:
            return AnyView(
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.system2) ///color 색상 system2로 바꾸기
                        .frame(width: 112, height: 60)
                        .mask(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.system2.opacity(0.5)) ///color
                        .innerShadow(color: Color.system2.opacity(0.5))) ///color
                    Image(imageName)
                }
            )

        case .textItem:
            return AnyView(
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.block_bg2) ///color 색상 system2로 바꾸기
                        .frame(width: 112, height: 60)  // TODO: 그림자 효과 재조정 필요

                    Text(textName)
                        .font(FontManager.shared.nanumsquare(.extrabold, 24))
                        .foregroundColor(.system2)
                }
            )
        }
    }
}

