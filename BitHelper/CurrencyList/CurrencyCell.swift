//
//  CurrencyCell.swift
//  BitHelper
//
//  Created by Берн on 30.12.2019.
//  Copyright © 2019 Bern. All rights reserved.
//

import UIKit
import BitPrice

class CurrencyCell: UITableViewCell {

    func setModel(_ model: CryptoCurrency) {
        textLabel?.text = model.name
    }
    
}
