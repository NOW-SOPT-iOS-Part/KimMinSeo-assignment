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
    
    
//    //박스오피스 API 정보 가져오기
//    private func requestBoxOfficeInfo() {
//        BoxOffice.shared.getMovieInfo(targetDt: "20171101"){ [weak self] response in
//            switch response {
//            case .success(let data):
//                guard let data = data as? ContentResponseModel else {
//                    return }
//                self?.titleLabel.text = data.data.movieNm
//            case .requestErr:
//                print("요청 오류 입니다")
//            case .decodedErr:
//                print("디코딩 오류 입니다")
//            case .pathErr:
//                print("경로 오류 입니다")
//            case .serverErr:
//                print("서버 오류입니다")
//            case .networkFail:
//                print("네ㅋㅂ트워크 오류입니다")
//            }
//        }
//    }
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
    func dataBind(_ contentData: ContentResponseModel, itemRow: Int) {
        itemImageView.image = contentData.itemImg
        //titleLabel.text = contentData.title
        self.itemRow = itemRow
    }
}
