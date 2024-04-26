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
}

extension ContentModel {
    static func dummy() -> [ContentModel] {
        return [
            ContentModel(itemImg: .subPoster1),
            ContentModel(itemImg: .subPoster2),
            ContentModel(itemImg: .subPoster3),
            ContentModel(itemImg: .subPoster4),
            ContentModel(itemImg: .subPoster5)
        ]
    }
}
