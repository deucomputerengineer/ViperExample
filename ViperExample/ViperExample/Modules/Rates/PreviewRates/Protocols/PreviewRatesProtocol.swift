//
//  CurrenciesProtocol.swift
//  ViperExample
//
//  Created by Merve on 17.09.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import Foundation
import UIKit

enum RatesNavigationOption {
    case allList
}

protocol PreviewRatesViewProtocol: BaseViewProtocol {
    
    func reloadData()
    
}

protocol PreviewRatesPresenterProtocol: BasePresenterProtocol {
    
    var currencyInfo:  [JSONDatum] { get }
    
    func getRates()
    func openAllRatesPage() // event handler button click set method
    func didControlButtonClicked(_ description: String)
    
    
}

protocol PreviewRatesInteractorProtocol: BaseInteractorProtocol {
    
    func fetchRates(_ completion: @escaping (([JSONDatum]) -> Void), errorHandler: @escaping ((String) -> Void))
}

protocol PreviewRatesRouterProtocol: BaseRouterProtocol {
    
    func navigate(to option: RatesNavigationOption)
}



//protocol CurrencyInfoProtocol: class {
//
//    var view: PresenterToViewCurrencyProtocol? {get set}
//    var interactor: PresenterToInteractorCurrencyProtocol? {get set}
//    var router: PresenterToRouterCurrencyProtocol? {get set}
//    func getCurrencyInfo()
//    func showCurrencyDetail(navigationController:UINavigationController)
//
//}
//
//protocol PresenterToViewCurrencyProtocol: class {
//    func onResponseSuccess(info: CurrencyInfoModel)
//    func onResponseFauilere()
//}
//
//protocol PresenterToInteractorCurrencyProtocol:class {
//    var presenter: InteractorToPresenterCurrencyProtocol? {get set}
//    func fetchCurrencyInfo()
//
//}
//
//protocol PresenterToRouterCurrencyProtocol:class {
//    static func createCurrencyInfo() -> CurrenciesViewController
//    func pushToMovieScreen(navigationConroller:UINavigationController)
//
//}
//
//protocol InteractorToPresenterCurrencyProtocol:class {
//    func currencyFetchSuccess(currencyInfo: CurrencyInfoModel)
//    func currencyFetchFailed()
//
//}
