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
    let data: DataClass
}

struct DataClass: Codable {
    let movieNm : String
}

extension ContentResponseModel {
    static func dummy() -> [ContentResponseModel] {
        return [
            ContentResponseModel(itemImg: UIImage(named: "subPoster1")!, data: DataClass(movieNm: "선재 업고 튀어")),
            ContentResponseModel(itemImg: UIImage(named: "subPoster2")!, data: DataClass(movieNm: "히로인 실격")),
            ContentResponseModel(itemImg: UIImage(named: "subPoster3")!, data: DataClass(movieNm: "하이큐!! 투 더 탑")),
            ContentResponseModel(itemImg: UIImage(named: "subPoster4")!, data: DataClass(movieNm: "너에게 닿기를")),
            ContentResponseModel(itemImg: UIImage(named: "subPoster5")!, data: DataClass(movieNm: "그시절 우리가 좋아했던 소녀")),
            ContentResponseModel(itemImg: UIImage(named: "mainPoster4")!, data: DataClass(movieNm: "반짝이는 워터멜론")),
            ContentResponseModel(itemImg: UIImage(named: "mainPoster3")!, data: DataClass(movieNm: "아따맘마 Part3"))
        ]
    }
}

