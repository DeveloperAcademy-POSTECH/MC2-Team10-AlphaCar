//
//  GLBlockView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/13.
//
//
import SwiftUI

struct GLBlockView: View {
    static let faceData: [String] = ["twinkle", "pleased", "heart", "soso", "sad", "angry"]
 
    let rows: [GridItem] = [
        GridItem(.flexible(maximum: 60))
    ]
    
    var body: some View {
        LazyHGrid(rows: rows, spacing: 14){
            ForEach(GLBlockView.faceData, id: \.self){ item in
                GLFaceBlock(imageName: item)
            }
        }
        .padding()
    }
}

struct GLBlockView_Previews: PreviewProvider {
    static var previews: some View {
        GLBlockView()
    }
}
