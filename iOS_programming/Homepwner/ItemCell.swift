//
//  ItemCell.swift
//  Homepwner
//
//  Created by Shim Sooyeon on 2017. 10. 6..
//  Copyright © 2017년 Shim Sooyeon. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    func updateLabels() {
        let bodyFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        nameLabel.font = bodyFont
        valueLabel.font = bodyFont
        
        let caption1Font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption1)
        serialNumberLabel.font = caption1Font
    }
}
