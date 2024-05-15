//
//  BottomSheetViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 4/15/24.
//

import UIKit
import Then
import SnapKit


class BottomSheetViewController: UIViewController {
  
    
    private let bottomSheetView = UIView()
    private let dimmedView = UIView()
    private let bar = UIView()
    private let nicknameTextfield = UITextField()
    private let airpodMax = UILabel()
    private var bottomSheetViewTopConstraint: NSLayoutConstraint!
    private lazy var saveButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
    

    private func setLayout() {
        [
            dimmedView,
            bottomSheetView,
            bar,
            nicknameTextfield,
            airpodMax,
            saveButton
        ].forEach { [weak self] view in
            guard let self = self else { return }
            self.view.addSubview(view)
        }
       
        dimmedView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        bottomSheetView.translatesAutoresizingMaskIntoConstraints = false

        let topConstant = view.frame.height * 0.5

        bottomSheetView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(topConstant)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        bar.snp.makeConstraints {
            $0.bottom.equalTo(bottomSheetView.snp.top).offset(-15)
            $0.center.equalToSuperview()
            $0.width.equalTo(56)
            $0.height.equalTo(7)
        }
        nicknameTextfield.snp.makeConstraints {
            $0.top.equalTo(bottomSheetView.snp.top).inset(98)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        airpodMax.snp.makeConstraints {
            $0.top.equalTo(bottomSheetView.snp.top).inset(50)
            $0.leading.equalToSuperview().inset(20)
        }
        
        saveButton.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        
    }
    
    private func setStyle() {
        bottomSheetView.do {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 20
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            $0.clipsToBounds = true
        }
        
//
//            
        dimmedView.do {
            $0.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_:)))
            $0.addGestureRecognizer(dimmedTap)
            $0.isUserInteractionEnabled = true
        }
        
        bar.do {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 4
        }
        
        nicknameTextfield.do {
            $0.font = UIFont(name: "Pretendard-Semibold", size: 14)
            $0.backgroundColor = UIColor(resource: .gray2)
            $0.layer.cornerRadius = 3
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: $0.frame.height))
            $0.leftView = paddingView
            $0.leftViewMode = .always
            $0.textColor = UIColor(resource: .gray4)
            
            // placeholder의 색상을 변경
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.gray4, // 변경하고자 하는 색상
                .font: UIFont(name: "Pretendard-Semibold", size: 14) ?? UIFont.systemFont(ofSize: 14) // 폰트 설정 (nil 방지를 위한 기본 폰트)
            ]
            let attributedPlaceholder = NSAttributedString(string: "닉네임", attributes: attributes)
            $0.attributedPlaceholder = attributedPlaceholder
        }
        
        airpodMax.do {
            $0.text = "닉네임을 입력해주세요"
            $0.textColor = UIColor(.black)
            $0.textAlignment = .center
            $0.font = UIFont(name: "Pretendard-Medium", size: 23)
        }
        
        saveButton.do {
            $0.backgroundColor = UIColor(resource: .main)
            $0.setTitle("저장하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Semibold", size: 14)
            $0.layer.cornerRadius = 3
            $0.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
            

        }
    }
    
  
    
    private func hideBottomSheetAndGoBack() {
        let loginViewController = LoginViewController()
        loginViewController.setNicknameText(nickname: nicknameTextfield.text)
        
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn, animations: {
            self.dimmedView.alpha = 0.0
            self.view.layoutIfNeeded()
        }) { _ in
            if self.presentingViewController != nil {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    @objc private func dimmedViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        hideBottomSheetAndGoBack()
        
    }
    
    @objc private func saveButtonTapped() {
        let nickname = nicknameTextfield.text ?? ""
        // 아이디와 비밀번호가 모두 입력되었는지 확인
        
        guard !nickname.isEmpty else {
            return
        }
        hideBottomSheetAndGoBack()
        
        
    }

}
