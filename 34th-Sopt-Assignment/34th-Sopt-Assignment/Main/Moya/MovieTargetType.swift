//
//  MovieTargetType.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 5/10/24.
//

import Foundation
import Moya


enum MovieTargetType {
    case dailyBoxOfficeList(date: String)
}

extension MovieTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .dailyBoxOfficeList:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .dailyBoxOfficeList:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .dailyBoxOfficeList(let date):
            return ["key": Config.apiKey, "targetDt": date]
        }
    }
    
    var task: Task {
        switch self {
        case .dailyBoxOfficeList:
            if let parameters = parameters {
                return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
            } else {
                return .requestPlain
            }
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"] // 헤더 설정
    }
}
