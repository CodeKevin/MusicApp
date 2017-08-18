//
//  KVBarContentView.swift
//  KVSliderBar
//
//  Created by Kevin on 2017/8/15.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
fileprivate let pageCellID = "KVPageCellID"
class KVBarContentView: UIView {
    fileprivate var childVCs: [UIViewController]
    fileprivate var titles:[String]
    fileprivate weak var parentVC: UIViewController?
    fileprivate var startOffsetX: CGFloat = 0
    fileprivate var titleView: KVBarTitleView?
    fileprivate var isForbidScrollDelegate: Bool = false
    fileprivate lazy var collectionView: UICollectionView = { [weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (self?.bounds.width)!, height: (self?.bounds.height)! - titleViewH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.headerReferenceSize = CGSize.zero
        layout.footerReferenceSize = CGSize.zero
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: titleViewH, width: (self?.bounds.width)!, height: (self?.bounds.height)! - titleViewH), collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.scrollsToTop = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentOffset = CGPoint(x: 0, y: 0)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: pageCellID)
        collectionView.backgroundColor = UIColor.white
        return collectionView
        }()
    init(frame: CGRect,titles:[String], childVCs: [UIViewController], parentVC: UIViewController?) {
        self.childVCs = childVCs
        self.parentVC = parentVC
        self.titles = titles
        super.init(frame: frame)
        createUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension KVBarContentView {
    fileprivate func createUI() {
        titleView = KVBarTitleView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: titleViewH), titles: self.titles)
        titleView?.selectClosure = {[weak self](index) in
            if let sself = self {
                sself.scrollToIndex(index: index)
            }
        }
        addSubview(titleView!)
        collectionView.frame = CGRect(x: 0, y: titleViewH, width: (self.bounds.width), height: (self.bounds.height) - titleViewH)
        addSubview(collectionView)
    }
}
extension KVBarContentView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVCs.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pageCellID, for: indexPath)
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        let childVC = childVCs[indexPath.item]
        childVC.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVC.view)
        return cell
    }
}
extension KVBarContentView: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let indexPath = self.collectionView.indexPathForItem(at: scrollView.contentOffset)
        titleView?.selectBarItemAtIndex((indexPath?.item)!)
    }
}
extension KVBarContentView {
    func scrollToIndex(index: Int) {
        isForbidScrollDelegate = true
        let offsetX = CGPoint(x: CGFloat(index) * collectionView.bounds.width, y: 0)
        collectionView.setContentOffset(offsetX, animated: false)
    }
}
