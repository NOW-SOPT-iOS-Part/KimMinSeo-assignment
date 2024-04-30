//
//  MainPosterModel.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 4/30/24.
//

import Foundation
import UIKit

struct MainposterModel {
    let itemImg: UIImage
    let explain: String
}

extension MainposterModel {
    static func dummy() -> [MainposterModel] {
        return [
            MainposterModel(itemImg: .mainPoster4, explain: "[민서가 추천하는 어쩌구 저쩌구] 어휴 이제 이것도 귀찮음"),
            MainposterModel(itemImg: .mainPoster5, explain: "[민서가 추천하는 어쩌구 저쩌구] 어휴 이제 이것도 귀찮음" ),
            MainposterModel(itemImg: .mainPoster3, explain: "[민서가 추천하는 어쩌구 저쩌구] 어휴 이제 이것도 귀찮음"),
            MainposterModel(itemImg: .mainPoster, explain: "[민서가 추천하는 어쩌구 저쩌구] 어휴 이제 이것도 귀찮음"),
            MainposterModel(itemImg: .mainPoster6, explain: "[민서가 추천하는 어쩌구 저쩌구] 어휴 이제 이것도 귀찮음"),
            MainposterModel(itemImg: .mainPoster7, explain: "[민서가 추천하는 어쩌구 저쩌구] 어휴 이제 이것도 귀찮음"),
            MainposterModel(itemImg: .subPoster3, explain: "[민서가 추천하는 어쩌구 저쩌구] 어휴 이제 이것도 귀찮음"),
            MainposterModel(itemImg: .mainPoster2, explain: "[민서가 추천하는 어쩌구 저쩌구] 어휴 이제 이것도 귀찮음")
        ]
    }
}
