//
//  ViewController.swift
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

class CurrencyListController: UIViewController, StoryboardBased {
    @IBOutlet weak var tableView: UITableView!
    let disposeBag = DisposeBag()
    let model = CurrencyListModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        model.currencies.filterNil()
            .bind(to: self.tableView.rx.items(cellIdentifier: "currencyCell", cellType: CurrencyCell.self)) { (row, element, cell) in
                cell.setModel(element)
            }
            .disposed(by: disposeBag)
            
        
        tableView.rx.modelSelected(CryptoCurrency.self).subscribe { (currency) in
            
        }.disposed(by: disposeBag)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        model.startUpdating()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        model.stopUpdating()
    }
    
}

