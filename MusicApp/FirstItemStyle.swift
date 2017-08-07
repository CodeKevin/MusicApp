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

    func updateWithData(model: AlbumModel) {
        cenImageView.kf.setImage(with: URL(string: model.mphoto!))
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
