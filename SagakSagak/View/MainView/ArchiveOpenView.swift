//
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
                GLNavBarItem(backPage: .draw, backButtonImg: "button_back", shadowOn: true, navBarTitle: title + "의 이야기", navBarBgColor: Color(hex: "FFFFFF"), navBarFontColor: .blue, nextButtonImg: "button_next", nextPage: .character2, nextEnabled: false)
                    .onAppear {
                        self.title = self.dateFormatter.string(from: Date())
                    }
                Image(weather)
                    .resizable()
                    .frame(width: 36, height: 36)
                    .offset(x:195, y: 0)
                
                Image("button_exit")
                    .padding(.leading, 750)
                    .onTapGesture {
                        coordinator.popToRoot()
                        soundManager.playSound(sound: .exit)
                    }
            }.padding(.bottom, 300)
            
            ZStack{
                Image("archive_open")
                    .offset(y:50)
                HStack{
                    VStack{
                        if let image = UserDefaultsManager.shared.snapShot {
                            ZStack{
                                Text("나에게 가장 소중한 것은")
                                    .font(FontManager.shared.nanumsquare(.bold, 16))
                                    .padding(.top, -70)
                                
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 300, height: 150)
                                    .padding(.top, 90)
                                    .foregroundColor(.yellow)
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(hex: "D6E7FF"))
                                    .frame(width: 300, height:150)
                                    .foregroundColor(.white)
                                    .padding(.top, 90)
                            }
                        } else {
                            Text("Snapshot image is not available.")
                        }
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    
                    VStack {
                        HStack {
                            Text("소중한 것을 떠올리면")
                                .font(FontManager.shared.nanumsquare(.bold, 16))
                            
                            Image("faceBgImage")
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
                        }
                        HStack{
                            Text("이 표정의 이름은")
                                .font(FontManager.shared.nanumsquare(.bold, 16))
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.block_bg2)
                                    .frame(width: 50, height: 30)
                                    .mask(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.yellow.opacity(0.5)) ///color
                                    .innerShadow(color: Color(hex: "006AFF"), radius: 10))
                                Text(UserDefaultsManager.shared.feel ?? "사랑")
                                    .font(FontManager.shared.nanumsquare(.extrabold, 12))
                                    .foregroundColor(Color.block_bg3)
                            }
                            Text("이야")
                                .font(FontManager.shared.nanumsquare(.bold, 16))
                        }
                    }
                    .padding(.trailing, 30)
                    .padding(.leading, 30)
                    
                }
                .padding(.top, 65)
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
