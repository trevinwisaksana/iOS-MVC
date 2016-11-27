//
//  TableViewCell.swift
//  Memorizing Calculator
//
//  Created by Trevin Wisaksana on 11/21/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import UIKit

class CalculationsTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var calculationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
