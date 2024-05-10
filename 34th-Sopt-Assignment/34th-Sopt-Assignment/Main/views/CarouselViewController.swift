//
//  CarouselViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 4/30/24.
//

import UIKit
import SnapKit

class CarouselViewController: UIViewController {
    private enum Const {
        static let itemSize = CGSize(width: UIScreen.main.bounds.width, height: 498)
        static let itemSpacing = 0.0
        
        static var insetX: CGFloat {
            (UIScreen.main.bounds.width - Self.itemSize.width) / 2.0
        }
        static var collectionViewContentInset: UIEdgeInsets {
            UIEdgeInsets(top: 0, left: Self.insetX, bottom: 0, right: Self.insetX)
        }
    }
    
    private let collectionViewFlowLayout = UICollectionViewFlowLayout()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
        return view
    }()
    
    private let indicatorStackView = UIStackView()
    
    private var items = MainposterModel.dummy()
    private var previousIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setDelegate()
        setLayout()
        
    }
    
    func setLayout() {
        [indicatorStackView].forEach { [weak self] view in
            guard let self = self else { return }
            self.view.addSubview(view)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(498)
            $0.top.equalToSuperview()
            
        }
        
        view.addSubview(indicatorStackView)
        indicatorStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.top.equalTo(collectionView.snp.bottom).offset(14)
        }
        
    }
    
    func setStyle() {
        collectionViewFlowLayout.do {
            $0.scrollDirection = .horizontal
            $0.itemSize = Const.itemSize
            $0.minimumLineSpacing = Const.itemSpacing
            $0.minimumInteritemSpacing = 0
        }
        collectionView.do {
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
            $0.showsVerticalScrollIndicator = true
            $0.backgroundColor = .clear
            $0.clipsToBounds = true
            $0.register(MainPosterCollectionViewCell.self, forCellWithReuseIdentifier: MainPosterCollectionViewCell.id)
            $0.isPagingEnabled = false
            $0.contentInsetAdjustmentBehavior = .never
            $0.contentInset = Const.collectionViewContentInset
            $0.decelerationRate = .fast
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        for _ in self.items {
            let indicatorView = UIView()
            indicatorView.backgroundColor = .gray
            indicatorView.layer.cornerRadius = 3
            indicatorView.translatesAutoresizingMaskIntoConstraints = false
            self.indicatorStackView.addArrangedSubview(indicatorView)
            
            indicatorView.snp.makeConstraints {
                $0.width.height.equalTo(5)
            }
        }
        indicatorStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    func setDelegate() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
    }
}



extension CarouselViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPosterCollectionViewCell.id, for: indexPath) as! MainPosterCollectionViewCell
        cell.prepare(image: self.items[indexPath.item].itemImg)
        return cell
    }
}

extension CarouselViewController: UICollectionViewDelegateFlowLayout {
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        let scrolledOffsetX = targetContentOffset.pointee.x + scrollView.contentInset.left
        let cellWidth = Const.itemSize.width + Const.itemSpacing
        let index = round(scrolledOffsetX / cellWidth)
        targetContentOffset.pointee = CGPoint(x: index * cellWidth - scrollView.contentInset.left, y: scrollView.contentInset.top)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrolledOffset = scrollView.contentOffset.x + scrollView.contentInset.left
        let cellWidth = Const.itemSize.width + Const.itemSpacing
        let index = Int(round(scrolledOffset / cellWidth))
        
        updateIndicatorColor(index)
    }
    
    private func updateIndicatorColor(_ index: Int) {
        indicatorStackView.arrangedSubviews.forEach { $0.backgroundColor = .gray }
        
        if let currentIndicatorView = indicatorStackView.arrangedSubviews[index] as? UIView {
            currentIndicatorView.backgroundColor = .white
        }
    }
    
}


