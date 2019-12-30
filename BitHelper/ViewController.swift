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

class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        let bitPrice = BitPrices()
        
        bitPrice.getCurrencies().bind { (result) in
            print(result ?? "")
        }.disposed(by: disposeBag)
        // Do any additional setup after loading the view.
    }


}

