//
//  SwingAnimation.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/14.
//

import SwiftUI

enum RotationState: Int {
    case max
    case min
    case done
}


struct SwingAnimation: View {
    @State var imgName: String
    @State var isDark: Bool
    @State private var state: RotationState = .min
    @State private var profileImage: UIImage? = nil
    @State private var isProfileImageLoaded = false

    var body: some View {

        ZStack {
            ZStack {
                
                if let image = profileImage {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 70, height: 70)
                        .overlay(
                            Rectangle()
                                .foregroundColor(Color(hex: "1B1D3C"))
                                .opacity(isDark ? 0.5 : 0)
                        )
                        .offset(y: 10)
                    
                }else {
                    ZStack{
                        Image("defaultImg 1")
                            .resizable()
                            .frame(width: 70, height: 70)
                    }.overlay(
                        Rectangle()
                            .foregroundColor(Color(hex: "1B1D3C"))
                            .opacity(isDark ? 0.5 : 0)
                    ).offset(y: 10)
                }
                Image(imgName)
            }
            
            .rotationEffect(rotationAngle(), anchor: .top)
            .onAppear {
                if let profileImage = UserDefaultsManager.shared.profile {
                    self.profileImage = profileImage
                }
                
                let baseAnimation = Animation.easeInOut(duration: 0.5)
                let repeated = baseAnimation.repeatCount(2)
                
                withAnimation(repeated) {
                    switch state {
                    case .max:
                        state = .min
                    case .min:
                        state = .max
                    case .done:
                        state = .done
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        state = .done
                        
                    }
                }
            }
        }
    }
    
    private func rotationAngle() -> Angle {
        switch state {
        case .max:
            return .degrees(-1.5)
        case .min:
            return .degrees(1.5)
        case .done:
            return .degrees(0)
        }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct SwingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SwingAnimation(imgName:"frame", isDark: false)
    }
}

