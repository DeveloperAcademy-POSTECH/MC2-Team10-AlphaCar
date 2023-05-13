//
//  ArchiveOpenView.swift
//  SagakSagak
//
//  Created by 신정연 on 2023/05/12.
//

import SwiftUI

struct ArchiveOpenView: View {
    
    @State private var isActive : Bool = false
    @State private var textIndex = 0
    @State private var timer: Timer?
    private let texts = ["2023년 5월 12일의 이야기", "날씨는 맑음"]
    
    var body: some View {
        ZStack {
            Image("background_archive")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 250/255, green: 248/255, blue: 229/255))
            ZStack{
                VStack{
                    GLNavBarTitleView(navBarTitle: texts[textIndex], navBarBgColor: .white, navBarFontColor: .blue)
                        .offset(x: 0, y: -140)
                        .onAppear() {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                timer?.invalidate()
                            }
                        }
                    //                    .onAppear() {
                    //                        self.timer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { timer in
                    //                            self.textIndex = (self.textIndex + 1) % self.texts.count
                    //                        }
                    //                    }
                }
//                .onReceive(timer) { _ in
//                    self.textIndex = (self.textIndex + 1) % self.texts.count
//                }
                Button(action: {
                    isActive = true
                }) {
                    Image("archive_open")
                }
                .offset(x: 0, y: 50)
                .sheet(isPresented: $isActive) {
                    MainView()
                }
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
}
struct ArchiveOpenView_Previews: PreviewProvider {
    static var previews: some View {
        ArchiveOpenView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
