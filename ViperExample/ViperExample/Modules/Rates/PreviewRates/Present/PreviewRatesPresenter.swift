//
//  CurrenciesPresent.swift
//  ViperExample
//
//  Created by Merve on 17.09.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import Foundation
import UIKit

class PreviewRatesPresenter: BasePresenter {
    
    fileprivate var _currencyInfo : [JSONDatum] = [] {
        didSet {
            view.reloadData()
        }
    }
    
    private unowned let view: PreviewRatesViewProtocol
    private let interactor: PreviewRatesInteractorProtocol
    private let router: PreviewRatesRouterProtocol
    
    init(interactor: PreviewRatesInteractorProtocol, router: PreviewRatesRouterProtocol, view: PreviewRatesViewProtocol) {
        self.interactor = interactor
        self.view = view
        self.router = router
    }
    
}

extension PreviewRatesPresenter: PreviewRatesPresenterProtocol {
    
    func didControlButtonClicked(_ description: String) {
        
        if description.isEmpty {
            view.showAlert("Boş bırakmayalım.")
        }
    }
    
    
    func openAllRatesPage() {
        router.navigate(to: .allList)
    }
    var currencyInfo:  [JSONDatum] {
        return _currencyInfo
    }
    
    func getRates() {
        
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
