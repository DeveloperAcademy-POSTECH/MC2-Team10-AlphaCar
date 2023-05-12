//
//  File3.swift
//  SagakSagak
//
//  Created by been on 2023/05/11.
//

import SwiftUI

struct AnimationView: View {
    var body: some View {
        VStack{
            LottieView(jsonName: "sad")
            LottieView(jsonName: "basic")
            LottieView(jsonName: "angry")
            LottieView(jsonName: "heart")
            LottieView(jsonName: "pleased")
            LottieView(jsonName: "soso")
            LottieView(jsonName: "twinkle")
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
