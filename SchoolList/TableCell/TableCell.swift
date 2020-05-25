//
//  TableCell.swift
//  SchoolList
//
//  Created by Ahn on 2020/05/24.
//  Copyright © 2020 ozofweird. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var schoolNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
