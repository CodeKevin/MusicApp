//
//  KVBarTitleView.swift
//  KVSliderBar
//
//  Created by Kevin on 2017/8/15.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
typealias KVBarItemSelectClosure = (_ index: NSInteger)-> Void
class KVBarTitleView: UIView {
    // MARK: Property
    var selectClosure: KVBarItemSelectClosure?
    fileprivate var titles: [String]
    var items = [KVBarTitleItem]()
    fileprivate var selectItem: KVBarTitleItem! {
        willSet {
            self.selectItem?.select = false
        }
    }
    // MARK: Lazy property
    fileprivate lazy var titleLabels: [UILabel] = [UILabel]()
    fileprivate lazy var scrollView: UIScrollView = {[weak self] in
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.white
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    fileprivate lazy var scrolline: UIView = {[weak self] in
        let scrollLine = UIView()
        return scrollLine
    }()
    fileprivate lazy var line: UIView = {[weak self] in
        let line = UIView()
        return line
        }()
    // MARK: Custom constructor
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        super.init(frame: frame)
        createUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        
    }
    func scrollToVisibleItem(_ item: KVBarTitleItem) {
        let selectIndex = self.items.index(of: selectItem!)!
        let visibleIndex = self.items.index(of: item)!
        if selectIndex == visibleIndex {
            return
        }
        var offset = scrollView.contentOffset
        if item.frame.minX >= offset.x && item.frame.maxX <= offset.x + scrollView.frame.width{
            return
        }
        if selectIndex < visibleIndex {
            if selectItem.frame.minX < offset.x {
                offset.x = item.frame.minX
            }else {
                offset.x = item.frame.maxX - scrollView.frame.width
            }
        }else {
            if selectItem.frame.minX > offset.x + scrollView.frame.width{
                offset.x = item.frame.maxX - scrollView.frame.width
            }else {
                offset.x = item.frame.minX
            }
        }
        scrollView.contentOffset = offset
    }
    public func selectBarItemAtIndex(_ index: NSInteger) {
        let item = self.items[index]
        if item == selectItem {
            return
        }
        item.select = true
        scrollToVisibleItem(item)
        self.selectItem = item
    }
}
extension KVBarTitleView {
    fileprivate func createUI() {
        addSubview(scrollView)
        scrollView.frame = bounds
        createTitleLabels()
        line.frame = CGRect(x: 0, y: (self.frame.height)-1, width: (self.frame.width), height: 1)
        line.backgroundColor = UIColor.lightGray
        addSubview(line)
    }
    fileprivate func createTitleLabels() {
        var itemX: CGFloat = 0.0
        for (_, title) in titles.enumerated() {
            let item = KVBarTitleItem()
            item.delegate = self
            item.title = title as NSString
            let itemW = KVBarTitleItem.titleItemWidth(title as NSString)
            item.frame = CGRect(x: itemX, y: 0, width: itemW, height: self.bounds.height)
            items.append(item)
            scrollView.addSubview(item)
            itemX = itemX + itemW
        }
        scrollView.contentSize = CGSize(width: itemX, height: self.bounds.height)
        let firstItem = items.first
        firstItem?.select = true
        selectItem = firstItem
    }
}
extension KVBarTitleView: KVBarTitleItemDelegate {
    func slideBarItemSelected(_ item: KVBarTitleItem) {
        if item == selectItem {
            return
        }
        scrollToVisibleItem(item)
        self.selectItem = item
        if self.selectClosure != nil {
            self.selectClosure!(self.items.index(of: item)!)
        }
    }
}
