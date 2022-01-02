//
//  CustomTextField.swift
//  UberCloneFirebase
//
//  Created by Mateus Santos on 09/11/21.
//

import UIKit
import SnapKit

protocol CustomTextFieldDelegate : AnyObject {
    func didFinishEditing(_: CustomTextField, value: String)
}

class CustomTextField : UIView {
    
    // MARK: - Properties
    let image: UIImage?
    let placeholder: String?
    let isPassword: Bool
    
    weak var delegate: CustomTextFieldDelegate?
    
    lazy var icon : UIImageView = {
        let iv = UIImageView(image: image)
        iv.clipsToBounds = true
        iv.tintColor = .white.withAlphaComponent(0.8)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var textInput : UITextField = {
        let tf = UITextField()
        tf.isSecureTextEntry = isPassword
        if let placeholder = placeholder {
            tf.attributedPlaceholder = NSAttributedString(
                string : placeholder,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.8)])
        }
        tf.textColor = .white
        tf.addTarget(self, action: #selector(handleTextChanged), for: .editingChanged)
        return tf
    }()
    
    // MARK: - Lifecycle
    init(image: UIImage?, placeholder: String?, isPassword: Bool = false){
        self.image = image
        self.placeholder = placeholder
        self.isPassword = isPassword
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        
        addSubview(icon)
        icon.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalTo(self).offset(5)
            make.height.width.lessThanOrEqualTo(25)
        }
        
        addSubview(textInput)
        textInput.snp.makeConstraints { make in
            make.left.equalTo(icon.snp.right).offset(5)
            make.right.equalToSuperview()
            make.centerY.equalTo(icon.snp.centerY)
        }
        
        let divider = UIView()
        divider.backgroundColor = .darkGray
        addSubview(divider)
        divider.snp.makeConstraints { make in
            make.top.equalTo(textInput.snp.bottom).offset(10)
            make.height.equalTo(0.5)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
    }
    
    
    @objc func handleTextChanged(){
        guard let delegate = delegate, let input = textInput.text else {
            return
        }
        delegate.didFinishEditing(self, value: input)
    }
    
}
