//
//  LoginViewController.swift
//  UberCloneFirebase
//
//  Created by Mateus Santos on 09/11/21.
//

import UIKit
import SnapKit

class LoginViewController : UIViewController {
    
        
    // MARK: - Properties
    
    weak var router : LoginRouterLogic?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "UBER"
        label.textColor = .white
        label.font = UIFont.mainFont(size: 36)
        return label
    }()
    
    lazy var emailField: CustomTextField = {
        let ctf = CustomTextField(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x.png"), placeholder: "Email")
        return ctf
    }()
    
    lazy var passwordField: CustomTextField = {
        let ctf = CustomTextField(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), placeholder: "Password", isPassword: true)
        return ctf
    }()
    
    lazy var signInText: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        var attributedText = NSMutableAttributedString(string: "Don't have an account? ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)])
        attributedText.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemBlue, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]))
        label.attributedText = attributedText
        label.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleSignUpPressed))
        label.addGestureRecognizer(gesture)
        return label
    }()
    
    lazy var loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.setAttributedTitle(NSAttributedString(string: "Log In", attributes: [NSAttributedString.Key.font :UIFont.boldSystemFont(ofSize: 20)]), for: .normal)
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    // MARK: - Lifecycle
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .backgroundBlack()
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints{ (make) -> Void in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view.layoutMarginsGuide).offset(10)
        }
        view.addSubview(emailField)
        
        emailField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        view.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).offset(10)
            make.left.equalTo(emailField.snp.left)
            make.height.equalTo(50)
            make.right.equalTo(emailField.snp.right)
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(10)
            make.left.equalTo(passwordField.snp.left)
            make.right.equalTo(passwordField.snp.right)
            make.height.equalTo(50)
        }
        
        view.addSubview(signInText)
        signInText.snp.makeConstraints { make in
            make.bottom.equalTo(view.layoutMarginsGuide).inset(5)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    
    @objc func handleSignUpPressed(){
        guard let router = router else {
            return
        }
        
        router.showSignUpPage(navController: navigationController)
    }
    
    // MARK: - Statusbar Style
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
}

