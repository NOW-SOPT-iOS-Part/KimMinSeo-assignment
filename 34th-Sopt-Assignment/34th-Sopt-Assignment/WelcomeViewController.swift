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
    
    
    private func setLayout() {
        [tvingImage].forEach { [weak self] view in
            guard let self = self else { return }
            self.view.addSubview(view)
        }
        
        tvingImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(211)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        self.view.backgroundColor = .black
    }
    
}
