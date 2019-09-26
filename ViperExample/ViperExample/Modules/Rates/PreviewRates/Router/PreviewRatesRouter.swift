//
//  CurrenciesRouter.swift
//  ViperExample
//
//  Created by Merve on 17.09.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import UIKit

final class PreviewRatesRouter: BaseRouter {
    
    init() {
        
        let mainStoryboard = UIStoryboard.main()
        let view = mainStoryboard.instantiateViewController(withIdentifier: "CurrencyInfoID") as! PreviewRatesController
        super.init(viewController: view)
        
        
        let interactor = PreviewRatesInteractor()
        let presenter = PreviewRatesPresenter(interactor: interactor, router: self, view: view)
        view.presenter = presenter
        
    }
    
}

extension PreviewRatesRouter: PreviewRatesRouterProtocol {
    func navigate(to option: RatesNavigationOption) {
        
        if option == .allList {
            let allListRouter = AllRatesRouter()
            navigationController?.pushRouter(allListRouter)
        }
        
    }
    
    
}
