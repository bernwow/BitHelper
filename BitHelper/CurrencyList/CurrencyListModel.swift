//
//  CurrencyListModel.swift
//  BitHelper
//
//  Created by Берн on 30.12.2019.
//  Copyright © 2019 Bern. All rights reserved.
//

import Foundation
import BitPrice
import RxSwift
import RxCocoa

class CurrencyListModel {
    let disposeBag = DisposeBag()
    let bitPrices = BitPrices()
    let currencies = BehaviorRelay<[CryptoCurrency]?>(value: [])
    var timer: Timer?

    func startUpdating() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            if let self = self {
                self.bitPrices.getCurrencies().bind(to: self.currencies).disposed(by: self.disposeBag)
            }
        }
    }
    
    func stopUpdating() {
        if let timer = timer, timer.isValid {
            timer.invalidate()
        }
    }
}
