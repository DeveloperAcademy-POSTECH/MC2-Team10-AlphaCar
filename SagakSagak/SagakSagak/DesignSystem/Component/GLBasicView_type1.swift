//
//  GLBasicView_type1.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/14.
//

import SwiftUI

struct GLBasicView_type1: View {
    let navBarTitle: String
    let navBarBgColor: Color
    let navBarFontcolor: Color
    
    var body: some View {
            ZStack {
                Image("background")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                GeometryReader { geometry in
    
                    GLNavBarItem(navBarTitle: navBarTitle, navBarBgColor: navBarBgColor, navBarFontColor: navBarFontcolor)
               
                VStack{

                    //TODO: viewBuilder 통해 해당 뷰들이 여기 들어가도록 짜기 
                    
                    Rectangle()
                        .frame(height:88)
                        .overlay{
                            GLBlockView()
                        }
                        .foregroundColor(.white)
                    
                    }
                    .navigationBarBackButtonHidden(true)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .padding(.bottom, geometry.safeAreaInsets.bottom)
                }
            }
            .background(Color.bg2)
            .ignoresSafeArea()
        }
    
}

//struct GLBasicView_type1_Previews: PreviewProvider {
//    static var previews: some View {
//        GLBasicView_type1(navBarTitle: <#String#>, navBarBgColor: <#Color#>, navBarFontcolor: <#Color#>)
//    }
//}
