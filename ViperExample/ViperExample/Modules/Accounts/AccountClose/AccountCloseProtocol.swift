//
//  AccountCloseProtocol.swift
//  ViperExample
//
//  Created by Merve on 24.09.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import Foundation

protocol AccountCloseViewProtocol: BaseViewProtocol {
    func reloadData()
    
}

protocol AccountClosePresenterProtocol: BasePresenterProtocol {
    var currencyInfo: CurrencyInfoModel? { get }
    
    func getAllRates()
}


protocol AccountCloseInteractorProtocol: BaseInteractorProtocol {
    func fetchRates(_ completion: @escaping ((AccountClose) -> Void), errorHandler: @escaping ((String) -> Void))
    
}

protocol AccountCloseRouterProtocol: BaseRouterProtocol {
    func navigate(to option: RatesNavigationOption)
    
}
