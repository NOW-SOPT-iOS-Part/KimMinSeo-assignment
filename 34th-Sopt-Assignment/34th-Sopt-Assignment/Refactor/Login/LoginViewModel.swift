//
//  LoginViewModel.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 6/5/24.
//

import UIKit


class LoginViewModel {
    var isValid: ObservablePattern<Bool> = ObservablePattern<Bool>.init(false)
    var errMessage: ObservablePattern<String?> = ObservablePattern<String?>.init(nil)
    
    func checkValid(id: String?, password: String?) {
        guard let id = id, !id.isEmpty else {
            errMessage.value = "ID를 입력하세요."
            isValid.value = false
            return
        }
        
        guard let password = password, !password.isEmpty else {
            errMessage.value = "비밀번호를 입력하세요."
            isValid.value = false
            return
        }
        
        if isValidId(id) && isValidPassword(password) {
            isValid.value = true
        } else {
            errMessage.value = "유효하지 않은 ID 또는 비밀번호입니다."
            isValid.value = false
        }

    }
    
    func isValidId(_ id: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return !id.isEmpty && emailPredicate.evaluate(with: id)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let pwRegEx = "[A-Za-z0-9!_@$%^&+=]{8,20}"
        let pwPredicate = NSPredicate(format:"SELF MATCHES %@", pwRegEx)
        return !password.isEmpty && pwPredicate.evaluate(with: password)
    }
}
