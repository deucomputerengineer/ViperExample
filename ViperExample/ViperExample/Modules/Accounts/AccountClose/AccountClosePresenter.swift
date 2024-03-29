//
//  AccountClosePresenter.swift
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

class AccountClosePresenter: BasePresenter {
    
    fileprivate var _currencyInfo : CurrencyInfoModel? {
        didSet {
            view.reloadData()
        }
    }
    
    private unowned var view: AccountCloseViewProtocol
    private var interactor: AccountCloseInteractorProtocol
    private var router: AccountCloseRouterProtocol
    
    init(interactor: AccountCloseInteractorProtocol, router: AccountCloseRouterProtocol, view: AccountCloseViewProtocol) {
        
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension AccountClosePresenter: AccountClosePresenterProtocol {
    
    var currencyInfo: CurrencyInfoModel? {
        return _currencyInfo
    }
    
    func getAllRates() {
        
        self.view.loading(true)
        
        interactor.fetchRates({ [weak self] (data) in
            guard let self = self else { return }
            
            self.view.loading(false)
           // self._currencyInfo = data
            
        }) { (error) in
            self.view.loading(false)
            self.view.showAlert(error)
        }
        
        
    }
}
