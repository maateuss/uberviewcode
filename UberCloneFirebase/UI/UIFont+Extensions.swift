//
//  UIFont+Extensions.swift
//  UberCloneFirebase
//
//  Created by Mateus Santos on 09/11/21.
//

import UIKit

extension UIFont {
    static func mainFont(size: CGFloat) -> UIFont? {
        if size < 0 {
            return UIFont(name: "Avenir-Light", size: 14)
        }
        
        return UIFont(name: "Avenir-Light", size: size)
    }
}


