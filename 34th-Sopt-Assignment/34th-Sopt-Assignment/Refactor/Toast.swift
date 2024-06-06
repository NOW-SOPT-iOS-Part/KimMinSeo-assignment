//
//  Toast.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 6/5/24.
//

import UIKit

import SnapKit


final class Toast: UIView {
    
    func show(
        message: String,
        view: UIView,
        bottomInset: CGFloat)
    {
        let toastLabel = UILabel()
        
        self.backgroundColor = .gray5
        self.alpha = 1
        self.layer.cornerRadius = 9
        self.isUserInteractionEnabled = false
        
        
        toastLabel.textColor = .white
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.clipsToBounds = true
        toastLabel.numberOfLines = 0
        toastLabel.sizeToFit()
        toastLabel.font = UIFont(name: "Pretendard-Semibold", size: 14)
    
        
        view.addSubview(self)
        self.addSubview(toastLabel)
        
        
        self.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(100)
        }
        
        toastLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.verticalEdges.equalToSuperview().inset(14)
        }
        
        //우와 애니메이션이다
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 1, delay: 1.8, options: .curveEaseOut, animations: {
                self.alpha = 0.0
            }, completion: {_ in
                self.removeFromSuperview()
            })
        })
    }
    
    func show(message: String,
              view: UIView,
              topInset: CGFloat) {
        let toastLabel = UILabel()
        
        self.backgroundColor = .black
        self.alpha = 1
        self.isUserInteractionEnabled = false
        
        
        toastLabel.textColor = .white
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.clipsToBounds = true
        toastLabel.numberOfLines = 0
        toastLabel.sizeToFit()
    
        
        view.addSubview(self)
        self.addSubview(toastLabel)
    
        
        self.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(100)
        }
        
        toastLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.verticalEdges.equalToSuperview().inset(12)
        }
        
        
        UIView.animate(withDuration: 0.6, delay: 0.0, options: .curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 1, delay: 1.8, options: .curveEaseOut, animations: {
                self.alpha = 0.0
            }, completion: {_ in
                self.removeFromSuperview()
            })
        })
    }
    


}

