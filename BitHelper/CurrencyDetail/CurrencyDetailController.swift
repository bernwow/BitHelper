//
//  CurrencyDetailController.swift
//  BitHelper
//
//  Created by Берн on 30.12.2019.
//  Copyright © 2019 Bern. All rights reserved.
//

import UIKit
import Reusable
import BitPrice

class CurrencyDetailController: UIViewController, StoryboardBased {
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceUSDLabel: UILabel!
    @IBOutlet weak var priceBTCLabel: UILabel!
    var model: CryptoCurrency?
    
    static func instantiateWith(_ model: CryptoCurrency) -> CurrencyDetailController {
        let controller = CurrencyDetailController.instantiate()
        controller.model = model
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let model = model {
            title = model.name
            symbolLabel.text = model.symbol
            priceUSDLabel.text = model.priceUsd
            priceBTCLabel.text = model.priceBtc
        }

    }
    
    

}
