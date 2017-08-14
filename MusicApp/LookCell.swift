//
//  LookCell.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/14.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class LookCell: UICollectionViewCell {
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var subImage: UIImageView!
    @IBOutlet weak var catLabel: UILabel!

    func updateWithData(model: LookModel){
        let url = URL(string: model.cover_url!)
        coverImage.kf.setImage(with: url)
        titlelabel.text = model.title
        subLabel.text = model.member_name
        catLabel.text = model.category_name
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
