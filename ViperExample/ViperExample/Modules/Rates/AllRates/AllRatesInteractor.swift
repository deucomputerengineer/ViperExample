//
//  CurrencyDetailInteractor.swift
//  ViperExample
//
//  Created by Merve on 22.09.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import Foundation


class AllRatesInteractor: BaseInteractor {
    
    let networkLayer = NetworkLayer()
}

extension AllRatesInteractor: AllRatesInteractorProtocol {
    
    func fetchRates(_ completion: @escaping ((CurrencyInfoModel) -> Void), errorHandler: @escaping ((String) -> Void)) {
        
        let successHandler: (CurrencyInfoModel) -> Void = {(data) in
            completion(data)
        }
        
        let errorHandler: (String) -> Void = { (error) in
            errorHandler(error)
        }
        
        networkLayer.get(urlString: "https://mobilemw.qnbfinansbank.com/Generic/GetCurrencyListWithoutSession.ashx", successHandler: successHandler, errorHandler: errorHandler)
    }
    
    
}



//class AllRatesInteractor: PresenterToInteractorCurrencyDetailProtocol {
//
//    var presenter: InteractorToPresenterCurrencyDetailProtocol?
//
//    let networkLayer = NetworkLayer()
//
//
//    func fetchCurrencyDetailInfo() {
//        let successHandler: (CurrencyInfoModel) -> Void = { [weak self] (data) in
//            self?.prepareData(data)
//        }
//
//        let errorHandler: (String) -> Void = { [weak self] (error) in
//            self?.presenter?.currencyFetchFailed()
//        }
//
//        networkLayer.get(urlString: "https://mobilemw.qnbfinansbank.com/Generic/GetCurrencyListWithoutSession.ashx", successHandler: successHandler, errorHandler: errorHandler)
//    }
//
//
//    fileprivate func prepareData(_ data : CurrencyInfoModel){
//
//        presenter?.currencyFetchSuccess(currencyInfo: data)
//
//    }
//
//
//
//}
