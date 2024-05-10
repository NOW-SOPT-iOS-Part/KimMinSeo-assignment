//
//  ContentCollectionViewCell.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 4/26/24.
//

//
//  ContentTableViewCell.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 4/24/24.
//

import UIKit
import Then
import SnapKit



class ContentCollectionViewCell: UICollectionViewCell {
    //셀을 구분하기 위한 식별자
    static let identifier = "ItemCollectionViewCell"
        
    let itemImageView = UIImageView()
    let titleLabel = UILabel()
    let rankLabel = UILabel()
    let gradientView = UIImageView()
    
    var itemRow: Int?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .black
        setLayout()
        setStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    private func setStyle() {
        itemImageView.do {
            $0.layer.cornerRadius = 3
            $0.clipsToBounds = true
        }
        titleLabel.do {
            $0.text = "제목"
            $0.textColor = UIColor(resource: .gray2)
            $0.textAlignment = .left
            $0.font = UIFont(name: "Pretendard-Medium", size: 13)
        }
        gradientView.do {
            $0.image = UIImage(resource: .gradient3)
        }
        rankLabel.do {
            $0.text = "1"
            $0.textColor = .white
            $0.textAlignment = .left
            $0.font = UIFont(name: "Pretendard-Bold", size: 25)
        }
    }
    
    private func setLayout() {
        addSubviews(itemImageView, gradientView, titleLabel, rankLabel)
        
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(146)

        }
        gradientView.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.top)
            $0.leading.equalTo(itemImageView.snp.leading)
            $0.trailing.equalTo(itemImageView.snp.trailing)
            $0.height.equalTo(25)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom)
            $0.leading.equalTo(itemImageView.snp.leading)
            $0.trailing.equalTo(itemImageView.snp.trailing)
        }
        rankLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.top).inset(2)
            $0.leading.equalTo(itemImageView.snp.leading).inset(3)
        }
     
    }
    
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}

extension ContentCollectionViewCell {
    

    func dataBind(_ contentData: ContentResponseModel, itemRow: Int) {
        itemImageView.image = contentData.itemImg
        titleLabel.text = contentData.title
        rankLabel.text = contentData.rank
        self.itemRow = itemRow
    }
}
