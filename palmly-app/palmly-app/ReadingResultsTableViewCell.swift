//
//  ReadingResultsTableViewCell.swift
//  palmly-app
//
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import UIKit

class ReadingResultsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var attribute: UILabel!
    @IBOutlet weak var attributeValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
