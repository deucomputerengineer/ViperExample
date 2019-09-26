//
//  CurrencyDetailPresent.swift
//  ViperExample
//
//  Created by Merve on 22.09.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import Foundation

class AllRatesPresent: AllRatesProtocol {
    
    var view: PresenterToViewCurrencyDetailProtocol?
    
    var interactor: PresenterToInteractorCurrencyDetailProtocol?
    
    var router: PresenterToRouterCurrencyDetailProtocol?
    
    func getCurrencyDetail() {
        interactor?.fetchCurrencyDetailInfo()
    }
    
}

//extension CurrencyDetailPresent: InteractorToPresenterCurrencyProtocol {
//    
//    func currencyFetchSuccess(currencyInfo: CurrencyInfoModel) {
//        view?.onResponseSuccess(info: currencyInfo)
//    }
//    
//    func currencyFetchFailed() {
//        view?.onResponseFauilere()
//
//    }
//    
//    
//}
