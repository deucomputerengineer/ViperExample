//
//  CurrencyDetailRouter.swift
//  ViperExample
//
//  Created by Merve on 22.09.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import Foundation
import UIKit

class AllRatesRouter: BaseRouter {

    
    init() {
        
        let mainStoryboard = UIStoryboard.main()
        let view = mainStoryboard.instantiateViewController(withIdentifier: "DetailID") as! AllRatesViewController
        super.init(viewController: view)
        
        
        let interactor = AllRatesInteractor()
        let presenter = AllRatesPresenter(interactor: interactor, router: self, view: view)
        view.presenter = presenter
    }
    
    
    
}
extension AllRatesRouter: AllRatesRouterProtocol {
    func navigate(to option: RatesNavigationOption) {
        
        if option == .allList {
            let allListRouter = AllRatesRouter()
            navigationController?.pushRouter(allListRouter)
        }
        
    }
    
    
}
