//
//  CurrenciesTableViewCell.swift
//  ViperExample
//
//  Created by Merve on 17.09.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import UIKit

class CurrenciesTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblBuy: UILabel!
    @IBOutlet weak var lblSell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        
        lblName.font = UIFont.init(name: "Helvetica", size: 16)
        lblName.textColor = .black
        
        lblBuy.font = UIFont.init(name: "Helvetica", size: 16)
        lblBuy.textColor = .black
        
        lblSell.font = UIFont.init(name: "Helvetica", size: 16)
        lblSell.textColor = .black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWith(_ name: String , buy: String, sell: String){
        
        lblName.text = name
        lblBuy.text = buy
        lblSell.text = sell
    }
    
}
