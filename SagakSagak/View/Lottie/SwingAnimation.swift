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
    @State private var state: RotationState = .min
    @State var imgName: String

    var body: some View {
        VStack(alignment: .center, spacing: -1) {
            Image(imgName)
                .rotationEffect(rotationAngle(), anchor: .top)
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 0.5)
                    let repeated = baseAnimation.repeatCount(2) // 3 times in each direction
                    
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
                            state = .done // Stop at 0 degrees
                        }
                    }
                }
        }
    }
    
    private func rotationAngle() -> Angle {
        switch state {
        case .max:
            return .degrees(-10)
        case .min:
            return .degrees(10)
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
        SwingAnimation(imgName:"frame")
    }
}
