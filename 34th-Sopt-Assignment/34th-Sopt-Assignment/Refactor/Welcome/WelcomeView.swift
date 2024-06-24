//
//  WelcomeView.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 6/7/24.
//


import UIKit
import SnapKit

final class WelcomeView: UIView {
    let tvingImage = UIImageView(image: .tving)
    let welcomeText = UILabel()
    let mainButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        backgroundColor = .black
        
        [tvingImage, welcomeText, mainButton].forEach { addSubview($0) }
        
        tvingImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(211)
        }
        
        welcomeText.snp.makeConstraints {
            $0.top.equalTo(tvingImage.snp.bottom).offset(67)
            $0.leading.trailing.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(66)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        setStyle()
    }
    
    private func setStyle() {
        welcomeText.text = "@@@님\n반가워요!"
        welcomeText.textColor = UIColor(resource: .gray1)
        welcomeText.textAlignment = .center
        welcomeText.numberOfLines = 2
        welcomeText.font = UIFont(name: "Pretendard-Bold", size: 23)
        
        mainButton.backgroundColor = UIColor(resource: .main)
        mainButton.setTitle("메인으로", for: .normal)
        mainButton.setTitleColor(.white, for: .normal)
        mainButton.titleLabel?.font = UIFont(name: "Pretendard-Semibold", size: 14)
        mainButton.layer.cornerRadius = 3
    }
}
