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

final class WelcomeViewController: UIViewController {
    private let tvingImage = UIImageView(image: .tving)
    private lazy var backButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setStyle()
        
    }
    
    
    private func setStyle(){
        backButton.do {
            $0.setImage(UIImage(resource: .beforeBtn), for: .normal)
        }
    }
    
    private func setLayout() {
        self.view.backgroundColor = .black
        [tvingImage, backButton].forEach { [weak self] view in
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
        
    }
    
    
}
