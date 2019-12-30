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
import RxSwift
import RxCocoa

class CurrencyDetailController: UIViewController, StoryboardBased {
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceUSDLabel: UILabel!
    @IBOutlet weak var priceBTCLabel: UILabel!
    var currency: CryptoCurrency?
    let model = CurrencyDetailModel()
    let disposeBag = DisposeBag()
    
    static func instantiateWith(_ model: CryptoCurrency) -> CurrencyDetailController {
        let controller = CurrencyDetailController.instantiate()
        controller.currency = model
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let model = currency {
            updateUI(model: model)
        }

        model.currencyContainer.asDriver().drive(onNext: { [unowned self] (currencies) in
            if let value = currencies.value, let model = value.first {
                
                self.updateUI(model: model)
            }
            }).disposed(by: disposeBag)
    }
    
    func updateUI(model: CryptoCurrency) {
        title = model.name
        symbolLabel.text = model.symbol
        priceUSDLabel.text = model.priceUsd
        priceBTCLabel.text = model.priceBtc
    }

    @IBAction func updatePriceTapped(_ sender: Any) {
        if let currencyId = currency?.id {
            model.updateCurrency(currencyId)
        }
    }
}
