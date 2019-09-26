//
//  BaseRouter.swift
//  ViperExample
//
//  Created by Merve on 22.09.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import Foundation
import UIKit

class BaseRouter {
    
    unowned var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
}

extension BaseRouter: BaseRouterProtocol {
    
}


extension UIViewController {
    
    func presentRouter(_ router: BaseRouter, animated: Bool = true, completion: (()->())? = nil) {
        present(router.viewController, animated: animated, completion: completion)
    }
    
}

extension UINavigationController {
    
    func pushRouter(_ router: BaseRouter, animated: Bool = true) {
        self.pushViewController(router.viewController, animated: animated)
    }
    
    func setRootRouter(_ router: BaseRouter, animated: Bool = true) {
        self.setViewControllers([router.viewController], animated: animated)
    }
    
}

extension UIStoryboard {
    
    static func main() -> UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    
    
}




