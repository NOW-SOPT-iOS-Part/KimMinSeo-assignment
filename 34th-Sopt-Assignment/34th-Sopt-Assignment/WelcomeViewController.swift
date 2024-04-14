//
//  WelcomeViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 2024/04/06.
//

import Foundation
import UIKit
import Then//Then 라이브러리
import SnapKit

//1.프로토콜 생성
protocol DataBindProtocol: AnyObject {
    func dataBind(id: String?)
}

final class WelcomeViewController: UIViewController {
    //2. delegate 프로퍼티 선언
    weak var delegate: DataBindProtocol?
    
    private var id: String?
    
    private let tvingImage = UIImageView(image: .tving)
    private lazy var backButton = UIButton()
    private let welcomeText = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setStyle()
        bindID()
    }
    
    
    private func setStyle(){
        backButton.do {
            $0.setImage(UIImage(resource: .beforeBtn), for: .normal)
        }
        
        welcomeText.do {
            $0.text = "@@@님\n반가워요!"
            $0.textColor = UIColor(resource: .gray1)
            $0.textAlignment = .center
            $0.numberOfLines = 2
            $0.font = UIFont(name: "Pretendard-Bold", size: 23)
            
        }
    }
    
    private func setLayout() {
        self.view.backgroundColor = .black
        [tvingImage, backButton, welcomeText].forEach { [weak self] view in
            guard let self = self else { return }
            self.view.addSubview(view)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(46)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(15)
            $0.height.equalTo(28)
        }
        
        tvingImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(211)
        }
        welcomeText.snp.makeConstraints {
            $0.top.equalTo(tvingImage.snp.bottom).offset(67)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
    }
    
    //데이터 바인딩 함수 구현 -> 옵셔널 바인딩 사용
    private func bindID() {
        guard let idText = id else { return }
        self.welcomeText.text="\(idText)님\n반가워요!"
    }
    
    func setLabelText(id: String?) {
        self.id = id
    }
    
    
    @objc
    private func backToLoginButtonDidTap() {
        if let id = id {
            delegate?.dataBind(id: id)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
