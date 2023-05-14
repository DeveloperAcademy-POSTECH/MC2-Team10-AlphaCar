//
//  GLBlockView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/13.
//
//
import SwiftUI

enum BlockType: String{
    case face
    case weather
    case text1
    case text2
}

struct GLBlockView: View {
    static let faceData: [String] = ["twinkle", "pleased", "heart", "soso", "sad", "angry"]
    static let weatherData: [String] = ["snow", "wind", "sun", "cloud", "rain", "thunder"]
    static let emotionDataSet1: [String] = ["사랑", "멋짐", "기쁨", "행복함", "즐거움", "신남"]
    static let emotionDataSet2: [String] = ["나쁨", "심심함", "화남", "무서움", "짜증남", "슬픔"]
    
    static var blockType: BlockType = .text1

    let rows: [GridItem] = [
        GridItem(.flexible( maximum: 112))
    ]
    
    var body: some View {
        setUI(GLBlockView.blockType)
    }
    
    func setUI(_ type: BlockType) -> some View {
        switch type {
        case .face:
            return AnyView(
                LazyHGrid(rows: rows, spacing: 14){
                    ForEach(GLBlockView.faceData, id: \.self){ item in
                        GLBlockItem(imageName: item, textName: "")
                    }
                }
            )
        case .text1:
            return AnyView(
                LazyHGrid(rows: rows, spacing: 14){
                    ForEach(GLBlockView.emotionDataSet1, id: \.self){ item in
                        GLBlockItem(imageName: "", textName: item)
                    }
                }
            )
        case .text2:
            return AnyView(
                LazyHGrid(rows: rows, spacing: 14){
                    ForEach(GLBlockView.emotionDataSet2, id: \.self){ item in
                        GLBlockItem(imageName: "", textName: item)
                    }
                }
            )
            
            
        case .weather:
            return AnyView(
                LazyHGrid(rows: rows, spacing: 20){
                    ForEach(GLBlockView.weatherData, id: \.self){ item in
                        GLBlockItem(imageName: item, textName:"")
                    }
                }
            )
        }
    }
}

struct GLBlockView_Previews: PreviewProvider {
    static var previews: some View {
        GLBlockView()
    }
}
