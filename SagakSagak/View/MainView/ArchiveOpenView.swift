//
//  ArchiveOpenView.swift
//  SagakSagak
//
//  Created by 신정연 on 2023/05/12.
//

import SwiftUI


struct ArchiveOpenView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    @State private var isActive: Bool = false
    @State private var title = ""
    @State private var isShowingFirstText = true
    
    let weather: String = "맑음"
    
    var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy년 MM월 dd일"
            return formatter
        }
    
    let timer = Timer.publish(every: 0.8, on: .main, in: .common).autoconnect()
        
    var body: some View {
        ZStack {
            Image("background_archive")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 250/255, green: 248/255, blue: 229/255))
            ZStack {
                GLNavBarTitle(navBarTitle: title, navBarBgColor: .white, navBarFontColor: .blue)
                    .offset(x: 0, y: -140)
                    .font(FontManager.shared.nanumsquare(.extrabold, 18))
                    .onAppear {
                        self.title = self.dateFormatter.string(from: Date())
                    }
                    .onReceive(timer) { _ in
                        self.isShowingFirstText.toggle()
                        if self.isShowingFirstText {
                            self.title = self.dateFormatter.string(from: Date()) + "의 이야기"
                        } else {
                            self.title = "날씨는 \(self.weather)"
                        }
                    }
                
                Button(action: {
                    isActive = true
                    
                }) {
                    Image("archive_open")
                }
                .offset(x: 0, y: 50)
                
//                .sheet(isPresented: $isActive) {
//                    MainView()
//                }
                HStack{
                    VStack{
                        Text("나에게 가장 소중한 것은")
                            .font(FontManager.shared.nanumsquare(.bold, 16))
                        Image("letter")
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 75)
                    
                    VStack{
                        Text("소중한 것을 떠올리면")
                            .font(FontManager.shared.nanumsquare(.bold, 16))
                            .padding(.top, 50)
                        HStack{
                            Image("profile")
                            Text("표정이 돼.")
                                .font(FontManager.shared.nanumsquare(.bold, 16))
                        }
                        HStack{
                            Text("이 표정의 이름은 ")
                                .font(FontManager.shared.nanumsquare(.bold, 16))
                            Image("profile")
                            Text("이야.")
                                .font(FontManager.shared.nanumsquare(.bold, 16))
                        }
                    }
                    .padding(.leading, 75)
                    
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
