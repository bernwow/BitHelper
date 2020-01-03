//
//  StartScreenController.swift
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

class StartScreenController: UIViewController, StoryboardBased {
    @IBOutlet weak var showButton: UIButton!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showButton.rx.tap.asDriver().drive(onNext: { [unowned self] _ in
            Router(viewController: self).navigateToCurrencyListController()
        }).disposed(by: disposeBag)
    }
}
