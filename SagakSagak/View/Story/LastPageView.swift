//
//  LastPageVIew.swift
//  SagakSagak
//
//  Created by 채영민 on 2023/05/13.
//

import SwiftUI

struct LastPageVIew: View {
    @EnvironmentObject private var snapshotImage: SnapshotImage

    var body: some View {
        ZStack {
            Image("Group 10226").padding(.top,20)
            Rectangle().foregroundColor(Color(hex: "D5F0E7").opacity(0.5)).ignoresSafeArea()
    
            ZStack {
                if let snapshot = snapshotImage.image {
                    Image("letterBody")
                    VStack{
                        Image("오늘의_이야기").padding(.top,10)
                        Image("나에게 가장 소중한 것은").padding(.vertical,20).padding(.top,-10)
                    }.padding(.bottom,200)
                    ZStack{
                        Image("imageBody")
                        Image(uiImage: snapshot).resizable().scaledToFit().frame(width:450,height:450)
                            .offset(x:-15,y:0)
                    }.padding(.top,90)
                } else {
                    Text("Snapshot image not available.")
                }
            }
        }
        
    }
}

struct LastPageVIew_Previews: PreviewProvider {
    static var previews: some View {
        LastPageVIew().previewInterfaceOrientation(.landscapeRight)
    }
}
