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
    private let locationManager = CLLocationManager()
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
        enableLocationServices()
        checkIfUserIsLoggedIn()
        configureMap()
    }
    
    // MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .green
        navigationController?.isNavigationBarHidden = true
        
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        mapView.delegate = self
        view.addSubview(logoutButton)
        logoutButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(8)
        }
    }
    
    func configureMap(){
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
    
    func checkIfUserIsLoggedIn(){
        if Auth.auth().currentUser?.uid == nil {
            goToLoginScreen()
        } else {
            print("User logged!")
        }
    }
    
    func goToLoginScreen(){
        let loginVC = LoginFactory.makeLoginController(delegate: self)
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

// MARK: - LoginJourney

extension HomeViewController : LoginJourney {
    func didFinishLoginJourney() {
        print("YAY!!")
    }
    
    
}

// MARK: - MapServices

extension HomeViewController : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let userCenter = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let coordinate = MKCoordinateRegion(center: userCenter, span: MKCoordinateSpan(latitudeDelta: 180, longitudeDelta: 180))
        mapView.setRegion(coordinate, animated: true)
   
    }
}


// MARK: - LocationServices
extension HomeViewController : CLLocationManagerDelegate {
    func enableLocationServices() {
        locationManager.delegate = self
       
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            print("DEBUG: \(CLLocationManager.authorizationStatus().rawValue)")
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("DEBUG: \(CLLocationManager.authorizationStatus().rawValue)")
        case .denied:
            print("DEBUG: \(CLLocationManager.authorizationStatus().rawValue)")
        case .authorizedAlways:
            print("DEBUG: \(CLLocationManager.authorizationStatus().rawValue)")
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        case .authorizedWhenInUse:
            print("DEBUG: \(CLLocationManager.authorizationStatus().rawValue)")
            locationManager.requestAlwaysAuthorization()
        @unknown default:
            print("DEBUG: \(CLLocationManager.authorizationStatus().rawValue)")
        }
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = CLLocationManager.authorizationStatus()
        
        if status == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
}
