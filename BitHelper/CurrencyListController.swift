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

class CurrencyListController: UIViewController {
    let disposeBag = DisposeBag()
    let bitPrices = BitPrices()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bitPrices.getCurrencies()
            .filterNil()
            .bind(to: self.tableView.rx.items(cellIdentifier: "currencyCell", cellType: CurrencyCell.self)) { (row, element, cell) in
                cell.setModel(element)
            }
            .disposed(by: disposeBag)
        // Do any additional setup after loading the view.
    }


}

