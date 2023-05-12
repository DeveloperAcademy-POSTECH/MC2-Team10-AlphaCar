//
//  GLFaceBlock.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/13.
//

import SwiftUI

struct GLFaceBlock: View {
    let imageName: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow) ///color 색상 system2로 바꾸기
                .frame(width: 112, height: 60)
                .mask(RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow.opacity(0.5)) ///color
                .innerShadow(color: Color.yellow.opacity(0.5))) ///color
            Image(imageName)
        }
    }
}

struct GLFaceBlock_Previews: PreviewProvider {
    static var previews: some View {
        GLFaceBlock(imageName: "pleased")
    }
}
