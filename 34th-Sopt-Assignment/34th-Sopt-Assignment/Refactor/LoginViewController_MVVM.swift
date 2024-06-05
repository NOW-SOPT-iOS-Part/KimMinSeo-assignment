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
    
    // 편의 변수를 정의하여 rootView의 서브뷰에 접근
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
    }
    
    private func bindViewModel() {
        viewModel.isValid = { [weak self] isValid in
            if isValid {
                self?.pushToWelcomeVC()
            }
        }
        
        viewModel.errMessage = { [weak self] err in
            if let err = err {
                self?.showToast(err)
            }
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
        let welcomeViewController = WelcomeViewController()
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
