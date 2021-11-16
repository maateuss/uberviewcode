//
//  TestsHelpers.swift
//  UberCloneFirebaseTests
//
//  Created by Mateus Moura Santos on 16/11/21.
//

import Foundation

class MockNavigationController: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: false)
    }
}
