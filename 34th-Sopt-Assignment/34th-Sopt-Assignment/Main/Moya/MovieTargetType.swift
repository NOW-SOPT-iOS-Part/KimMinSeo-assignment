//
//  MovieTargetType.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 5/10/24.
//

import Foundation
import Moya


enum MovieTargetType {
    case dailyBoxOfficeList
}

extension MovieTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .dailyBoxOfficeList:
            return "key=727bb3a7287af4fed4dbdd132caad537&targetDt=20171101"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .dailyBoxOfficeList:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .dailyBoxOfficeList:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"] // 헤더 설정
    }
}
