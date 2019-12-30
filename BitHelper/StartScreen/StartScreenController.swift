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

class StartScreenController: UIViewController, StoryboardBased {
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func startButtonTapped(_ sender: Any) {
        Router(viewController: self).navigateToCurrencyListController()
    }
}
