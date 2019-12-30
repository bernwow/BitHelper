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

class CurrencyListController: UIViewController, StoryboardBased {
    @IBOutlet weak var tableView: UITableView!
    let disposeBag = DisposeBag()
    let model = CurrencyListModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Currency list"
        
        model.currencies.filterNil()
            .bind(to: self.tableView.rx.items(cellIdentifier: "currencyCell", cellType: CurrencyCell.self)) { (row, element, cell) in
                cell.setModel(element)
            }
            .disposed(by: disposeBag)
            
        tableView.rx.modelSelected(CryptoCurrency.self).asDriver().drive(onNext: { [unowned self] (currency) in
           
            Router(viewController: self).navigateToCurrencyDetailController(model: currency)
            
        }).disposed(by: disposeBag)

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

