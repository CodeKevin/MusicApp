//
//  SongListCell.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/24.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class SongListCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
