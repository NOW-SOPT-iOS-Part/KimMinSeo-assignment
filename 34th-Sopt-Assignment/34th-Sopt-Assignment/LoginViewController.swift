//
//  LoginViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 2024/04/06.
//

//
//  LoginViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김민서 on 2024/03/31.
//

import Foundation
import UIKit
import Then//Then 라이브러리
import SnapKit

final class LoginViewController: UIViewController, UITextFieldDelegate{
    //UILabel
    private let beforeButton = UIImageView(image: .beforeBtn)
    private let loginLabel = UILabel()
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private lazy var loginButton = UIButton()
    
    
    //auto layout
    private func setLayout() {
        [beforeButton, loginLabel, idTextField, passwordTextField, loginButton].forEach { [weak self] view in
            guard let self = self else { return }
            self.view.addSubview(view)
        }

        beforeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(65)
            $0.leading.equalToSuperview().inset(19)
            $0.width.equalTo(8)
            $0.height.equalTo(15)
        }
      
        loginLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(112)
            $0.leading.equalToSuperview().inset(107)
            $0.trailing.equalToSuperview().inset(107)
            
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(27)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
    func setStyle(){
        
        
        //타이틀 텍스트
        loginLabel.do {
            $0.text = "TVING ID 로그인"
            $0.textColor = UIColor(resource: .gray1)
            $0.textAlignment = .center
            $0.numberOfLines = 2
            $0.font = UIFont(name: "Pretendard-Medium", size: 23)
        }
        
        //아이디 입력창
        idTextField.do {
            $0.font = UIFont(name: "Pretendard-Semibold", size: 14)
            $0.backgroundColor = UIColor(resource: .gray4)
            $0.layer.cornerRadius = 3
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: $0.frame.height))
            $0.leftView = paddingView
            $0.leftViewMode = .always
            $0.textColor = UIColor(resource: .gray2)
            
            // placeholder의 색상을 변경
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.gray2, // 변경하고자 하는 색상
                .font: UIFont(name: "Pretendard-Semibold", size: 15) ?? UIFont.systemFont(ofSize: 15) // 폰트 설정 (nil 방지를 위한 기본 폰트)
            ]
            let attributedPlaceholder = NSAttributedString(string: "아이디", attributes: attributes)
            $0.attributedPlaceholder = attributedPlaceholder

        }
        
        passwordTextField.do {
            $0.font = UIFont(name: "Pretendard-Semibold", size: 14)
            $0.backgroundColor = UIColor(resource: .gray4)
            $0.layer.cornerRadius = 3
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: $0.frame.height))
            $0.leftView = paddingView
            $0.leftViewMode = .always
            $0.textColor = UIColor(resource: .gray2)
            
            // placeholder의 색상을 변경
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.gray2, // 변경하고자 하는 색상
                .font: UIFont(name: "Pretendard-Semibold", size: 15) ?? UIFont.systemFont(ofSize: 15) // 폰트 설정 (nil 방지를 위한 기본 폰트)
            ]
            let attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: attributes)
            $0.attributedPlaceholder = attributedPlaceholder

        }
        
        //로그인
        loginButton.do {
            $0.backgroundColor = .black
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Semibold", size: 14)
            $0.layer.cornerRadius = 3
            $0.layer.borderWidth = 1 // 테두리 두께
            $0.layer.borderColor = UIColor.gray4.cgColor // 테두리 색상
        }
        
   
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        self.view.backgroundColor = .black
    
        // 텍스트 필드의 delegate 설정
        idTextField.delegate = self
        passwordTextField.delegate = self
        
    }

    // 텍스트 필드 내용이 변경될 때 호출되는 메서드
    func textFieldDidChangeSelection(_ textField: UITextField) {
        // 입력된 아이디와 비밀번호가 유효한지 확인
        let isIdValid = isValidId(idTextField.text ?? "")
        let isPasswordValid = isValidPassword(passwordTextField.text ?? "")

        // 아이디와 비밀번호가 유효한 경우 로그인 버튼 활성화
        loginButton.isEnabled = isIdValid && isPasswordValid
        
        if(loginButton.isEnabled){
            loginButton.backgroundColor = UIColor(resource: .main)
            let buttonTextColor: UIColor = .white
            loginButton.setTitleColor(buttonTextColor, for: .normal)
        }
        else{
            loginButton.backgroundColor = .black
            let buttonTextColor: UIColor = .gray2
            loginButton.setTitleColor(buttonTextColor, for: .normal)
            loginButton.layer.borderWidth = 1
            loginButton.layer.borderColor = UIColor.gray4.cgColor // 테두리 색상
        }

    }
    
    // 아이디 유효성 검사
    func isValidId(_ id: String) -> Bool {
        // 아이디 유효성 검사 로직 추가
        return !id.isEmpty
    }

    // 비밀번호 유효성 검사
    func isValidPassword(_ password: String) -> Bool {
        // 비밀번호 유효성 검사 로직 추가
        return !password.isEmpty
    }

   
}
