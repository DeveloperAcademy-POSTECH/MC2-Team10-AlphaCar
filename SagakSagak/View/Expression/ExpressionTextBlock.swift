//
//  ExpressionTextBlock.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/16.
//

import SwiftUI

class EmotionText: ObservableObject {
    @Published var textName: String?
}

struct ExpressTextButton: View {
    let textName: String
    let selectedtextName: String
    let action: () -> Void
    let offset: CGSize
    @Binding var selectedButton: String?

    var isSelected: Bool {
        selectedButton == textName
    }

    var body: some View {
        Button(action: {
            selectedButton = isSelected ? nil : textName
            action()
        }) {
            Text(textName).font(FontManager.shared.nanumsquare(.extrabold, 24))
                .foregroundColor(Color.system2)
                .frame(width: 100, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(
                            .shadow(.inner(color: Color(hex: "006AFF").opacity(0.5), radius: 10, x:0, y: isSelected ? 4 : -4))
                        )
                        .foregroundColor(isSelected ? Color.init(hex: "89BAFF").opacity(0.3) : Color.block_bg2)
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ExpressionTextBlock: View {
    @EnvironmentObject private var emotionText: EmotionText
    @State private var backgroundColor = Color.block_bg2
    @State private var overlayColor = Color.block_bg2.opacity(0.1)
    @State private var overlayOffset = CGSize(width: 0, height: 0)
    @State private var selectedButton: String?

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 844, height: 88)
                .foregroundColor(.white)

            HStack(spacing: 14) {
                
                if UserDefaultsManager.shared.faceImage == "twinkle" || UserDefaultsManager.shared.faceImage == "pleased"  || UserDefaultsManager.shared.faceImage == "heart" {
                    //MARK: -
                    ForEach([
                        ("사랑", "Button 1", CGSize(width: 0, height: 0)),
                        ("멋짐", "Button 2", CGSize(width: 0, height: 0)),
                        ("기쁨", "Button 3", CGSize(width: 0, height: 0)),
                        ("행복함", "Button 4", CGSize(width: 0, height: 0)),
                        ("즐거움", "Button 5", CGSize(width: 0, height: 0)),
                        ("신남", "Button 6", CGSize(width: 0, height: 0))
                    ], id: \.1) { textName, title, offset in
                        ExpressTextButton(
                            textName: textName,
                            selectedtextName: title,
                            action: {
                                emotionText.textName = textName
                            },
                            offset: offset,
                            selectedButton: $selectedButton
                        )
                    } } else {
                        ForEach([
                            ("나쁨", "Button 1", CGSize(width: 0, height: 0)),
                            ("심심함", "Button 2", CGSize(width: 0, height: 0)),
                            ("화남", "Button 3", CGSize(width: 0, height: 0)),
                            ("무서움", "Button 4", CGSize(width: 0, height: 0)),
                            ("짜증남", "Button 5", CGSize(width: 0, height: 0)),
                            ("슬픔", "Button 6", CGSize(width: 0, height: 0))
                        ], id: \.1) { textName, title, offset in
                            ExpressTextButton(
                                textName: textName,
                                selectedtextName: title,
                                action: {
                                    emotionText.textName = textName
                                },
                                offset: offset,
                                selectedButton: $selectedButton
                            )
                    }
    
                }
                
            }
        }
    }
}
