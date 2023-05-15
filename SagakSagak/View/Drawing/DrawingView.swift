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
    
    @State private var isSaved : Bool = false
    @EnvironmentObject private var coordinator: Coordinator

    var imageView: some View {
        Text("Hello, SwiftUI")
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
    
    var body: some View {
        ZStack {
            Image("background").padding(.top, 20)

            ZStack{
                //버튼으로 바꾸기
                HStack(alignment: .center) {
                    VStack{
                        ForEach(crayonColors1, id: \.id) { crayon in
                            Button(action: {
                                selectedWidth = 5
                                selectedColor = crayon.color
                                selectedCrayon = crayon.id
                            }, label: {
                                Image(crayon.image)
                                    .offset(x: selectedCrayon == crayon.id ? 0 : -20, y:0)
                                    .animation(.spring(), value: selectedCrayon)
                            }
                            )
                        }
                    }
                        // MARK: Canvas
                        canvas
                    
                    VStack {
                        //MARK: 화면 전환
                        ForEach(crayonColors2, id: \.0) { crayon in
                            Button(action: {
                                selectedWidth = 5
                                selectedColor = crayon.color
                                selectedCrayon = crayon.id
                            }, label: {
                                Image(crayon.image)
                                    .offset(x: selectedCrayon == crayon.id ? 0 : 20, y:0)
                                    .animation(.spring(), value: selectedCrayon)
                            })
                        }
                        Button(action: {
                            selectedWidth = 20
                            selectedColor = .white
                            selectedCrayon = 0
                        }) {
                            Image("eraser")
                                .offset(x: selectedWidth == 20 ? 0 : 20, y: 0)
                                .animation(.spring(), value: selectedWidth)
                                .padding(.bottom, 3)
                                .padding(.trailing, 24)
                        }

                    }
                    .navigationBarBackButtonHidden(true)
                }.padding(.top, 90)
                
                ZStack {
                    ZStack {
                        GLNavBarItem(
                            backPage: .letter, backButtonImg: "button_back", shadowOn: true, navBarTitle: "가람이에게 가장 소중한 것을 그려보자", navBarBgColor: Color(hex: "FFFFFF"), navBarFontColor: Color(hex: "5E9BF0"), nextButtonImg: "button_next", nextPage: .character1, nextEnabled: isDrawing ? true : false)
                        Image("button_exit")
                            .padding(.leading, 750)
                            .onTapGesture {
                                coordinator.push(.main)
                            }
                    }.padding(.bottom, 280)
                    
                    if !isSaved {
                        Button {
                            let image = canvas.snapshot()
                            UserDefaultsManager.shared.snapShot = image
                            isSaved = true
                        } label: {
                            Rectangle()
                                .frame(width: 50, height: 50).foregroundColor(.yellow).padding([.top, .leading], 10).opacity(0)
                        }.offset(x:250, y:-145)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bg2)
        .ignoresSafeArea()
    }
    
    var canvas: some View {
        Canvas{ context, size in
            for line in lines {
                var path = Path()
                path.addLines(line.points)
                
                context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
            }
        }.frame(width: 580, height: 280)
            .background(Color.white)
            .cornerRadius(40)
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
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}



//extension View{
//    func snapshot() -> UIImage{
//        let controller = UIHostingController(rootView: self.edgesIgnoringSafeArea(.all))
//        let view = controller.view
//        
//        let targetSize = controller.view.intrinsicContentSize
//        
//        view?.bounds = CGRect(origin: .zero, size: targetSize)
//        view?.backgroundColor = .clear
//        
//        let renderer = UIGraphicsImageRenderer(size: targetSize)
//        
//        return renderer.image { _ in
//            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
//        }
//    }
//}
