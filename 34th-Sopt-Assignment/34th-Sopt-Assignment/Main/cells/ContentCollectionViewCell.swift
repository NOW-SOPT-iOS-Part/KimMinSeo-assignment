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
        
    
    //이미지
    let itemImageView = UIImageView()
    let titleLabel = UILabel()
    
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
    
    
    //박스오피스 API 정보 가져오기
    private func requestBoxOfficeInfo() {
        
    }
    private func setStyle() {
        titleLabel.do {
            $0.text = "제목"
            $0.textColor = UIColor(resource: .gray2)
            $0.textAlignment = .left
            $0.font = UIFont(name: "Pretendard-Medium", size: 13)
        }
    }
    
    private func setLayout() {
        [itemImageView, titleLabel].forEach {
            contentView.addSubview($0)
        }
        
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(146)

        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom)
            $0.leading.equalTo(itemImageView.snp.leading)
            $0.trailing.equalTo(itemImageView.snp.trailing)
        }
     
    }
    
}

extension ContentCollectionViewCell {
    func dataBind(_ contentData: ContentModel, itemRow: Int) {
        itemImageView.image = contentData.itemImg
        titleLabel.text = contentData.title
        self.itemRow = itemRow
    }
}
