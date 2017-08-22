//
//  MagazineDesCell.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/21.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class MagazineDesCell: UITableViewCell {

    @IBOutlet weak var desLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    class func contentHeight(_ desString: NSString) -> CGFloat {
        let rect = desString.boundingRect(with: CGSize(width: SCREENW - 30, height: CGFloat(MAXFLOAT)), options: [.usesLineFragmentOrigin,.usesFontLeading], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14)], context: nil)
        return rect.size.height
    }
}
