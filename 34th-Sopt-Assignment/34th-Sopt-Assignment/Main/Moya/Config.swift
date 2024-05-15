//
//  Config.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 5/8/24.
//

import Foundation

enum Config {
    
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let apiKey = "KEY"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}

extension Config {
    
    static let baseURL: String = {
        guard let key = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Base URL is not set in plist for this configuration.")
        }
        return key
    }()
    static let apiKey: String = {
            guard let key = Config.infoDictionary[Keys.Plist.apiKey] as? String else {
                fatalError("Key error")
            }
            return key
        }()
}

