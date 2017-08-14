//
//  FirstItemStyle.swift
//  MusicApp
//
//  Created by Kevin on 2017/5/12.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class FirstItemStyle: UICollectionViewCell {
    @IBOutlet weak var cenImageView: UIImageView!
    @IBOutlet weak var volLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!

    func updateWithData(model: AlbumModel) {
        cenImageView.kf.setImage(with: URL(string: model.mphoto!))
        volLabel.text = "VOL." + model.mnum!
        desLabel.text = model.mname!
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
