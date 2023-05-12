//
//  FontManager.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/09.
//

import Foundation
import SwiftUI

struct FontManager {
    /// 폰트 싱글톤 객체 생성
    static let shared = FontManager()

    /// 나늠스퀘어 라운드의 타입 정의
    enum NanumSquareRound: String {
        case bold = "B"
        case extrabold = "EB"
        case large = "L"
        case regular = "R"
    }

    /// 나눔스퀘어 라운드 폰트를 type, size에 따라 return해 줍니다
    /// - Parameter Request: type , size
    /// - Returns: 나눔스퀘어라운드폰트의  type, size에 따른 커스텀 폰트 생성
    func nanumsquare(_ type:  NanumSquareRound, _ size: CGFloat) -> Font { 
        let name = "NanumSquareRound" + type.rawValue
        return Font.custom(name, size: size)
    }
}

