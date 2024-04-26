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
    private let itemImageView = UIImageView()
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
            $0.image = UIImage(resource: .mainPoster)
            $0.layer.cornerRadius = 100
        }
    }
    
    private func setLayout() {
        [itemImageView].forEach {
            contentView.addSubview($0)
        }
        
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
     
    }
    
}

extension ContentCollectionViewCell {
    func dataBind(_ contentData: ContentModel, itemRow: Int) {
        itemImageView.image = contentData.itemImg
        self.itemRow = itemRow
    }
}
