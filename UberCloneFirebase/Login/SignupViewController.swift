//
//  SignupViewController.swift
//  UberCloneFirebase
//
//  Created by Mateus Moura Santos on 21/12/21.
//

import UIKit
import SnapKit

class SignupViewController : UIViewController {
    
    // MARK: - Properties
    
    var router: LoginRouterLogic?
    var viewModel: SignupViewModel = SignupViewModel()
    var interactor : LoginBusinessLogic?
    
    lazy var titleLabel: UILabel = {
       var label = UILabel()
        label.text = "UBER"
        label.textColor = .white
        label.font = UIFont.mainFont(size: 36)
        return label
    }()
    
    lazy var emailField: CustomTextField = {
        let ctf = CustomTextField(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x.png"), placeholder: "Email")
        ctf.delegate = self
        return ctf
    }()
    
    lazy var nameField: CustomTextField = {
        let ctf = CustomTextField(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"), placeholder: "Name")
        ctf.delegate = self
        return ctf
    }()
    
    lazy var passwordField: CustomTextField = {
        let ctf = CustomTextField(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), placeholder: "Password", isPassword: true)
        ctf.delegate = self
        return ctf
    }()

    lazy var userTypeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(systemName: "person")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = false
        return imageView
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["User", "Driver"])
        segmentedControl.backgroundColor = .darkGray
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    lazy var signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .mainBlueTint
        button.setTitleColor(.white, for: .normal)
        button.setAttributedTitle(NSAttributedString(string: "Sign up", attributes: [NSAttributedString.Key.font :UIFont.boldSystemFont(ofSize: 20)]), for: .normal)
        button.addTarget(self, action: #selector(handleSignUpPressed), for: .touchUpInside)
        button.layer.cornerRadius = 5
        
        return button
        
    }()
    
    lazy var logInText: UIButton = {
        let button = UIButton(type: .system)
        var attributedText = NSMutableAttributedString(string: "Already have an account? ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)])
        attributedText.append(NSAttributedString(string: "Log In", attributes: [NSAttributedString.Key.foregroundColor : UIColor.mainBlueTint, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]))
        button.setAttributedTitle(attributedText, for: .normal)
        button.addTarget(self, action: #selector(handleLoginPressed), for: .touchUpInside)
        return button
    }()
    // MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .backgroundBlack
        
        
        view.addSubview(titleLabel)
        view.addSubview(emailField)
        view.addSubview(nameField)
        view.addSubview(passwordField)
        view.addSubview(userTypeIcon)
        view.addSubview(segmentedControl)
        view.addSubview(signupButton)
        view.addSubview(logInText)
        
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(8)
        }
        
        emailField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        nameField.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottom ).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(nameField.snp.bottom ).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        userTypeIcon.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.top.equalTo(passwordField.snp.bottom).offset(20)
            make.left.equalTo(passwordField.snp.left)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(userTypeIcon.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
        
        let divider = UIView()
        divider.backgroundColor = .darkGray
        
        view.addSubview(divider)
        divider.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(0.5)
        }
        
        
        signupButton.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom).offset(10)
            
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        logInText.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(5)
            make.centerX.equalToSuperview()
        }
        
    }
    
    // MARK: - Actions
  
    
    @objc func handleSignUpPressed(){
        
        self.viewModel.userType = segmentedControl.selectedSegmentIndex == 1 ? .driver : .rider
        
        guard let name = self.viewModel.name,
              let email = self.viewModel.email,
              let password = self.viewModel.password,
              let userType = self.viewModel.userType else {
            return
        }
        
        let signupModel = SignupModel(name: name, email: email, password: password, type: userType)
        
        self.interactor?.didTrySignup(request: signupModel)
        
    }

    @objc func handleLoginPressed(){
        
        guard let router = router else {
            return
        }
        
        router.backToLoginPage(navController: navigationController)
    }
}

extension SignupViewController : LoginDisplayLogic {
    func presentCustomAlert(message: String) {
        CustomAlert.makeOkAlert(self, message: message)
    }
    
    func presentAlert() {
        CustomAlert.makeOkAlert(self, message: "Um erro ocorreu")
    }
    
    func goToMain() {
        router?.goToMainMenu(navController: self.navigationController)
    }
    
    
}

extension SignupViewController : CustomTextFieldDelegate {
    func didFinishEditing(field: CustomTextField, value: String) {
        if field == self.emailField {
            self.viewModel.email = value
        } else if field == self.nameField {
            self.viewModel.name = value
        } else if field == self.passwordField {
            self.viewModel.password = value
        }
    }
}
