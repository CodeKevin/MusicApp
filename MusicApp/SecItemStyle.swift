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
    @IBOutlet weak var firTitleLabel: UILabel!
    @IBOutlet weak var firDetailLabel: UILabel!
    @IBOutlet weak var secTitleLabel: UILabel!
    @IBOutlet weak var thiTitleLable: UILabel!
    
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
            firTitleLabel.text = Tool.headString(model.title!)
            firDetailLabel.text = model.title
            
            let model1 = data[1] as! Musician
            let url1 = URL(string:model1.image!)
            secImageView.kf.setImage(with: url1)
            secTitleLabel.text = Tool.headString(model1.title!)
            
            let model2 = data[2] as! Musician
            let url2 = URL(string:model2.image!)
            thiImageView.kf.setImage(with: url2)
            thiTitleLable.text = Tool.headString(model2.title!)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
}
