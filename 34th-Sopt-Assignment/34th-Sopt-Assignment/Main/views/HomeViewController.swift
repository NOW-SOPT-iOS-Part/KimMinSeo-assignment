//
//  MainViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 4/24/24.
//

import UIKit
import Then
import SnapKit
import Moya



//구조체 만들기
struct MovieData : Codable {
    let boxOfficeResult : BoxOfficeResult
}
struct BoxOfficeResult : Codable {
    let dailyBoxOfficeList : [DailyBoxOfficeList]
}
struct DailyBoxOfficeList : Codable {
    let movieNm : String
    let rank : String
}



final class HomeViewController: UIViewController, UICollectionViewDelegate {
    
    private lazy var carouselViewController: CarouselViewController = {
        let viewController = CarouselViewController()
        return viewController
    }()
    
    let movieURL = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=727bb3a7287af4fed4dbdd132caad537&targetDt=20171101"
    
    private var itemData = ContentResponseModel.dummy()
    private var movieTitles: [String] = []
    private var movieRanks: [String] = []
    
    
    //화면 전체 스크롤
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private let tvingLogo = UIImageView()
    private let airplay = UIButton()
    private let profile = UIImageView()
    private let contentLabel = UILabel()
    private let popularLabel = UILabel()
    private let showAll = UILabel()
    private let arrow = UIButton()
   
    
    
    //API가져오기
    func getData(){
        if let url = URL(string: movieURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let JSONdata = data {
                    let dataString = String(data: JSONdata, encoding: .utf8)
                    //print(dataString!, "🙋🏻‍♂️")
                    let decoder = JSONDecoder()
                    do {
                        let decedeMovieData = try decoder.decode(MovieData.self, from: JSONdata)
                        // 클로저 내부에서 self를 명시적으로 캡처하여야 함
                        DispatchQueue.main.async {
                            for dailyBoxOffice in decedeMovieData.boxOfficeResult.dailyBoxOfficeList {
                                self.movieTitles.append(dailyBoxOffice.movieNm)
                                self.movieRanks.append(dailyBoxOffice.rank)
                            }
                            self.contentCollectionView.reloadData() // 콜렉션 뷰 갱신
                        }
                    } catch {
                        print(error,"🚨")
                    }

                }
            }
            task.resume()
        }
    }
    //콜렉션 뷰
    private let contentCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear // 콜렉션 뷰 배경색을 투명하게 설정
        return collectionView
    }()
    
    
    //    private var itemData: [ContentResponseModel] = [] {
    //        didSet {
    //            DispatchQueue.main.async {
    //                self.contentCollectionView.reloadData()
    //            }
    //        }
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        register()
        setDelegate()
        getData()
    }
    
    private func setLayout() {
        
        
        self.view.backgroundColor = .black
        self.view.addSubview(scrollView)
        
        
        [contentView, tvingLogo, profile,airplay].forEach {
            scrollView.addSubview($0)
        }
        
        
        [carouselViewController.view,contentLabel,popularLabel, showAll, arrow, contentCollectionView].forEach {
            contentView.addSubview($0)
        }
        
        
        carouselViewController.view.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(500)
        }
        contentCollectionView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(163)
        }
        
        
        
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(-50)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(50)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.edges.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        
        tvingLogo.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().inset(15)
            $0.width.equalTo(84)
            $0.height.equalTo(21)
        }
        airplay.snp.makeConstraints {
            $0.top.equalTo(profile.snp.top).offset(3)
            $0.trailing.equalTo(profile.snp.leading).offset(-15)
            $0.width.equalTo(22)
            $0.height.equalTo(16)
        }
        profile.snp.makeConstraints {
            $0.bottom.equalTo(tvingLogo.snp.bottom)
            $0.trailing.equalToSuperview().inset(15)
            $0.width.equalTo(23)
            $0.height.equalTo(23)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(tvingLogo.snp.bottom).offset(500)
            $0.leading.equalToSuperview().inset(15)
        }
        popularLabel.snp.makeConstraints {
            $0.top.equalTo(contentCollectionView.snp.bottom).offset(18)
            $0.leading.equalTo(contentLabel.snp.leading)
        }
        arrow.snp.makeConstraints {
            $0.bottom.equalTo(contentLabel.snp.bottom).offset(-2)
            $0.trailing.equalToSuperview().inset(12)
            $0.width.equalTo(10)
            $0.height.equalTo(10)
        }
        showAll.snp.makeConstraints {
            $0.bottom.equalTo(contentLabel.snp.bottom)
            $0.trailing.equalTo(arrow.snp.leading)
        }
        
        
    }
    
    
    private func setStyle() {
        self.navigationController?.navigationBar.isHidden = true
        
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
        
        contentLabel.do {
            $0.text = "박스 오피스 순위!"
            $0.textColor = .white
            $0.textAlignment = .center
            $0.font = UIFont(name: "Pretendard-Semibold", size: 17)
        }
        popularLabel.do {
            $0.text = "인기 LIVE 채널"
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



extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 146)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8 // 셀 간의 간격
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: -5, left: 0, bottom: 10, right: 0)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieTitles.count // movieTitles 배열의 크기 반환
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCollectionViewCell.identifier, for: indexPath) as? ContentCollectionViewCell else { return UICollectionViewCell() }
        
        // movieTitles 배열에서 영화 제목을 가져와 셀에 바인딩
        cell.titleLabel.text = movieTitles[indexPath.item]
        cell.rankLabel.text = movieRanks[indexPath.item]
        
        // itemData 배열에서 이미지를 가져와 셀에 바인딩
        if indexPath.item < itemData.count {
            cell.itemImageView.image = itemData[indexPath.item].itemImg
            //cell.rankLabel.text = itemData[indexPath.item].rank
        }
        
        return cell
    }

    
}


