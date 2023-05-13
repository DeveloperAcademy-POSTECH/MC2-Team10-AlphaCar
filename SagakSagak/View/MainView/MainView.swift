//
//  MainView.swift
//  SagakSagak
//
//  Created by 신정연 on 2023/05/10.
//

import SwiftUI

struct MainButton{
    let imageName: String
    let offset_x: CGFloat
    let offset_y: CGFloat
}

enum Theme : String {
    
    case day
    case night
    
    static let dayRange = 0..<18
    static let nightRange = 18..<24
    //    static let nightRange = (0..<6) + (18..<24)
    //    static let nightRange = (0..<6).joined(with: 18..<24)
    static var current : Theme{
        let hour = Calendar.current.component(.hour, from: Date())
        if Theme.dayRange.contains(hour) || Theme.nightRange.contains(hour) {
            return hour >= 6 && hour < 18 ? .night : .day
        }
        return .day // 기본값은 day로 설정
    }
}
enum ButtonStyle: String, Identifiable{
    case archive
    case lamp
    case frame
    case clock
    case letter
    
    var id : UUID{
        UUID()
    }
    
    var imageName: String{
        switch Theme.current {
        case .day:
            switch self {
            case .archive: return "archive_day"
            case .lamp: return "lamp_day"
            case .frame: return "frame_day"
            case .clock: return "clock_day"
            case .letter: return "letter_day"
            }
        case .night:
            switch self {
            case .archive: return "archive_night"
            case .lamp: return "lamp_night"
            case .frame: return "frame_night"
            case .clock: return "clock_night"
            case .letter: return "letter_night"
            }
        }
    }
}

let buttons: [ButtonStyle] = [.archive, .clock, .frame, .lamp, .letter]

struct MainView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    //time related
    @State var receiver = Timer.publish(every: 1, on: .current, in: .default)
        .autoconnect()
    @State private var currentTime : Date = Date.now
    //    @State var hour = currentHour
    
    //button related
    @State private var isActive = false
    @State private var isAnimating = false
    @State private var isLampOn = true
    @State private var isCurtainOn = false
    
    //modal view related
    @State private var isLetter = false
    @State private var isframe = false
    @State private var isprofile = false
    @State private var isArchive = false
    @State private var isSkyTapped = false
    
    @State private var onAlbumClicked = false
    @State private var onLetterClicked = false
    
    @State private var isWatchClicked = false
    @State var attempts: Int = 0
    
    @StateObject private var snapshotImage = SnapshotImage()
    
    private let soundManager = SoundManager.instance
    
    var body: some View {
        if !onAlbumClicked && !onLetterClicked {
            ZStack {
                Image("sky" +
                      (Theme.current == .day ? "_night" : "_day"))
                .resizable()
                .offset(x: 0, y: -120)
                
                ZStack {
                    if(!isLampOn){
                        if(!isCurtainOn){
                            Image("background1" +
                                  (Theme.current == .day ? "_night" : "_day"))
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                        else{
                            Image("background2" +
                                  (Theme.current == .day ? "_night" : "_day"))
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                    else{
                        Image("background_on")
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    Button(action: {
                        isprofile.toggle()
                    }) {
                        Image("profile")
                    }
                    .offset(x: -377.5, y: -148.4)
                    .shadow(color: Color(red: 38/255, green: 119/255, blue: 95/255).opacity(0.3), radius: 15, x: 0, y: -4)
                    
                    Button(action: {
                        soundManager.playSound(sound: .curtain)
                        isCurtainOn.toggle()
                        print("curtain")
                    }) {
                        if(!isCurtainOn){
                            if (isLampOn == false){
                                Image("curtain_closed" +
                                      (Theme.current == .day ? "_night" : "_day"))
                            }
                            else{
                                Image("curtain_closed")
                            }
                        }
                        else{
                            if (isLampOn == false){
                                Image("curtain_opened" +
                                      (Theme.current == .day ? "_night" : "_day"))
                                //                            Image("curtaintmp")
                            }
                            else{
                                Image("curtain_opened")
                                //                            Image("curtaintmp")
                            }
                        }
                    }
                    .offset(x: 0, y: -120)
                    
                    Button(action: {
                        soundManager.playSound(sound: .button)
                        isLampOn.toggle()
                    }) {
                        if (isLampOn == false){
                            Image("lamp" +
                                  (Theme.current == .day ? "_night" : "_day"))
                        }
                        else{
                            Image("lamp")
                        }
                        
                    }
                    .offset(x: -310, y: -47)
                    
                    Button(action: {
                        isAnimating = true
                        isWatchClicked.toggle()
                        soundManager.playSound(sound: .clock)
                    }) {
                        ZStack{
                            if (isLampOn){
                                Image("clock" + (Theme.current == .day ? "_moon" : "_sun"))
                                    .onTapGesture {
                                        withAnimation(.default) {
                                            self.attempts += 1
                                        }
                                    }
                                    .modifier(Shake(animatableData: CGFloat(attempts)))
                            }
                            else{
                                Image("clock_off" + (Theme.current == .day ? "_moon" : "_sun"))
                                    .onTapGesture {
                                        withAnimation(.default) {
                                            self.attempts += 1
                                        }
                                    }
                                    .modifier(Shake(animatableData: CGFloat(attempts)))
                            }
                            Text(Date(), formatter: DateFormatter.timeOnlyFormatter)
                                .offset(x: 14, y: 2.5)
                                .onTapGesture {
                                    withAnimation(.default) {
                                        self.attempts += 1
                                    }
                                }
                                .modifier(Shake(animatableData: CGFloat(attempts)))
                                .onReceive(Timer.publish(every: 1, on: .current, in: .default).autoconnect()) { time in
                                    currentTime = time
                                }
                                .font(FontManager.shared.nanumsquare(.extrabold, 24))
                                .foregroundColor(.clock2)
                        }
                    }
                    .offset(x: 334, y: 25)
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                        isframe.toggle()
                    }) {
                        if (!isLampOn){
                            SwingAnimation(imgName: "frame_night")
                                .onTapGesture {
                                    onAlbumClicked = true
                                }
//                            Image("frame" + (Theme.current == .day ? "_night" : "_day"))
                        }
                        else{
                            SwingAnimation(imgName: "frame")
                                .onTapGesture {
                                    onAlbumClicked = true
                                }
                        }
                    }
                    .offset(x: 334, y: -107.5)
                    
                    Button(action: {
                        isArchive.toggle()
                    }) {
                        if(!isLampOn){
                            Image("archive" +
                                  (Theme.current == .day ? "_night" : "_day"))
                        }
                        else{
                            Image("archive")
                        }
                    }
                    .offset(x: -224, y: 97)
                    
                    Button(action: {
//                        coordinator.push(.letter)
                        onLetterClicked = true
                    }) {
                        if(!isLetter){
                            if(!isLampOn){
                                Image("letter" +
                                      (Theme.current == .day ? "_night" : "_day"))
                            }
                            else{
                                Image("letter")
                            }
                        }
                        else{
                            if(!isLampOn){
                                Image("letter_open" +
                                      (Theme.current == .day ? "_night" : "_day"))
                            }
                            else{
                                Image("letter_open")
                            }
                        }
                    }
                    .offset(x: 0, y: 97)
//                    .sheet(isPresented: $isLetter) {
//                        DrawingView()
//                    }
                    
                    //각 버튼에 따라 modal view 뜨는 부분
                    //                if (isframe){
                    //                    MainView()//사진 모달
                    //                }
                    //                if(isprofile){
                    //                    MainView()//프로필 화면
                    //                }
                    if(isArchive){
                        //                    ArchiveView()
                    }
                    //                if(isSkyTapped){
                    //                    MainView()//날씨 모달
                    //                }
                }
                .onReceive(receiver) { time in
                    currentTime = time
                }
            }
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarBackButtonHidden(true)
        }else if onAlbumClicked{
            ToCameraView()
        }else {
            LetterView().environmentObject(snapshotImage)
        }
    }
}

extension DateFormatter {
    static let timeOnlyFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
}

struct Shake: GeometryEffect {
    var amount: CGFloat = 5
    var shakesPerUnit = 3
    var jumpHeight: CGFloat = 10
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(
                translationX: amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)) ,
                y: -abs(sin(animatableData * .pi)) * jumpHeight
            )
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
