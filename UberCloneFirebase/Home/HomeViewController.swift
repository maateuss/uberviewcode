//
//  HomeViewController.swift
//  UberCloneFirebase
//
//  Created by Mateus Moura Santos on 09/01/22.
//

import UIKit
import Firebase
import MapKit


class HomeViewController : UIViewController {
    
    // MARK: - Properties
    
    lazy var mapView = MKMapView()
    lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        button.setTitleColor(.backgroundBlack, for: .normal)
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        checkIfUserIsLoggedIn()
    }
    
    // MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .green
        navigationController?.isNavigationBarHidden = true
        
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(logoutButton)
        logoutButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(8)
        }
    }
    
    func checkIfUserIsLoggedIn(){
        if Auth.auth().currentUser?.uid == nil {
           goToLoginScreen()
        } else {
            print("User logged!")
        }
    }
    
    func goToLoginScreen(){
        let loginVC = LoginFactory.makeLoginController()
        self.navigationController?.pushViewController(loginVC, animated: false)
    }
    
    
    // MARK: - Actions:
        
    @objc func handleLogout(){
        do {
            try Auth.auth().signOut()
            goToLoginScreen()
        } catch {
            print("Error logging out!")
        }
    }

}
