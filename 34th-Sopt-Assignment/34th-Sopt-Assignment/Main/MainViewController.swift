//
//  MainViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 4/24/24.
//

import Foundation
import UIKit
import Then
import SnapKit

final class MainViewController: UIViewController, UICollectionViewDelegate {
    
    
    //화면 전체 스크롤
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    
    private let mainPoster = UIImageView()
    private let gradientView = UIImageView()
    private let gradientView2 = UIImageView()
    private let tvingLogo = UIImageView()
    private let airplay = UIButton()
    private let profile = UIImageView()
    private let explainLabel = UILabel()
    private let contentLabel = UILabel()
    private let showAll = UILabel()
    private let arrow = UIButton()
    
    
    
    //콜렉션 뷰
    private let contentCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear // 콜렉션 뷰 배경색을 투명하게 설정
        return collectionView
    }()

    private var itemData = ContentModel.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setLayout()
        register()
        setDelegate()
    }
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        self.view.backgroundColor = .black
        
        // UICollectionViewFlowLayout의 scrollDirection을 horizontal로 설정
        if let layout = contentCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        // contentCollectionView의 contentSize를 설정하여 수직 스크롤이 필요 없음을 나타냄
        contentCollectionView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 198)
    
        
      
        [mainPoster, gradientView,gradientView2, tvingLogo, airplay, profile, explainLabel,contentLabel, showAll, arrow, contentCollectionView].forEach {
            contentView.addSubview($0)
        }
        
        contentCollectionView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(150)
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.edges.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        mainPoster.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(498)
        }
        gradientView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(150)
        }
        gradientView2.snp.makeConstraints {
            $0.bottom.equalTo(mainPoster.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(150)
        }
        tvingLogo.snp.makeConstraints {
            $0.top.equalTo(mainPoster.snp.top).inset(20)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(84)
            $0.height.equalTo(21)
        }
        airplay.snp.makeConstraints {
            $0.top.equalTo(profile.snp.top).offset(3)
            $0.trailing.equalTo(profile.snp.leading).offset(-25)
            $0.width.equalTo(22)
            $0.height.equalTo(16)
        }
        profile.snp.makeConstraints {
            $0.top.equalTo(mainPoster.snp.top).inset(15)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(23)
            $0.height.equalTo(23)
        }
        explainLabel.snp.makeConstraints {
            $0.bottom.equalTo(mainPoster.snp.bottom).offset(-15)
            $0.leading.equalTo(mainPoster.snp.leading).offset(10)
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
        self.navigationController?.navigationBar.isHidden = true
        
        mainPoster.do {
            $0.image = UIImage(resource: .mainPoster)
        }
        gradientView.do {
            $0.image = UIImage(resource: .gradient)
        }
        gradientView2.do {
            $0.image = UIImage(resource: .gradient2)
        }
        tvingLogo.do {
            $0.image = UIImage(resource: .tvingLogo)
        }
        airplay.do {
            $0.setImage(UIImage(resource: .airplay), for: .normal)
        }
        profile.do {
            $0.image = UIImage(resource: .profile)
            $0.layer.cornerRadius = 3
            $0.clipsToBounds = true
        }
        explainLabel.do {
            $0.text = "[민서의 추천 드라마] 한소희 존예 송강 존잘\n두번 보세요~"
            $0.textColor = UIColor.white
            $0.textAlignment = .left
            $0.numberOfLines = 2
            $0.font = UIFont(name: "Pretendard-Medium", size: 15)
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
    
    private func register() {
        contentCollectionView.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: ContentCollectionViewCell.identifier)
    }
    
    private func setDelegate() {
        contentCollectionView.delegate = self
        contentCollectionView.dataSource = self
    }
    
}



extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 146)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 // 아이템 간의 간격을 없앰
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8 // 셀 간의 간격을 없앰
    }
    
    
}
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCollectionViewCell.identifier, for: indexPath) as? ContentCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(itemData[indexPath.item], itemRow: indexPath.item)
        return cell
    }
}

