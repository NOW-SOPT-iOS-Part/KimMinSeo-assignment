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
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
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
            id: rootView.idTextField.text,
            password: rootView.passwordTextField.text
        )
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    func showToast(_ message: String,
                   bottomInset: CGFloat = 86
    ) {
        guard let view else { return }
        Toast().show(message: message,
                     view: view,
                     bottomInset: bottomInset
        )
    }
}
