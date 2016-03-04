
//
//  instaCellTableViewCell.swift
//  InstaPics
//
//  Created by Zhipeng Mei on 3/3/16.
//  Copyright © 2016 Zhipeng Mei. All rights reserved.
//

import UIKit

class instaCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var imageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
