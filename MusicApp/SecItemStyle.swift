//
//  SecItemStyle.swift
//  MusicApp
//
//  Created by Kevin on 2017/5/12.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
import Kingfisher
class SecItemStyle: UICollectionViewCell {

    @IBOutlet weak var firImageView: UIImageView!
    @IBOutlet weak var secImageView: UIImageView!
    @IBOutlet weak var thiImageView: UIImageView!
    
    @IBAction func thirdAction(_ sender: Any) {
        
    }

    @IBAction func secondAction(_ sender: Any) {
        
    }

    @IBAction func firstAction(_ sender: Any) {
        
    }
    func updateWithData(data: Array<Any>){
        if data.count >= 3 {
            let model = data[0] as! Musician
            let url = URL(string:model.image!)
            firImageView.kf.setImage(with: url)

            let model1 = data[1] as! Musician
            let url1 = URL(string:model1.image!)
            secImageView.kf.setImage(with: url1)
            
            let model2 = data[2] as! Musician
            let url2 = URL(string:model2.image!)
            thiImageView.kf.setImage(with: url2)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
}
