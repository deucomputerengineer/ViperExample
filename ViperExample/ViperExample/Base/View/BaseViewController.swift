//
//  BaseViewController.swift
//  ViperExample
//
//  Created by Merve on 22.09.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    lazy var loadingView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = true
        view.style = UIActivityIndicatorView.Style.gray
        view.stopAnimating()
        return view
    }()
    
    
    var alert: UIAlertController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(loadingView)
        
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            loadingView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0)
            ])
        
        
    }
    
}

extension BaseViewController: BaseViewProtocol {
    func loading(_ loading: Bool) {
        // loading
        
        if loading {
            loadingView.startAnimating()
            self.view.bringSubviewToFront(loadingView)
        } else {
            loadingView.stopAnimating()
            self.view.sendSubviewToBack(loadingView)
        }
    }
    
    func showAlert(_ message: String) {
        // show Alert
        alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        let dismiss = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert!.addAction(dismiss)
        self.present(alert!, animated: false, completion: nil)
    }
    
    
}
