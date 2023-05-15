//
//  GLButtonSet.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/13.
//

import SwiftUI

//enum buttonState{
//    case disabled
//    case enabled
//}

struct GLButtonSet: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var snapshotImage: SnapshotImage
    
    let nextpage: Page ///이동하려는 페이지
    let backButtonImage: String ///뒤로 가기 버튼 이미지명
    let forwardButtonImage: String /// 앞으로 가기 버튼 이미지명
    
    var body: some View {
        HStack{
            Spacer()
                .frame(width:24)
            Button{
                coordinator.pop()
            }label:{
                Image(backButtonImage)
            }
            
            Spacer()
            
            Button{
                coordinator.push(nextpage)
            }label:{
                Image(forwardButtonImage)
            Spacer()
                .frame(width:24)
            }
            
        }
        .padding(.bottom, 18)
    }
}

//struct GLButtonSet_Previews: PreviewProvider {
//    static var previews: some View {
//        GLButtonSet()
//    }
//}
