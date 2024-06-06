//
//  WelcomeViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 2024/04/06.
//

import UIKit
import Then
import SnapKit

// 1. 프로토콜 생성
protocol DataBindProtocol: AnyObject {
    func dataBind(id: String?)
}

final class WelcomeViewController: UIViewController {
    // 2. delegate 프로퍼티 선언
    weak var delegate: DataBindProtocol?
    
    private var id: String?
    
    private let tvingImage = UIImageView(image: .tving)
    private let welcomeText = UILabel()
    private lazy var mainButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setStyle()
        bindID()
    }
    
    private func setStyle() {
        navigationItem.hidesBackButton = true
        

        welcomeText.do {
            $0.text = "@@@님\n반가워요!"
            $0.textColor = UIColor(resource: .gray1)
            $0.textAlignment = .center
            $0.numberOfLines = 2
            $0.font = UIFont(name: "Pretendard-Bold", size: 23)
        }
        
        mainButton.do {
            $0.backgroundColor = UIColor(resource: .main)
            $0.setTitle("메인으로", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Semibold", size: 14)
            $0.layer.cornerRadius = 3
            $0.addTarget(self, action: #selector(mainButtonDidTap), for: .touchUpInside)
        }
    }
    
    private func setLayout() {
        self.view.backgroundColor = .black
        [tvingImage, welcomeText, mainButton].forEach { [weak self] view in
            guard let self = self else { return }
            self.view.addSubview(view)
        }
        

        
        tvingImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
            $0.leading.trailing.equalToSuperview() // 이미지 뷰의 leading과 trailing을 superview에 맞춤
            $0.height.equalTo(211)
        }
        
        welcomeText.snp.makeConstraints {
            $0.top.equalTo(tvingImage.snp.bottom).offset(67)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(66)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
    
    @objc
    private func mainButtonDidTap() {
        pushToMainVC()
    }
    
    // 데이터 바인딩 함수 구현 -> 옵셔널 바인딩 사용
    private func bindID() {
        guard let idText = id else { return }
        self.welcomeText.text = "\(idText)님\n반가워요!"
    }
    
    func setLabelText(id: String?) {
        self.id = id
    }
    
    // 화면 전환
    private func pushToMainVC() {
        let mainViewController = MainViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
}
