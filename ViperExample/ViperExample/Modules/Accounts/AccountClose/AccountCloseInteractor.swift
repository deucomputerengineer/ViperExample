//
//  AccountCloseInteractor.swift
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

class AccountCloseInteractor: BaseInteractor {
    
    let networkLayer = NetworkLayer()
}

extension AccountCloseInteractor: AccountCloseInteractorProtocol {
    
    func fetchRates(_ completion: @escaping ((AccountClose) -> Void), errorHandler: @escaping ((String) -> Void)) {
        
        let successHandler: (CurrencyInfoModel) -> Void = {(data) in
            //completion(data)
        }
        
        let errorHandler: (String) -> Void = { (error) in
            errorHandler(error)
        }
        
        networkLayer.get(urlString: "https://mobilemw.qnbfinansbank.com/Generic/GetCurrencyListWithoutSession.ashx", successHandler: successHandler, errorHandler: errorHandler)
    }
    
    
}
