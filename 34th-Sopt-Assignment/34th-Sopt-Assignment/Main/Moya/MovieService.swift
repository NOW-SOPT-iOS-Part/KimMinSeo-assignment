//
//  MovieService.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 5/10/24.
//

import Foundation
import Moya

final class MovieService {
    static let shared = MovieService()
    private var movieProvider = MoyaProvider<MovieTargetType>(plugins: [MoyaLoggingPlugin()])
    
    private init() {}
}

extension MovieService {
    func getDailyBoxOfficeList(completion: @escaping (NetworkResult<MovieData>) -> Void) {
        movieProvider.request(.dailyBoxOfficeList(date: "20171101")) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, MovieData.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    public func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<T> {
        switch statusCode {
        case 200..<205:
            return isValidData(data: data, object)
        case 400..<500:
            return .requestErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    private func isValidData<T: Codable>(data: Data, _ object: T.Type) -> NetworkResult<T> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            return .pathErr
        }
        return .success(decodedData)
    }
}
