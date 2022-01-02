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
    
    lazy var titleLabel: UILabel = {
       var label = UILabel()
        
        label.text = "Create account"
        label.textColor = .white
        label.font = UIFont.mainFont(size: 36)
        return label
    }()
    
    
    
    
    // MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .red
    }
    
    // MARK: - Actions
            
}
