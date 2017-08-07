//
//  ThirdItemStyle.swift
//  MusicApp
//
//  Created by Kevin on 2017/5/12.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class ThirdItemStyle: UICollectionViewCell {

    @IBOutlet weak var cenImageView: UIImageView!
    func updateWithData(model: PlayModel){
        let url = URL(string: model.playlist_image!)
        cenImageView.kf.setImage(with: url)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
