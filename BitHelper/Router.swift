//
//  Router.swift
//  BitHelper
//
//  Created by Берн on 30.12.2019.
//  Copyright © 2019 Bern. All rights reserved.
//

import UIKit
import BitPrice

struct Router {
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func navigateToCurrencyListController() {
        let pushedViewController = CurrencyListController.instantiate()
        viewController?.navigationController?.pushViewController(pushedViewController, animated: true)
    }
    
    func navigateToCurrencyDetailController(model: CryptoCurrency) {
        let pushedViewController = CurrencyDetailController.instantiateWith(model)
        viewController?.navigationController?.pushViewController(pushedViewController, animated: true)
    }
}
