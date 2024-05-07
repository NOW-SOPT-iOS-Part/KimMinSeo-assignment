//
//  MainPosterCollectionViewCell.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 4/30/24.
//

import Foundation
import UIKit

class MainPosterCollectionViewCell: UICollectionViewCell {
    static let id = "MainPosterCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let gradientView = UIImageView()
    private let gradientView2 = UIImageView()
    private let explainLabel = UILabel()
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(self.myImageView)
        self.contentView.addSubview(self.gradientView)
        self.contentView.addSubview(self.gradientView2)
        self.contentView.addSubview(self.explainLabel)
        setStyle()
        setLayout()
        

    }
    private func setLayout(){
        myImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(self.contentView.snp.bottom)
            $0.top.equalTo(self.contentView.snp.top)
        }
        gradientView.snp.makeConstraints {
            $0.top.equalTo(myImageView.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(150)
        }
     
        gradientView2.snp.makeConstraints {
            $0.bottom.equalTo(myImageView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(150)
        }
        explainLabel.snp.makeConstraints {
            $0.bottom.equalTo(myImageView.snp.bottom).offset(-15)
            $0.leading.equalToSuperview().inset(15)
        }
        
    }
    
    private func setStyle(){
        myImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        gradientView.do {
            $0.image = UIImage(resource: .gradient)
        }
        
        gradientView2.do {
            $0.image = UIImage(resource: .gradient2)
        }
        explainLabel.do {
            $0.text = "[민서가 추천하는 어쩌구 저쩌구] 어휴 이제 이것도 귀찮음"
            $0.textColor = .white
            $0.textAlignment = .center
            $0.font = UIFont(name: "Pretendard-Medium", size: 13)
        }
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.prepare(image: nil)
    }
    
    func prepare(image: UIImage?) {
        self.myImageView.image = image
    }
    func configure(with model: MainposterModel) {
        self.explainLabel.text = model.explain
    }
}


