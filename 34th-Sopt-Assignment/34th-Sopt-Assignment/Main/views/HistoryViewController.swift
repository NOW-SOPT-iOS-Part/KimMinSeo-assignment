//
//  historyViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 4/30/24.
//


import UIKit
import Then
import SnapKit


final class HistoryViewController: UIViewController {
    
    private let viewLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setStyle()
    }
    
    
    private func setStyle(){
        viewLabel.do {
            $0.text = "기록"
            $0.textColor = .white
            $0.textAlignment = .center
            $0.font = UIFont(name: "Pretendard-Semibold", size: 17)
            
        }
    }
    
    private func setLayout() {
        self.view.backgroundColor = .black
        [viewLabel].forEach { [weak self] view in
            guard let self = self else { return }
            self.view.addSubview(view)
        }
        viewLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }

}


