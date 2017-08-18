//
//  KVBarTitleItem.swift
//  KVSliderBar
//
//  Created by Kevin on 2017/8/16.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

let DEFAUTE_FONT_SIZE: CGFloat = 13.0
let MARGIN: CGFloat = 30.0
let titleViewH: CGFloat = 40.0

protocol KVBarTitleItemDelegate: class {
    func slideBarItemSelected(_ item: KVBarTitleItem)
}
class KVBarTitleItem: UIView {
    // MARK: Property
    weak var delegate: KVBarTitleItemDelegate?
    var select = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    var title: NSString = "" {
        didSet {
            self.setNeedsDisplay()
        }
    }
    var fontSize: CGFloat = 13.0
    var selectFontSize: CGFloat = 15.0
    var normalcolor: UIColor = UIColor.lightGray
    var selectColor: UIColor = UIColor.black
    //MARK: init
    public override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = UIColor.white
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Draw
    override func draw(_ rect: CGRect) {
        let x = (self.bounds.width - self.titleSize().width) * 0.5
        let y = (self.bounds.height - self.titleSize().height) * 0.5
        let titleRect = CGRect(x: x, y: y, width: titleSize().width, height: titleSize().height)
        let attributes = [NSFontAttributeName : self.titleFont(), NSForegroundColorAttributeName : titleColor()]
        title.draw(in: titleRect, withAttributes: attributes)
    }
    fileprivate func titleSize()-> CGSize {
        let attributes = [NSFontAttributeName: titleFont()]
        let size = title.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        let finalSize = CGSize(width: ceil((size.width)), height: ceil((size.height)))
        return finalSize
    }
    //MARK: Function
    fileprivate func titleFont()-> UIFont {
        var font = UIFont()
        if select == true {
            font = UIFont.systemFont(ofSize: selectFontSize)
        }else {
            font = UIFont.systemFont(ofSize: fontSize)
        }
        return font
    }
    fileprivate func titleColor()-> UIColor {
        var color = UIColor()
        if select == true {
            color = selectColor
        }else {
            color = normalcolor
        }
        return color
    }
    // MARK: Class func
    open class func titleItemWidth(_ title: NSString) -> CGFloat {
        let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: DEFAUTE_FONT_SIZE)]
        let size = title.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        let finalSize = CGSize(width: ceil((size.width)), height: ceil((size.height)))
        return finalSize.width + 2 * MARGIN
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.select = true
        self.delegate?.slideBarItemSelected(self)
    }
}
