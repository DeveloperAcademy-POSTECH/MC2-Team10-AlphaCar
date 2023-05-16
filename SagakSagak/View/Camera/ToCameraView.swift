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
    @State var selectedImage: UIImage?
    @State private var showImagePicker: Bool = false
    @State private var showCamera: Bool = false
    @State private var isShowingCamera: Bool = false
    @State private var isBackBtnClicked: Bool = false
    @State var image: Image?
    @State private var currentImg: UIImage? = UserDefaultsManager.shared.profile
    
    @EnvironmentObject private var coordinator: Coordinator
    private let soundManager = SoundManager.instance
    
    func modalImageFunc(title: String) -> some View {
        return Image(title)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(.white).opacity(0.5), lineWidth: 2)
                    .shadow(color: Color(hex: "579DFF"), radius: 3, x: 0, y: -7)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            )
            .cornerRadius(20)
            .offset(y:30)
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
        UserDefaultsManager.shared.profile = selectedImage
    }
    
    
    var body: some View {
            ZStack {
                Rectangle().foregroundColor(Color(hex:"D5F0E7")).ignoresSafeArea()
                Image("cameraStripe")
                if isClicked{
                    Rectangle().foregroundColor(Color(hex:"000000")).opacity(0.5).ignoresSafeArea()
                }
                ZStack{
                    
                    VStack {
                        ZStack(alignment: .center) {
                            Image(!isClicked ? "추억이_담긴_액자" : "추억이_담긴_액자_black")
                            Image(!isClicked ? "greenButton" : "").offset(x:370)
                                .onTapGesture {
                                    coordinator.push(.main)
                                    soundManager.playSound(sound: .exit)
                                }
                        }.padding(.bottom, 16)
                        
                        ZStack {
                            ZStack {
                                if let image = image {
                                    image
                                        .resizable()
                                        .frame(width: 180,height: 140)
                                        .padding(.top, 35)
                                } else if let profileImage = UserDefaultsManager.shared.profile {
                                    Image(uiImage: profileImage)
                                        .resizable()
                                        .frame(width: 180,height: 140)
                                        .padding(.top, 35)
                                } else {
                                    Image("AddImgBtn").padding(.top, 20)
                                }
                                
                                Image("defaultFrame")
                            }.onTapGesture {
                                isClicked = true
                            }
                            if isClicked {
                                ZStack {
                                    Image("camera_modal").padding(.all, -100)
                                        .shadow(radius: 5 ,x: 0, y: 10)
                                    Image("button_modal_exit").offset(x: 260, y: -130)
                                        .onTapGesture {
                                            isClicked = false
                                            soundManager.playSound(sound: .exit)
                                        }
                                    VStack {
                                        Image("액자에_추억을_담아보자").padding(.top, -89)
                                        HStack {
                                            modalImageFunc(title: "사진_찍기")
                                                .onTapGesture {
                                                    isShowingCamera = true
                                                    showCamera = true
                                                    isClicked = false
                                                }
                                            modalImageFunc(title: "앨범에서_고르기")
                                                .onTapGesture {
                                                    showImagePicker = true
                                                    isClicked = false
                                                }
                                        }.padding(.top, -18)
                                    }
                                    .onAppear(perform: {
                                        SoundManager.instance.playTts(sound: .frame)
                                    })
                                }.padding(.top, -18)
                            }
                        }
                        Spacer()
                    }.padding(.top, 54)
                    
                }
            }
            .fullScreenCover(isPresented: $isShowingCamera, onDismiss: loadImage) {
                ImagePicker(sourceType: .camera, selectedImage: $selectedImage)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
            }
            
            .fullScreenCover(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedImage)
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
                UserDefaultsManager.shared.profile = selectedImage
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
