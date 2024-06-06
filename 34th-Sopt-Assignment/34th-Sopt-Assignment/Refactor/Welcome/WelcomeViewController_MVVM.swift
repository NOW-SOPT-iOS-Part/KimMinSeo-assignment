//
//  WelcomeViewController_MVVM.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 6/7/24.
//

// WelcomeViewController_MVVM.swift
import UIKit

final class WelcomeViewController_MVVM: UIViewController {
    private let rootView = WelcomeView()
    private let viewModel: WelcomeViewModel

    init(viewModel: WelcomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setTarget()
        displayUserId()
    }
    
    private func setTarget() {
        rootView.mainButton.addTarget(self, action: #selector(mainButtonDidTap), for: .touchUpInside)
    }

    @objc
    private func mainButtonDidTap() {
        pushToMainVC()
    }
    
    private func pushToMainVC() {
        let mainViewController = MainViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }

    private func displayUserId() {
        guard let userId = viewModel.id else { return }
        rootView.welcomeText.text = "\(userId)님\n반가워요!"
    }
}
