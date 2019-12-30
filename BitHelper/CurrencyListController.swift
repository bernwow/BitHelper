//
//  ViewController.swift
//  BitHelper
//
//  Created by Берн on 30.12.2019.
//  Copyright © 2019 Bern. All rights reserved.
//

import UIKit
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
}

class CurrencyListController: UIViewController {
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
        
//        tableView.rx.itemSelected.bind { (indexPath) in
//            self.model.currencies.value?[indexPath.row]
//        }.disposed(by: disposeBag)
    }


}

