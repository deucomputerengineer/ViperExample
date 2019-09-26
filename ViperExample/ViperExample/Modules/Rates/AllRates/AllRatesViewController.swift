//
//  CurrencyDetailViewController.swift
//  ViperExample
//
//  Created by Merve on 22.09.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import Foundation
import UIKit

class AllRatesViewController: BaseViewController {
    

    @IBOutlet weak var allRatesTableView: UITableView!
    
    var presenter: AllRatesPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        presenter?.getAllRates()
    }
    
    func initViews(){
        
        allRatesTableView.isHidden = true
        allRatesTableView.delegate = self
        allRatesTableView.dataSource = self
        
        let tableviewCell = UINib(nibName: "CurrenciesTableViewCell", bundle: nil)
        self.allRatesTableView.register(tableviewCell, forCellReuseIdentifier: "cellID")
        
    }

}

extension AllRatesViewController : AllRatesViewProtocol {
    
    func reloadData() {
        allRatesTableView.isHidden = false
        self.allRatesTableView.reloadData()
    }
    
}


extension AllRatesViewController: UITableViewDelegate{
    
}

extension AllRatesViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 44)
        let header = CurrencyHeader(frame: frame)
        return header
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let currencies = presenter.currencyInfo?.currencyJSONData {
            return currencies.count
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! CurrenciesTableViewCell
        
        if let currencies = presenter.currencyInfo?.currencyJSONData {
            let item = currencies[indexPath.row]
            
            cell.configureWith(item.name ?? "", buy: item.fxRate ?? "", sell: item.fxSellRate ?? "")
        }
        
        return cell
    }
    
    
}


//extension AllRatesViewController: PresenterToViewCurrencyDetailProtocol {
//
//    func onResponseSuccess(info: CurrencyInfoModel) {
//        setData(info)
//    }
//
//    func onResponseFauilere() {
//        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
//    }
//
//
//}
