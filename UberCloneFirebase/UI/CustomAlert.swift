//
//  CustomAlert.swift
//  UberCloneFirebase
//
//  Created by Mateus Moura Santos on 09/01/22.
//

import UIKit

struct CustomAlert {
    static func makeOkAlert(_ vc: UIViewController, message: String){
        let alertview = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        
        alertview.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
            vc.dismiss(animated: true, completion: nil)
        }))
        
        vc.present(alertview, animated: true)
    }
    
    
    
}
