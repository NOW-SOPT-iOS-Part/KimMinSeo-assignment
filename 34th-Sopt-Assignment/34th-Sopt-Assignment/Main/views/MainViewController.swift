//
//  ViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 4/30/24.
//

import UIKit
import SnapKit
import Then


final class MainViewController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.hidesBackButton = true
        setTabbar()
        setAttribute()
    }
    
    // MARK: - Tabbar Setting
    func setTabbar() {
        let appearanceTabbar = UITabBarAppearance()
        appearanceTabbar.configureWithOpaqueBackground()
        appearanceTabbar.backgroundColor = UIColor.black

        tabBar.standardAppearance = appearanceTabbar
        tabBar.scrollEdgeAppearance = appearanceTabbar // 추가
        
        tabBar.tintColor = .white //눌렸을때 아이콘, 글씨색
        
    }

    // MARK: - Tabbar 화면이동 및 눌렸을때/눌리지 않았을때 이미지 Set
    func setAttribute() {
            
            // MARK: - UIBar Create NavigtaionController
            viewControllers = [
              createNavController(for: HomeViewController(), title: NSLocalizedString("홈", comment: ""), image: UIImage(named: "home")!, selectedImage: UIImage(named: "home")!), //UIImage(named)들은 바꾸셔야합니다.
              createNavController(for: ExpectedViewController(), title: NSLocalizedString("북마크", comment: ""), image: UIImage(named: "expected")!, selectedImage: UIImage(named: "expected")!),
              createNavController(for: SearchViewController(), title: NSLocalizedString("검색", comment: ""), image: UIImage(named: "search")!, selectedImage: UIImage(named: "search")!),
              createNavController(for: HistoryViewController(), title: NSLocalizedString("내정보", comment: ""), image: UIImage(named: "history")!, selectedImage: UIImage(named: "history")!)
            ]
        }
   
    
    // MARK: - Tabbar 화면이동 및 눌렸을때/눌리지 않았을때 이미지 Set
    fileprivate func createNavController(for rootViewController: UIViewController, title: String?, image: UIImage, selectedImage: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController:  rootViewController)
        navController.navigationBar.isTranslucent = false
        navController.navigationBar.backgroundColor = .gray4
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage = selectedImage
        navController.interactivePopGestureRecognizer?.delegate = nil // 스와이프 제스처 enable true
        return navController
    }
    
}
