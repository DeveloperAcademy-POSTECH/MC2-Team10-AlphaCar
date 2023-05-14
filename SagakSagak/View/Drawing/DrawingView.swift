//
//  DrawingView.swift
//  SagakSagak
//
//  Created by 신정연 on 2023/05/08.
//

import SwiftUI
import ComposableArchitecture

let crayonColors1: [(image: String, color: Color, id: Int)] = [
    ("redcrayon", Color.red, 1),
    ("orangecrayon", Color.orange, 2),
    ("yellowcrayon", Color.yellow, 3),
    ("greencrayon", Color.green, 4),
    ("bluecrayon", Color.blue, 5),
    ("purplecrayon", Color.purple, 6)
]

let crayonColors2: [(image: String, color: Color, id: Int)] = [
    ("pinkcrayon", Color.crayon7, 7),
    ("browncrayon", Color.crayon8, 8),
    ("graycrayon", Color.crayon9, 9),
    ("blackcrayon", Color.crayon10, 10),
]

class SnapshotImage: ObservableObject {
    @Published var image: UIImage?
}

struct DrawingView: View {
    @State private var lines = [Line]()
    @State private var selectedColor : Color = .black
    @State var selectedCrayon: Int = 10
    @State private var selectedWidth : CGFloat = 5
    @State private var isDrawing : Bool = false
    @State private var isRedTapped : Bool = false
    @State private var isOrangeTapped : Bool = false
    @EnvironmentObject private var coordinator: Coordinator
    
    @State private var isNextBtnClicked : Bool = false
    @State private var isExitBtnClicked : Bool = false
    @EnvironmentObject private var snapshotImage: SnapshotImage
    
    func takeSnapshot() {
        let snapshot = snapshot()
        snapshotImage.image = snapshot
        
        UserDefaultsManager.shared.snapShot = snapshot
    }
    
    func snapshot() -> UIImage {
            let canvasSize = CGSize(width: 650, height: 280)
            let canvasView = Canvas { context, size in
                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                }
            }
            .frame(width: canvasSize.width, height: canvasSize.height)
            .background(Color.white)
            .cornerRadius(50)
            
            let controller = UIHostingController(rootView: canvasView)
            let view = controller.view
            
            view?.bounds = CGRect(origin: .zero, size: canvasSize)
            view?.backgroundColor = .clear
            
            let renderer = UIGraphicsImageRenderer(size: canvasSize)
            
            return renderer.image { _ in
                view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
            }
        }
    
    var body: some View {
        if !isNextBtnClicked && !isExitBtnClicked {
            ZStack {
                Image("background")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ZStack{
                    ZStack{
                        GLButtonSet(nextpage: .character1, backButtonImage: "button_back", forwardButtonImage: isDrawing ? "button_next" : "button_next_enabled")
                    }.onTapGesture {
                        if isDrawing {
                            isNextBtnClicked = true
                        }
                        takeSnapshot()
                    }
                    .padding(.horizontal, 47)
                    .padding(.bottom, -4)
                    .navigationBarBackButtonHidden(true)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                }
                
                VStack{
                    //버튼으로 바꾸기
                    HStack {
                        VStack{
                            Spacer(minLength: 100)
                            ForEach(crayonColors1, id: \.id) { crayon in
                                Button(action: {
                                    selectedWidth = 5
                                    selectedColor = crayon.color
                                    selectedCrayon = crayon.id
                                }, label: {
                                    Image(crayon.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 108, height: 28)
                                        .padding(.bottom, 3)
                                        .padding(.trailing, 30)
                                        .offset(x: selectedCrayon == crayon.id ? 20 : 0, y:-10)
                                        .animation(.spring(), value: selectedCrayon)
                                })
                            }
                            Image("")
                                .resizable()
                                .frame(width: 48, height: 48)
                            //                            .padding(.top, 9)
                                .padding(.leading, 24)
                                .padding(.bottom, 24)
                        }
                        .padding(.trailing, 24)
                        VStack {
                            Text("가람이에게 가장 소중한 것을 그려보자!")
                                .font(FontManager.shared.nanumsquare(.extrabold, 18))
                                .frame(width: 300)
                                .foregroundColor(.system1)
                                .padding(.horizontal, 80)
                                .padding(.vertical, 15)
                                .background(Color.white)
                                .cornerRadius(90)
                                .padding(.bottom, 10)
                                .padding(.top, 10)
                            Canvas{ context, size in
                                for line in lines {
                                    var path = Path()
                                    path.addLines(line.points)
                                    
                                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                                }
                            }.frame(width: 600, height: 280)
                                .background(Color.white)
                                .cornerRadius(50)
                                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
                                    isDrawing = true
                                    let newPoint = value.location
                                    //newPoint : 그림 그리는 다음 위치
                                    /*
                                     새로운 라인의 객체
                                     value.translation: 사용자의 터치 이동 거리(이전~이후)
                                     -> 이게 0이면, 새로운 터치를 시작했다는 의미!
                                     */
                                    if value.translation.width + value.translation.height == 0{
                                        lines.append(Line(points: [newPoint], color: selectedColor, lineWidth: selectedWidth))
                                    }
                                    /*
                                     0이 아니면 "이어서 그림"을 의미!
                                     이전 터치의 index를 찾아서,newPoint를 이전에 추가합니다!
                                     */
                                    else{
                                        let index = lines.count - 1
                                        lines[index].points.append(newPoint)
                                    }
                                }))
                        }
                        
                        VStack() {
                            Image("button_exit")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 48, height: 48)
                            //                            .padding(.bottom, 9)
                                .padding(.trailing, 48)
                                .padding(.top, 24)
                                .onTapGesture {
                                    isExitBtnClicked = true
                                }
                            
                            //MARK: 화면 전환
//                            Button("화면"){
//                                coordinator.push(.character1)
//                            }
                            
                            ForEach(crayonColors2, id: \.0) { crayon in
                                Button(action: {
                                    selectedWidth = 5
                                    selectedColor = crayon.color
                                    selectedCrayon = crayon.id
                                }, label: {
                                    Image(crayon.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 108, height: 28)
                                        .padding(.bottom, 3)
                                        .padding(.leading, 30)
                                        .offset(x: selectedCrayon == crayon.id ? -20 : 0, y:-10)
                                        .animation(.spring(), value: selectedCrayon)
                                })
                            }
                            Button(action: {
                                selectedWidth = 20
                                selectedColor = .white
                                selectedCrayon = 0
                            }) {
                                Image("eraser")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 108, height: 68)
                                    .offset(x: selectedWidth == 20 ? -21 : 0, y: 0)
                                    .animation(.spring(), value: selectedWidth)
                                    .padding(.bottom, 3)
                                    .padding(.trailing, 24)
                            }
                            
                        }
                        .navigationBarBackButtonHidden(true)
                        .padding(.leading, 24)
                        // .layoutPriority(0)
                    }
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.bg2)
            .ignoresSafeArea()
            
        } else if isExitBtnClicked {
            MainView()
        } else {
            CharacterView1()
//            StoryView1().environmentObject(snapshotImage)
        }
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
