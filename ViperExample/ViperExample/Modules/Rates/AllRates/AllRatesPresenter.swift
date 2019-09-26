//
//  AllRatesPresenter.swift
//  ViperExample
//
//  Created by Merve on 24.09.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import Foundation


class AllRatesPresenter: BasePresenter {
    
    fileprivate var _currencyInfo : CurrencyInfoModel? {
        didSet {
            view.reloadData()
        }
    }
    
    private unowned var view: AllRatesViewProtocol
    private var interactor: AllRatesInteractorProtocol
    private var router: AllRatesRouterProtocol
    
    init(interactor: AllRatesInteractorProtocol, router: AllRatesRouterProtocol, view: AllRatesViewProtocol) {
        
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension AllRatesPresenter: AllRatesPresenterProtocol {
    
    var currencyInfo: CurrencyInfoModel? {
        return _currencyInfo
    }
    
    func getAllRates() {
        
        self.view.loading(true)
        
        interactor.fetchRates({ [weak self] (data) in
            guard let self = self else { return }
            
            self.view.loading(false)
            self._currencyInfo = data
            
        }) { (error) in
            self.view.loading(false)
            self.view.showAlert(error)
        }
        
        
    }
}
