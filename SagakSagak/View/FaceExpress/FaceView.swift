//
//  FaceView.swift
//  Faceapp
//
//  Created by 박리라 on 2023/05/10.
//

import SwiftUI

class EmotionFace: ObservableObject {
    @Published var faceName: String?
}

struct ExpressButton: View {
    let imageName: String
    let selectedImageName: String
    let action: () -> Void
    let offset: CGSize
    @Binding var selectedButton: String?

    var isSelected: Bool {
        selectedButton == imageName
    }

    var body: some View {
        Button(action: {
            selectedButton = isSelected ? nil : imageName
            action()
        }) {
            Image(imageName)
                .frame(width: 112, height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.white).opacity(0.1), lineWidth: 5)
                        .shadow(color: Color(hex: "579DFF"), radius: 5, x: 0, y: isSelected ? 5 : -5)
                        .padding(-6)
                )
                .cornerRadius(10)
                .offset(offset)
                .foregroundColor(.black)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct FaceView: View {
    @EnvironmentObject private var emotionFace: EmotionFace
    @State private var backgroundColor = Color.white
    @State private var overlayColor = Color(.white).opacity(0.1)
    @State private var overlayOffset = CGSize(width: 0, height: 0)
    @State private var selectedButton: String?

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 844, height: 88)
                .foregroundColor(.white)

            HStack(spacing: 14) {
                ForEach([
                    ("twinkle", "Button 1", CGSize(width: 0, height: 0)),
                    ("pleased", "Button 2", CGSize(width: 0, height: 0)),
                    ("heart", "Button 3", CGSize(width: 0, height: 0)),
                    ("soso", "Button 4", CGSize(width: 0, height: 0)),
                    ("sad", "Button 5", CGSize(width: 0, height: 0)),
                    ("angry", "Button 6", CGSize(width: 0, height: 0))
                ], id: \.1) { imageName, title, offset in
                    ExpressButton(
                        imageName: imageName,
                        selectedImageName: title,
                        action: {
                            emotionFace.faceName = imageName
                            UserDefaultsManager.shared.faceImage = emotionFace.faceName
                            backgroundColor = Color(.black)
                        },
                        offset: offset,
                        selectedButton: $selectedButton
                    )
                }
            }
        }
    }
}
