//
//  CurrencyDetailProtocol.swift
//  ViperExample
//
//  Created by Merve on 22.09.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import Foundation

protocol AllRatesViewProtocol: BaseViewProtocol {
    func reloadData()

}

protocol AllRatesPresenterProtocol: BasePresenterProtocol {
    var currencyInfo: CurrencyInfoModel? { get }
    
    func getAllRates()
}


protocol AllRatesInteractorProtocol: BaseInteractorProtocol {
    func fetchRates(_ completion: @escaping ((CurrencyInfoModel) -> Void), errorHandler: @escaping ((String) -> Void))

}

protocol AllRatesRouterProtocol: BaseRouterProtocol {
    func navigate(to option: RatesNavigationOption)
    
}
