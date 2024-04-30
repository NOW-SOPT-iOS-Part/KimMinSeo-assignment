//
//  ChatModel.swift
//  34th-Sopt-Seminar
//
//  Created by 김민서 on 4/20/24.
//

import Foundation
import UIKit

struct ContentModel {
    let itemImg: UIImage
    let title : String
}

extension ContentModel {
    static func dummy() -> [ContentModel] {
        return [
            ContentModel(itemImg: .subPoster1, title: "선재 업고 튀어"),
            ContentModel(itemImg: .subPoster2, title: "히로인 실격"),
            ContentModel(itemImg: .subPoster3, title: "하이큐!! 투 더 탑"),
            ContentModel(itemImg: .subPoster4, title: "너에게 닿기를"),
            ContentModel(itemImg: .subPoster5, title: "그시절 우리가 좋아했던 소녀"),
            ContentModel(itemImg: .mainPoster4, title: "반짝이는 워터멜론"),
            ContentModel(itemImg: .mainPoster3, title: "아따맘마 Part 3")
        ]
    }
}
