//
//  LoginViewModel.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 6/5/24.
//

import UIKit

final class LoginViewModel {
    // 클로저 타입의 프로퍼티 선언
    var isValid: ((Bool) -> Void)?
    var errMessage: ((String?) -> Void)?
    
    func checkValid(id: String?, password: String?) {
        guard let id = id, !id.isEmpty else {
            errMessage?("아이디가 비어있습니다.")
            return
        }
        guard let password = password, !password.isEmpty else {
            errMessage?("비밀번호가 비어있습니다.")
            return
        }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let pwRegEx = "[A-Za-z0-9!_@$%^&+=]{8,20}"
        
        if id.range(of: emailRegEx, options: .regularExpression) == nil {
            errMessage?("아이디가 유효하지 않습니다.")
            return
        }
        
        if password.range(of: pwRegEx, options: .regularExpression) == nil {
            errMessage?("비밀번호가 유효하지 않습니다.")
            return
        }
        
        isValid?(true)
    }
}

