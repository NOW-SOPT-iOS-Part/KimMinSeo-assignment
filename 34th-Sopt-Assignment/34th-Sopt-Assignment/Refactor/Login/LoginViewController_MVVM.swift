//
//  LoginViewController_MVVM.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 6/5/24.
//

import UIKit
import SnapKit

final class LoginViewController_MVVM: UIViewController {
    
    private let rootView = LoginView()
    private let viewModel = LoginViewModel()
    
    private var idTextField: UITextField { return rootView.idTextField }
    private var passwordTextField: UITextField { return rootView.passwordTextField }
    private var loginButton: UIButton { return rootView.loginButton }
    private var hiddenIcon: UIButton { return rootView.hiddenIcon }
    private var deleteIcon: UIButton { return rootView.deleteIcon }
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        setTarget()
        bindViewModel()
    }
    
    private func setTarget() {
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        hiddenIcon.addTarget(self, action: #selector(hiddenButtonTapped), for: .touchUpInside)
        deleteIcon.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        
        idTextField.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        passwordTextField.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        idTextField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        passwordTextField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        
        idTextField.addTarget(self, action: #selector(textFieldDidChangeSelection(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChangeSelection(_:)), for: .editingChanged)
    }
    
    private func bindViewModel() {
        viewModel.isValid.bind { [weak self] isValid in
            guard let isValid else { return }
            if isValid { self?.pushToWelcomeVC() }
        }
        
        viewModel.errMessage.bind { [weak self] err in
            guard let err else { return }
            self?.showToast(err!)
        }
    }
    
    @objc private func loginButtonDidTap() {
        viewModel.checkValid(
            id: idTextField.text,
            password: passwordTextField.text
        )
    }
    
    @objc func deleteButtonTapped() {
        passwordTextField.text = ""
    }
    
    @objc func hiddenButtonTapped() {
        // 현재 텍스트 필드의 보안 상태를 토글
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        // 보안 상태에 따라 이미지 변경
        let image = passwordTextField.isSecureTextEntry ? UIImage(resource: .passwordHidden) : UIImage(resource: .passwordShown)
        hiddenIcon.setImage(image, for: .normal)
    }
    
    private func pushToWelcomeVC() {
        let userId = idTextField.text ?? ""
        let welcomeViewModel = WelcomeViewModel(id: userId)
        let welcomeViewController = WelcomeViewController_MVVM(viewModel: welcomeViewModel)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    func showToast(_ message: String, bottomInset: CGFloat = 86) {
        guard let view = self.view else { return }
        Toast().show(message: message, view: view, bottomInset: bottomInset)
    }
    
    // 입력하려고 클릭했을 때
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
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
    
    // 텍스트 필드 내용이 변경될 때 호출되는 메서드
    @objc func textFieldDidChangeSelection(_ textField: UITextField) {
        // 입력된 아이디와 비밀번호가 유효한지 확인
        let isIdValid = viewModel.isValidId(idTextField.text ?? "")
        let isPasswordValid = viewModel.isValidPassword(passwordTextField.text ?? "")
        
        // 아이디와 비밀번호가 모두 유효한 경우 로그인 버튼 활성화
        let isLoginEnabled = isIdValid && isPasswordValid
        
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
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == passwordTextField {
            hiddenIcon.isHidden = true
            deleteIcon.isHidden = true
        }
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

