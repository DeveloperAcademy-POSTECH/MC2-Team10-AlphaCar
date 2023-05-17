//  ArchiveOpenView.swift
//  SagakSagak
//
//  Created by 신정연 on 2023/05/12.
//

import SwiftUI


struct ArchiveOpenView: View {
    
    @AppStorage(UserDefaultKey.snapShot.rawValue) var snapShotData: Data?
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var emotionFace: EmotionFace
    
    @State private var isActive: Bool = false
    @State private var title = ""
    
    @State var weather: String = "snowy"
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        return formatter
    }
    
    let timer = Timer.publish(every: 0.8, on: .main, in: .common).autoconnect()
    
    private let soundManager = SoundManager.instance
    
    var body: some View {
        ZStack {
            Image("background_archive")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 250/255, green: 248/255, blue: 229/255))
            ZStack {
                if let image = UserDefaultsManager.shared.snapShot {

                    GLNavBarItem(backPage: .main, backButtonImg: "button_back", backEnabled: true, shadowOn: true, navBarTitle: title + "의 이야기", navBarBgColor: Color(hex: "FFFFFF"), navBarFontColor: .blue, nextButtonImg: "button_next", nextPage: .character2, nextEnabled: false)
                        .onAppear {
                            self.title = self.dateFormatter.string(from: Date())
                        }
                }
                else{
                    GLNavBarItem(backPage: .main, backButtonImg: "button_back", backEnabled: true, shadowOn: true, navBarTitle: title + "의 이야기", navBarBgColor: Color(hex: "FFFFFF"), navBarFontColor: .blue, nextButtonImg: "button_next", nextPage: .character2, nextEnabled: false)
                        .onAppear {
                            self.title = self.dateFormatter.string(from: Date())
                        }
                }
                
                Image(weather)
                    .resizable()
                    .frame(width: 36, height: 36)
                    .offset(x:195, y: 0)
            
                Image("button_exit")
                    .padding(.leading, 750)
                    .onTapGesture {
//                        coordinator.push(.main)
                        
                        coordinator.popToRoot()
                        soundManager.playSound(sound: .exit)
                    }
            }.padding(.bottom, 300)
            
            ZStack{
                Image("archive_open")
                    .offset(y:50)
                if let image = UserDefaultsManager.shared.snapShot {
                    HStack{
                        VStack{
                            ZStack{
                                Text("나에게 가장 소중한 것은")
                                    .font(FontManager.shared.nanumsquare(.bold, 16))
                                    .padding(.top, -70)
                                
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 300, height: 150)
                                    .cornerRadius(20)
                                    .padding(.top, 90)
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(hex: "D6E7FF"))
                                    .frame(width: 300, height:150)
                                    .foregroundColor(.white)
                                    .padding(.top, 90)
                            }
                        }
                        .padding(.leading, 35)
                        .padding(.trailing, 30)
                        
                        ZStack{
                            VStack(alignment: .center) {
                                HStack {
                                    Text("소중한 것을 떠올리면")
                                        .font(FontManager.shared.nanumsquare(.bold, 16))
                                    
                                    Image("faceBlock")
                                        .resizable()
                                        .frame(width: 50, height: 30)
                                        .overlay {
                                            Image(UserDefaultsManager.shared.faceImage ?? "twinkle")
                                                .resizable()
                                                .frame(width: 35, height: 13)
                                                .shadow(color: Color(.systemBlue).opacity(0.3), radius: 10, x: 0, y: -4)
                                        }
                                    Text("한 표정이 돼.")
                                        .font(FontManager.shared.nanumsquare(.bold, 16))
                                }.padding(.top, -17)
                                HStack{
                                    Text("이 표정의 이름은")
                                        .font(FontManager.shared.nanumsquare(.bold, 16))
                                    
                                    Text(UserDefaultsManager.shared.feel ?? "사랑")
                                        .font(FontManager.shared.nanumsquare(.extrabold, 12))
                                        .foregroundColor(Color.system2)
                                        .frame(width: 50, height: 30)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color(.white).opacity(0.1), lineWidth: 6)
                                                .shadow(color: Color(hex: "579DFF"),
                                                        radius: 5, x: 0, y: -4)
                                                .padding(-6)

                                        )
                                        .background(Color(hex: "89BAFF"))
                                        .cornerRadius(10)
                                        .foregroundColor(.black)
                                    
//                                    ZStack{
//                                        RoundedRectangle(cornerRadius: 10)
//                                            .fill(Color.block_bg2)
//                                            .frame(width: 50, height: 30)
//                                            .mask(RoundedRectangle(cornerRadius: 10)
//                                                .fill(Color.yellow.opacity(0.5)) ///color
//                                                .innerShadow(color: Color(hex: "006AFF"), radius: 10))
//                                        Text(UserDefaultsManager.shared.feel ?? "사랑")
//                                            .font(FontManager.shared.nanumsquare(.extrabold, 12))
//                                            .foregroundColor(Color.block_bg3)
//                                    }
                                    Text("이야")
                                        .font(FontManager.shared.nanumsquare(.bold, 16))
                                }.padding(.top, 10).offset(y:-5)
                                
                            }
                            .padding(.top, 30)
                            .padding(.trailing, 30)
                            .padding(.leading, 30)
                            
                            
                        LottieView(jsonName: "stamp_archieve_rotated", delay: 0.5)
                                .frame(width: 130, height: 130)
                                .offset(x:80, y:105)

                        }
                        
                    }
                    .padding(.top, 55)
                }
                else{
                    VStack{
                        Spacer()
                        Image("noArchive")
                            .resizable()
                            .frame(width: 600, height: 270)
                            
                    }
                }
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear(perform: {
            SoundManager.instance.playBackgroundMusic(sound: .archive)
        })
    }
    
}
struct ArchiveOpenView_Previews: PreviewProvider {
    static var previews: some View {
        ArchiveOpenView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

