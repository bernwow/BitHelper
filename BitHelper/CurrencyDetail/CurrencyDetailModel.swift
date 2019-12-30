//
//  CurrencyDetailModel.swift
//  BitHelper
//
//  Created by Берн on 30.12.2019.
//  Copyright © 2019 Bern. All rights reserved.
//

import Foundation
import BitPrice
import RxSwift
import RxCocoa

class CurrencyDetailModel {
    let disposeBag = DisposeBag()
    let bitPrices = BitPrices()
    let currencyContainer = BehaviorRelay<[CryptoCurrency]?>(value: [])
    
    func updateCurrency(_ currencyId: String) {
        bitPrices.getCurrency(currencyId: currencyId).bind(to: currencyContainer).disposed(by: disposeBag)
    }
}
