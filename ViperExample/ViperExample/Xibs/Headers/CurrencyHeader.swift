//
//  CurrencyHeader.swift
//  ViperExample
//
//  Created by Merve on 22.09.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import UIKit

class CurrencyHeader: UIView {

    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("CurrencyHeader", owner: self, options: nil)
        addSubview(contentView)
        self.contentView.frame = self.bounds
        self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
