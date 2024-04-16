//
//  BottomSheetViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 4/15/24.
//

import UIKit

class BottomSheetViewController: UIViewController {
    
    private let bottomSheetView: UIView = {
            let view = UIView()
            view.backgroundColor = .white

            // 좌측 상단과 좌측 하단의 cornerRadius를 10으로 설정한다.
            view.layer.cornerRadius = 10
            view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            view.clipsToBounds = true
            return view
        }()
    
    private var bottomSheetViewTopConstraint: NSLayoutConstraint!
    // 1
    private let dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()
    
    // 2
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // 3
    private func setupUI() {
        view.addSubview(dimmedView)
        view.addSubview(bottomSheetView);       setupLayout()
    }
    
    // 4
    private func setupLayout() {
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        bottomSheetView.translatesAutoresizingMaskIntoConstraints = false

                // topConstant 값을 300으로 바꾸어준다. 이 때 타입을 CGFloat로 명시해주어야 한다.
            let topConstant: CGFloat = 300

            bottomSheetViewTopConstraint = bottomSheetView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstant)
            NSLayoutConstraint.activate([
                bottomSheetView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                bottomSheetView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                bottomSheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                bottomSheetViewTopConstraint,
            ])
    }
}
