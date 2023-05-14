//
//  ToCameraView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/14.
//

import SwiftUI
import UIKit
import AVFoundation

struct ToCameraView: View {
    @State private var isClicked: Bool = false
    @State private var selectedImage: UIImage? = nil
    @State private var showImagePicker: Bool = false
    @State private var showCamera: Bool = false
    @State private var isShowingCamera: Bool = false
    @State private var isBackBtnClicked: Bool = false
    
    var body: some View {
        if !isBackBtnClicked {
            ZStack {
                Rectangle().foregroundColor(Color(hex: !isClicked ? "D5F0E7" : "95A8A1"))
                    .ignoresSafeArea()
                
                VStack {
                    ZStack(alignment: .center) {
                        Image("추억이_담긴_액자")
                        Image(!isClicked ? "greenButton" : "").offset(x:370)
                            .onTapGesture {
                                isBackBtnClicked = true
                            }
                    }.padding(.bottom, 10)
                    
                    ZStack {
                        ZStack {
                            if selectedImage == nil {
                                Image("AddImgBtn").padding(.top, 20)
                            }else{
                                Image(uiImage: selectedImage!).resizable()
                                    .frame(width: 180,height: 140).padding(.top, 35)
                            }
                            
                            Image("defaultFrame")
                        }.onTapGesture {
                            isClicked = true
                        }
                        if isClicked {
                            ZStack {
                                Image("modal").padding(.all, -100)
                                    .shadow(radius: 5 ,x: 0, y: 10)
                                Image("blueXBtn").offset(x: 260, y: -130)
                                    .onTapGesture {
                                        isClicked = false
                                    }
                                VStack {
                                    Image("액자에_추억을_담아보자").padding(.top, -80)
                                    HStack {
                                        Image("사진_찍기")
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .stroke(Color(.white).opacity(0.5),
                                                            lineWidth: 2)
                                                    .shadow(color: Color(hex: "579DFF"),
                                                            radius: 3, x: 0, y: -7)
                                                    .clipShape(
                                                        RoundedRectangle(cornerRadius: 15)
                                                    )
                                            )
                                            .cornerRadius(20)
                                            .onTapGesture {
                                                isShowingCamera = true
                                                showCamera = true
                                                isClicked = false
                                            }
                                        Image("앨범에서_고르기")
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .stroke(Color(.white).opacity(0.5),
                                                            lineWidth: 2)
                                                    .shadow(color: Color(hex: "579DFF"),
                                                            radius: 3, x: 0, y: -7)
                                                    .clipShape(
                                                        RoundedRectangle(cornerRadius: 15)
                                                    )
                                            ).padding(.leading, 40)
                                            .cornerRadius(20)
                                            .onTapGesture {
                                                showImagePicker = true
                                                isClicked = false
                                            }
                                    }
                                }
                            }.padding(.top, -25)
                        }
                    }
                    Spacer()
                }.padding(.top, 40)
            }
            .fullScreenCover(isPresented: $isShowingCamera) {
                ImagePicker(sourceType: .camera, selectedImage: $selectedImage)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
            }
            
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedImage)
            }
        } else {
            MainView()
        }
    }
    
    private func loadImage() {
        if let image = selectedImage {
            
        }
    }
    
    func openLibrary() {
        showImagePicker = true
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    
    var sourceType: UIImagePickerController.SourceType
    @Binding var selectedImage: UIImage?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(selectedImage: $selectedImage)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @Binding var selectedImage: UIImage?
        
        init(selectedImage: Binding<UIImage?>) {
            _selectedImage = selectedImage
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                selectedImage = image
            }
            
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}

struct ToCameraView_Previews: PreviewProvider {
    static var previews: some View {
        ToCameraView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
