//
//  CurrenciesInteractor.swift
//  ViperExample
//
//  Created by Merve on 17.09.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import Foundation

class PreviewRatesInteractor: BaseInteractor {
    
    let networkLayer = NetworkLayer()
    
    fileprivate func prepareData(_ data : CurrencyInfoModel) -> [JSONDatum] {
        
        var arr = [JSONDatum]()
        
        if let jsonArr = data.currencyJSONData {
            
            for x in 0...5 {
                
                
                
                
                arr.append(jsonArr[x])
            }
        }
        
        return arr
        
    }
}

extension PreviewRatesInteractor: PreviewRatesInteractorProtocol{
    
    
    func fetchRates(_ completion: @escaping (([JSONDatum]) -> Void), errorHandler: @escaping ((String) -> Void)) {


        let successHandler: (CurrencyInfoModel) -> Void = {[weak self] (data) in
            guard let self = self else { return }
            let realData = self.prepareData(data)
            completion(realData)
        }

        let errorHandler: (String) -> Void = { (error) in
            errorHandler(error)
        }

        networkLayer.get(urlString: "https://mobilemw.qnbfinansbank.com/Generic/GetCurrencyListWithoutSession.ashx", successHandler: successHandler, errorHandler: errorHandler)

    }
    
    
    
}
