//
//  AccountCloseRouter.swift
//  ViperExample
//
//  Created by Merve on 24.09.2019.
//  Copyright (c) 2019 Merve Sahan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class AccountCloseRouter: BaseRouter {
    
    
    init() {
        
        let mainStoryboard = UIStoryboard.main()
        let view = mainStoryboard.instantiateViewController(withIdentifier: "DetailID") as! AccountCloseViewController
        super.init(viewController: view)
        
        
        let interactor = AccountCloseInteractor()
        let presenter = AccountClosePresenter(interactor: interactor, router: self, view: view)
        view.presenter = presenter
    }
    
    
    
}
extension AccountCloseRouter: AccountCloseRouterProtocol {
    func navigate(to option: RatesNavigationOption) {
        
        if option == .allList {
            let allListRouter = AllRatesRouter()
            navigationController?.pushRouter(allListRouter)
        }
        
    }
    
    
}
