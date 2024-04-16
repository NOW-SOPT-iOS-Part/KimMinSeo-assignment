//
//  LoginViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 2024/04/06.
//


import Foundation
import UIKit
import Then//Then 라이브러리
import SnapKit

final class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    //UILabel
    private let loginLabel = UILabel()
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private lazy var loginButton = UIButton()
    private let hiddenIcon = UIButton()
    private let deleteIcon = UIButton()
    private let findId = UILabel()
    private let findPassword = UILabel()
    private let askAccount = UILabel()
    private let createNickname = UILabel()
    private let centerLine = UIView()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        setDelegate()
    }
    
    private func setDelegate() {
        // 텍스트 필드의 delegate 설정
        idTextField.delegate = self
        passwordTextField.delegate = self
    }

   
    //auto layout
    private func setLayout() {
        self.view.backgroundColor = .black
        
        [
            loginLabel,
            idTextField,
            passwordTextField,
            loginButton,
            hiddenIcon,
            findId,
            deleteIcon,
            findPassword,
            askAccount,
            createNickname,
            centerLine
        ].forEach { [weak self] view in
            guard let self = self else { return }
            self.view.addSubview(view)
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
        
        hiddenIcon.snp.makeConstraints {
            $0.trailing.equalTo(passwordTextField.snp.trailing).inset(20)
            $0.top.equalTo(passwordTextField.snp.top).inset(15)
            $0.bottom.equalTo(passwordTextField.snp.bottom).inset(15)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
        
        deleteIcon.snp.makeConstraints {
            $0.trailing.equalTo(hiddenIcon.snp.leading).offset(-14)
            $0.top.equalTo(passwordTextField.snp.top).inset(15)
            $0.bottom.equalTo(passwordTextField.snp.bottom).inset(15)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        findId.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(92)
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
        }
        
        findPassword.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(79)
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
        }
        
        askAccount.snp.makeConstraints {
            $0.top.equalTo(findId.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(58)
        }
        
        createNickname.snp.makeConstraints {
            $0.top.equalTo(findId.snp.bottom).offset(28)
            $0.trailing.equalToSuperview().inset(58)
        }
        centerLine.backgroundColor = .gray4
        centerLine.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(36)
            $0.center.equalToSuperview()
            $0.width.equalTo(1)
            $0.height.equalTo(12)
        }
    }
    
    
    private func setStyle(){
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
            $0.isSecureTextEntry = true
            //눈 아이콘 추가
            $0.rightView = hiddenIcon
            //클리어 버튼 추가
            $0.rightView = deleteIcon
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
            $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        }
        
        //처음에는 안보이게
        hiddenIcon.isHidden = true
        deleteIcon.isHidden = true
        
        hiddenIcon.do {
            $0.setImage(UIImage(resource: .passwordHidden), for: .normal)
            $0.addTarget(self, action: #selector(hiddenButtonTapped), for: .touchUpInside)
        }

        deleteIcon.do {
            $0.setImage(.xCircle, for: .normal)
            $0.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)

        }
        
        findId.do {
            $0.text = "아이디 찾기"
            $0.textColor = UIColor(resource: .gray2)
            $0.textAlignment = .center
            $0.font = UIFont(name: "Pretendard-Semibold", size: 14)
        }
        
        findPassword.do {
            $0.text = "비밀번호 찾기"
            $0.textColor = UIColor(resource: .gray2)
            $0.textAlignment = .center
            $0.font = UIFont(name: "Pretendard-Semibold", size: 14)
        }
        
        askAccount.do {
            $0.text = "아직 계정이 없으신가요?"
            $0.textColor = UIColor(resource: .gray3)
            $0.textAlignment = .center
            $0.font = UIFont(name: "Pretendard-Semibold", size: 14)
        }
        
        createNickname.do {
            $0.text = "닉네임 만들러가기"
            $0.textColor = UIColor(resource: .gray2)
            $0.textAlignment = .center
            $0.font = UIFont(name: "Pretendard-Semibold", size: 14)
            
            // underline을 추가하는 NSAttributedString 생성
            let attributedString = NSAttributedString(string: "닉네임 만들러가기", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
            $0.attributedText = attributedString
            
            // UILabel의 사용자 상호작용 활성화
            $0.isUserInteractionEnabled = true
            
            // 탭 제스처 생성
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(nicknameClicked))
            $0.addGestureRecognizer(tapGesture)
        }

        
        
    }

    @objc
    private func loginButtonDidTap() {
        // 아이디와 비밀번호를 가져옴
        let id = idTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        // 아이디와 비밀번호가 모두 입력되었는지 확인
        guard !id.isEmpty, !password.isEmpty else {
            // 아이디 또는 비밀번호 중 하나라도 비어 있으면 로그인을 수행하지 않고 종료
            return
        }
        // 아이디와 비밀번호가 모두 입력된 경우에만 로그인 화면으로 이동
        pushToWelcomeVC()
    }

    
    @objc
    func deleteButtonTapped() {
        self.passwordTextField.text = ""
    }
    
    @objc
    func hiddenButtonTapped() {
        // 현재 텍스트 필드의 보안 상태를 토글
        self.passwordTextField.isSecureTextEntry = !self.passwordTextField.isSecureTextEntry
        // 보안 상태에 따라 이미지 변경
        let image = self.passwordTextField.isSecureTextEntry ? UIImage(resource: .passwordHidden) : UIImage(resource: .passwordShown)
        self.hiddenIcon.setImage(image, for: .normal)
    }
    
    @objc func nicknameClicked() {
        let bottomSheetVC = BottomSheetViewController()
          // 1
        bottomSheetVC.modalPresentationStyle = .overFullScreen
          // 2
        self.present(bottomSheetVC, animated: false, completion: nil)
    }

    //화면 전환
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.delegate = self
        welcomeViewController.setLabelText(id: idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    

    //입력하려고 클릭했을 떄
    func textFieldDidBeginEditing(_ textField: UITextField) {
    
        if textField == idTextField {
            applyBorder(to: idTextField)
            removeBorder(from: passwordTextField)
            hiddenIcon.isHidden = true
            deleteIcon.isHidden = true
        } else if textField == passwordTextField {
            applyBorder(to: passwordTextField)
            removeBorder(from: idTextField)
            hiddenIcon.isHidden = false
            deleteIcon.isHidden = false
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == passwordTextField {
            hiddenIcon.isHidden = true
            deleteIcon.isHidden = true
        }
    }

    // 텍스트 필드 내용이 변경될 때 호출되는 메서드
    func textFieldDidChangeSelection(_ textField: UITextField) {
        // 입력된 아이디와 비밀번호가 유효한지 확인
        let isIdValid = isValidId(idTextField.text ?? "")
        let isPasswordValid = isValidPassword(passwordTextField.text ?? "")
        
        // 아이디와 비밀번호가 모두 유효한 경우 로그인 버튼 활성화
        let isLoginEnabled = isIdValid && isPasswordValid
        loginButton.isEnabled = isLoginEnabled
        
        // 로그인 버튼의 스타일 변경
        if isLoginEnabled {
            loginButton.backgroundColor = UIColor(resource: .main)
            loginButton.setTitleColor(.white, for: .normal)
            loginButton.layer.borderColor = UIColor.gray4.cgColor
        } else {
            loginButton.backgroundColor = .black
            loginButton.setTitleColor(UIColor(resource: .gray2), for: .normal)
            loginButton.layer.borderColor = UIColor.gray4.cgColor
        }
    }

    
    // 아이디 유효성 검사 (이메일 정규식 추가)
    func isValidId(_ id: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return !id.isEmpty && emailPredicate.evaluate(with: id)
    }

    
    // 비밀번호 유효성 검사 (비밀번호 정규식 추가)
    func isValidPassword(_ password: String) -> Bool {
        let pwRegEx = "[A-Za-z0-9!_@$%^&+=]{8,20}"
        // 8자 ~ 20자
        let pwPredicate = NSPredicate(format:"SELF MATCHES %@", pwRegEx)
        return !password.isEmpty && pwPredicate.evaluate(with: password)
    }

    

    private func applyBorder(to textField: UITextField) {
        // 선택된 텍스트 필드에 테두리 효과 적용
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.gray2.cgColor
    }
    private func removeBorder(from textField: UITextField) {
        textField.layer.borderWidth = 0.0
    }
    
    
}

extension LoginViewController: DataBindProtocol {
    func dataBind(id: String?) {
        idTextField.text = id
    }
}
