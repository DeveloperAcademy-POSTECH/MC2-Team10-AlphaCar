//
//  MainView.swift
//  SagakSagak
//
//  Created by 신정연 on 2023/05/10.
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

struct Time{
    var min: Int
    var hour : Int
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
    
    @State var attempts: Int = 0
    @State private var isWatchClicked = false
    @StateObject private var snapshotImage = SnapshotImage()
    
    //time related
    @State var receiver = Timer.publish(every: 0.5, on: .current, in: .default).autoconnect()
    @State var currentTime = Time(min: 0, hour : 0)
    
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
    
    private let soundManager = SoundManager.instance
    
    var body: some View {
        ZStack {
            Image("sky" +
                  (Theme.current == .day ? "_night" : "_day"))
            .resizable()
            .offset(x: 0, y: -120)
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
            
            if(!isLampOn){
                Image("default" + (Theme.current == .day ? "_night" : "_day"))
                    .offset(x: 334, y: -100)
            }
            else{
                Image("default")
                    .offset(x: 334, y: -100)
            }
            
            ZStack {
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
                    soundManager.playSound(sound: .clock)
                    isWatchClicked.toggle()
                }) {
                    ZStack{
                        if (isLampOn){
                            Image("clock" +
                                  (Theme.current == .day ? "_moon" : "_sun"))
                            .onTapGesture {
                                withAnimation(.default) {
                                    self.attempts += 1
                                }
                            }
                            .modifier(Shake(animatableData: CGFloat(attempts)))
                        }
                        else{
                            Image("clock_off" +
                                  (Theme.current == .day ? "_moon" : "_sun"))
                            .onTapGesture {
                                withAnimation(.default) {
                                    self.attempts += 1
                                }
                            }
                            .modifier(Shake(animatableData: CGFloat(attempts)))
                        }
                        
                        VStack{
                            Text(String(format: "%02d:%02d", self.currentTime.hour, self.currentTime.min))
                                .foregroundColor(.clock2)
                                .font(FontManager.shared.nanumsquare(.extrabold, 24))
                        }
                        .offset(x: 14, y: 2.5)
                        .onAppear(perform: {
                            let calendar = Calendar.current
                            
                            let min = calendar.component(.minute, from: Date())
                            let hour = calendar.component(.hour, from: Date())
                            
                            withAnimation(Animation.linear(duration: 0.01)){
                                self.currentTime = Time(min: min, hour: hour)
                            }
                        })
                        .onReceive(receiver){ (_) in
                            let calendar = Calendar.current
                            
                            let min = calendar.component(.minute, from: Date())
                            let hour = calendar.component(.hour, from: Date())
                            
                            withAnimation(Animation.linear(duration: 0.01)){
                                self.currentTime = Time(min: min, hour: hour)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.default) {
                                self.attempts += 1
                            }
                        }
                        .modifier(Shake(animatableData: CGFloat(attempts)))
                    }
                }
                .offset(x: 334, y: 25)
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    isframe.toggle()
                }) {
                    if (!isLampOn){
                        SwingAnimation(imgName: "frame" +
                                       (Theme.current == .day ? "_night" : "_day"))
                        .onTapGesture {
                            isframe = true
                        }
                    }
                    else{
                        SwingAnimation(imgName: "frame")
                            .onTapGesture {
                                isframe = true
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
                   coordinator.push(.letter)
                  //  coordinator.push(.emotion)
//                    coordinator.push(.end2)
                    
                    //
                    //                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    //                        self.isLetter = true
                    //
                    //                    }
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
                .sheet(isPresented: $isLetter) {
                    DrawingView()
                    // 추후에 변경되어야 합니다 !
                }
                
                //각 버튼에 따라 modal view 뜨는 부분
                if (isframe){
                    ToCameraView()//사진 모달
                }
                if(isprofile){
                    MainView()//프로필 화면
                }
                if(isArchive){
                    ArchiveView()
                }
                //                if(isSkyTapped){
                //                    MainView()//날씨 모달
                //                }
            }
            .onAppear(perform: {
                let calendar = Calendar.current
                
                let min = calendar.component(.minute, from: Date())
                let hour = calendar.component(.hour, from: Date())
                
                withAnimation(Animation.linear(duration: 0.01)){
                    self.currentTime = Time(min: min, hour: hour)
                }
            })
            .onReceive(receiver){ (_) in
                let calendar = Calendar.current
                
                let min = calendar.component(.minute, from: Date())
                let hour = calendar.component(.hour, from: Date())
                
                withAnimation(Animation.linear(duration: 0.01)){
                    self.currentTime = Time(min: min, hour: hour)
                }
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarBackButtonHidden(true)
        
    }
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

extension DateFormatter {
    static let timeOnlyFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
