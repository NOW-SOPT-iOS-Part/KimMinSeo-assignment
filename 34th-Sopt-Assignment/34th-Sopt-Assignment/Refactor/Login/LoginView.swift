import UIKit
import SnapKit

final class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let loginLabel = UILabel()
    let idTextField = UITextField()
    let passwordTextField = UITextField()
    lazy var loginButton = UIButton()
    let hiddenIcon = UIButton()
    let deleteIcon = UIButton()
    private let findId = UILabel()
    private let findPassword = UILabel()
    private let askAccount = UILabel()
    private let createNickname = UILabel()
    private let centerLine = UIView()
    
    private func setLayout() {
        self.backgroundColor = .black
        
        [
            loginLabel,
            idTextField,
            passwordTextField,
            loginButton,
            findId,
            findPassword,
            askAccount,
            createNickname,
            centerLine,
            deleteIcon,
            hiddenIcon
        ].forEach {
            self.addSubview($0)
        }
        
        
        loginLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(112)
            $0.leading.equalToSuperview().inset(107)
            $0.trailing.equalToSuperview().inset(107)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(27)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        findId.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(92)
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
        }
        
        findPassword.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(79)
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
        }
        
        askAccount.snp.makeConstraints {
            $0.top.equalTo(findId.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(58)
        }
        
        createNickname.snp.makeConstraints {
            $0.top.equalTo(findId.snp.bottom).offset(28)
            $0.trailing.equalToSuperview().inset(58)
        }
        
        centerLine.backgroundColor = .gray4
        centerLine.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(36)
            $0.center.equalToSuperview()
            $0.width.equalTo(1)
            $0.height.equalTo(12)
        }
        
        deleteIcon.snp.makeConstraints {
            $0.trailing.equalTo(hiddenIcon.snp.leading).offset(-16)
            $0.centerY.equalTo(passwordTextField)
            $0.width.height.equalTo(20)
        }
        
        hiddenIcon.snp.makeConstraints {
            $0.trailing.equalTo(passwordTextField).offset(-20)
            $0.centerY.equalTo(passwordTextField)
            $0.width.height.equalTo(20)
        }
    }
    
    private func setStyle() {
        // 타이틀 텍스트
        loginLabel.do {
            $0.text = "TVING ID 로그인"
            $0.textColor = UIColor(resource: .gray1)
            $0.textAlignment = .center
            $0.numberOfLines = 2
            $0.font = UIFont(name: "Pretendard-Medium", size: 23)
        }
        
        // 아이디 입력창
        idTextField.do {
            $0.font = UIFont(name: "Pretendard-Semibold", size: 14)
            $0.backgroundColor = UIColor(resource: .gray4)
            $0.layer.cornerRadius = 3
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: $0.frame.height))
            $0.leftView = paddingView
            $0.leftViewMode = .always
            $0.textColor = UIColor(resource: .gray2)
            
            // placeholder의 색상을 변경
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.gray2, // 변경하고자 하는 색상
                .font: UIFont(name: "Pretendard-Semibold", size: 15) ?? UIFont.systemFont(ofSize: 15) // 폰트 설정 (nil 방지를 위한 기본 폰트)
            ]
            let attributedPlaceholder = NSAttributedString(string: "아이디", attributes: attributes)
            $0.attributedPlaceholder = attributedPlaceholder
        }
        
        passwordTextField.do {
            $0.font = UIFont(name: "Pretendard-Semibold", size: 14)
            $0.backgroundColor = UIColor(resource: .gray4)
            $0.layer.cornerRadius = 3
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: $0.frame.height))
            $0.leftView = paddingView
            $0.leftViewMode = .always
            $0.textColor = UIColor(resource: .gray2)
            $0.isSecureTextEntry = true
            //눈 아이콘 추가
            $0.rightView = hiddenIcon
            //클리어 버튼 추가
            $0.rightView = deleteIcon
            
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.gray2,
                .font: UIFont(name: "Pretendard-Semibold", size: 15) ?? UIFont.systemFont(ofSize: 15)
            ]
            let attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: attributes)
            $0.attributedPlaceholder = attributedPlaceholder
        }
        
        // 로그인
        loginButton.do {
            $0.backgroundColor = .black
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Semibold", size: 14)
            $0.layer.cornerRadius = 3
            $0.layer.borderWidth = 1 // 테두리 두께
            $0.layer.borderColor = UIColor.gray4.cgColor // 테두리 색상
        }
        
        // 처음에는 안보이게
        hiddenIcon.isHidden = true
        deleteIcon.isHidden = true
        
        hiddenIcon.do {
            $0.setImage(UIImage(resource: .passwordHidden), for: .normal)
        }
        
        deleteIcon.do {
            $0.setImage(UIImage(resource: .xCircle), for: .normal)
        }
        
        findId.do {
            $0.text = "아이디 찾기"
            $0.textColor = UIColor(resource: .gray2)
            $0.textAlignment = .center
            $0.font = UIFont(name: "Pretendard-Semibold", size: 14)
        }
        
        findPassword.do {
            $0.text = "비밀번호 찾기"
            $0.textColor = UIColor(resource: .gray2)
            $0.textAlignment = .center
            $0.font = UIFont(name: "Pretendard-Semibold", size: 14)
        }
        
        askAccount.do {
            $0.text = "아직 계정이 없으신가요?"
            $0.textColor = UIColor(resource: .gray3)
            $0.textAlignment = .center
            $0.font = UIFont(name: "Pretendard-Semibold", size: 14)
        }
        
        createNickname.do {
            $0.text = "닉네임 만들러가기"
            $0.textColor = UIColor(resource: .gray2)
            $0.textAlignment = .center
            $0.font = UIFont(name: "Pretendard-Semibold", size: 14)
            
            // underline을 추가하는 NSAttributedString 생성
            let attributedString = NSAttributedString(string: "닉네임 만들러가기", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
            $0.attributedText = attributedString
            
            // UILabel의 사용자 상호작용 활성화
            $0.isUserInteractionEnabled = true
        }
    }
}

