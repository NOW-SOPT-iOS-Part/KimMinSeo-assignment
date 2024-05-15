//
//  ChatModel.swift
//  34th-Sopt-Seminar
//
//  Created by 김민서 on 4/20/24.
//

import Foundation
import UIKit

struct ContentResponseModel {
    let itemImg: UIImage
    let title : String
    let rank : String
}

extension ContentResponseModel {
    static func dummy() -> [ContentResponseModel] {
        return [
            ContentResponseModel(itemImg: .subPoster1, title: "선재 업고 튀어",rank: "1"),
            ContentResponseModel(itemImg: .subPoster2, title: "히로인 실격",rank: "1"),
            ContentResponseModel(itemImg: .subPoster3, title: "하이큐!! 투 더 탑",rank: "1"),
            ContentResponseModel(itemImg: .subPoster4, title: "너에게 닿기를",rank: "1"),
            ContentResponseModel(itemImg: .subPoster5, title: "그시절 우리가 좋아했던 소녀",rank: "1"),
            ContentResponseModel(itemImg: .mainPoster4, title: "반짝이는 워터멜론",rank: "1"),
            ContentResponseModel(itemImg: .mainPoster7, title: "아따맘마 Part3",rank: "1"),
            ContentResponseModel(itemImg: .mainPoster6, title: "그시절 우리가 좋아했던 소녀",rank: "1"),
            ContentResponseModel(itemImg: .mainPoster3, title: "반짝이는 워터멜론",rank: "1"),
            ContentResponseModel(itemImg: .mainPoster2, title: "아따맘마 Part3",rank: "1")
        ]
    }
}
