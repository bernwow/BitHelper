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
    @IBOutlet weak var updateButton: UIButton!
    
    let model = CurrencyDetailModel()
    let disposeBag = DisposeBag()
    
    static func instantiateWith(_ model: CryptoCurrency) -> CurrencyDetailController {
        let controller = CurrencyDetailController.instantiate()
        controller.model.currencyContainer.accept([model])
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        model.currencyContainer.asDriver().drive(onNext: { [unowned self] (currencies) in
            if let value = currencies.value, let model = value.first {
                self.updateUI(model)
            }
        }).disposed(by: disposeBag)
        
        updateButton.rx.tap.asDriver().drive(onNext: { [unowned self] _ in
            self.model.updateCurrency()
        }).disposed(by: disposeBag)
    }
    
    func updateUI(_ model: CryptoCurrency) {
        title = model.name
        symbolLabel.text = model.symbol
        priceUSDLabel.text = model.priceUsd
        priceBTCLabel.text = model.priceBtc
    }

}
