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
    let backButtonImage: String ///뒤로 가기 버튼 이미지명
    let forwardButtonImage: String /// 앞으로 가기 버튼 이미지명
    
    var body: some View {
        HStack{
            Spacer()
                .frame(width:24)
            Button{
                print("Back")
            }label:{
                Image(backButtonImage)
            }
            
            Spacer()
            
            Button{
                print("Forward")
            }label:{
                Image(forwardButtonImage)
            }
        }
    }
}

//struct GLButtonSet_Previews: PreviewProvider {
//    static var previews: some View {
//        GLButtonSet()
//    }
//}
