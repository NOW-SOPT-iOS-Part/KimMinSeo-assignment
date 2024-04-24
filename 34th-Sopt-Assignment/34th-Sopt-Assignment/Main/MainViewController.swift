//
//  MainViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 4/24/24.
//

import Foundation
import UIKit
import Then//Then 라이브러리
import SnapKit

final class MainViewController: UIViewController, UIScrollViewDelegate{

    
    private let mainPoster = UIImageView()
    private let gradientView = UIImageView()
    private let tvingLogo = UIImageView()
    private let profile = UIImageView()
    private let contentLabel = UILabel()
    private let showAll = UILabel()
    private let arrow = UIButton()
    
    private func setLayout() {
        self.view.backgroundColor = .black
        [mainPoster, gradientView, tvingLogo, profile, contentLabel, showAll, arrow].forEach { [weak self] view in
            guard let self = self else { return }
            self.view.addSubview(view)
        }
    
        
        mainPoster.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(498)
        }
        gradientView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        tvingLogo.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(99)
            $0.height.equalTo(25)
        }
        profile.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(33)
            $0.height.equalTo(33)
        }
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(mainPoster.snp.bottom).offset(43)
            $0.leading.equalToSuperview().inset(16)
        }
        arrow.snp.makeConstraints {
            $0.top.equalTo(mainPoster.snp.bottom).offset(47)
            $0.trailing.equalToSuperview().inset(14)
            $0.width.equalTo(10)
            $0.height.equalTo(10)
        }
        showAll.snp.makeConstraints {
            $0.top.equalTo(mainPoster.snp.bottom).offset(44)
            $0.trailing.equalTo(arrow.snp.leading)
        }
      
    }
    
    private func setStyle() {
        mainPoster.do {
            $0.image = UIImage(resource: .mainPoster)
        }
        gradientView.do {
            $0.image = UIImage(resource: .gradient)
        }
        tvingLogo.do {
            $0.image = UIImage(resource: .tvingLogo)
        }
        profile.do {
            $0.image = UIImage(resource: .profile)
            $0.layer.cornerRadius = 17
            $0.clipsToBounds = true
        }
        contentLabel.do {
            $0.text = "티빙에서 꼭 봐야하는 콘텐츠"
            $0.textColor = .white
            $0.textAlignment = .center
            $0.font = UIFont(name: "Pretendard-Semibold", size: 17)
        }
        showAll.do {
            $0.text = "전체보기"
            $0.textColor = UIColor(resource: .gray3)
            $0.textAlignment = .center
            $0.font = UIFont(name: "Pretendard-Medium", size: 13)
        }
        arrow.do {
            $0.setImage(UIImage(resource: .arrow), for: .normal)
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
}
