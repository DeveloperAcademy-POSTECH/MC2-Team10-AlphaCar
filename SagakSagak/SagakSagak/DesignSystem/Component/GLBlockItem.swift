//
//  GLBlockItem.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/13.
//

import SwiftUI
import UniformTypeIdentifiers

enum BlockItemType{
    case weatherItem
    case faceItem
    case textItem
}

struct GLBlockItem: View {

    static var blockItemType: BlockItemType = .textItem
    @State private var onClicked = true
    
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
                        .frame(width: 100, height: 60)
                        .mask(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.system2.opacity(0.5)) ///color
                        .innerShadow(color: Color.system2.opacity(0.5))) ///color
                    Image(imageName)
                }
            )

        case .textItem:
            return AnyView(
                Button(action: {
                    onClicked.toggle()
                    UserDefaultsManager.shared.feel = textName
                }){
                    if onClicked{
                        Text(textName).font(FontManager.shared.nanumsquare(.extrabold, 24))
                            .foregroundColor(Color.system2)
                        
                            .frame(width: 100, height: 60)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(
                                        .shadow(.inner(color: Color.init(hex: "006AFF").opacity(0.5), radius: 10, x:0, y:-4))
                                    )
                                    .foregroundColor(Color.block_bg2))
                    
                    } else {
                        Text(textName).font(FontManager.shared.nanumsquare(.extrabold, 24))
                            .foregroundColor(Color.system2)
                            .frame(width: 100, height: 60)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(
                                        .shadow(.inner(color: Color(hex: "006AFF").opacity(0.5), radius: 10, x:0, y:4))
                                    )
                                    .foregroundColor(Color.init(hex: "579DFF").opacity(0.3)))
     
                    }
                }
            )
        }
    }
}

