//
//  CurrenciesViewController.swift
//  ViperExample
//
//  Created by Merve on 17.09.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import UIKit

class PreviewRatesController: BaseViewController {
    
    @IBAction func btnClicked(_ sender: Any) {
        
        presenter.openAllRatesPage()
    
    }
    
    @IBOutlet weak var btnCont: UIButton!
    var presenter: PreviewRatesPresenterProtocol!
    
    @IBOutlet weak var txtDescp: UITextField!
    @IBAction func btnControl(_ sender: Any) {
        
        presenter.didControlButtonClicked(txtDescp.text ?? "")
        
    }

    
    @IBOutlet weak var btnSecondPage: UIButton!
    @IBOutlet weak var tableViewCurrencies: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Kurlar"
        
        initViews()
        presenter?.getRates()
    }
    
    func initViews(){
        
        tableViewCurrencies.isHidden = true
        tableViewCurrencies.delegate = self
        tableViewCurrencies.dataSource = self
        
        let tableviewCell = UINib(nibName: "CurrenciesTableViewCell", bundle: nil)
        self.tableViewCurrencies.register(tableviewCell, forCellReuseIdentifier: "cellID")
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableViewHeightConstraint.constant = tableViewCurrencies.contentSize.height
    }

    
}

extension PreviewRatesController : PreviewRatesViewProtocol {
    func reloadData() {
        tableViewCurrencies.isHidden = false
        self.tableViewCurrencies.reloadData()
    }
}

extension PreviewRatesController: UITableViewDelegate{
    
}

extension PreviewRatesController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 44)
        let header = CurrencyHeader(frame: frame)
        return header
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let presenter = presenter {
            return presenter.currencyInfo.count
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! CurrenciesTableViewCell
        
        if let presenter = presenter {
            let item = presenter.currencyInfo[indexPath.row]
            cell.configureWith(item.name ?? "", buy: item.fxRate ?? "", sell: item.fxSellRate ?? "")
        }
        
        return cell
    }
    
    
}

