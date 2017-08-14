//
//  ViewController.swift
//  MusicApp
//
//  Created by Kevin on 2017/5/12.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
import FSPagerView
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var mainView: UICollectionView?
    var sliderView: UIView!
    var contentView: UIView!
    
    var controllerCache: NSMutableArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.navigationBar.setBackgroundImage(#imageLiteral(resourceName: "global_navigation_7"), for: .default)
        saveCachedVC()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: SCREENW, height: SCREENH)
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 1.0
        layout.scrollDirection = .horizontal
        mainView = UICollectionView(frame: CGRect(x:0, y:0, width:SCREENW, height:SCREENH), collectionViewLayout: layout)
        mainView?.register(MainItem.self, forCellWithReuseIdentifier: "mainItemID")
        mainView?.dataSource = self
        mainView?.delegate = self
        mainView?.isPagingEnabled = true
        mainView?.bounces = false
        self.view.addSubview(mainView!)
        createNavItem()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.25) { 
            self.contentView.alpha = 1.0
        }
    }
    func createNavItem() {
        contentView = UIView(frame: CGRect(x: 70, y: 0, width: SCREENW-140, height: 44))
        let titles = ["好听","好看","乐圈"]
        let width = contentView.mj_w / 3.0
        for index in 0...2 {
            let btn = UIButton(type:.custom)
            btn.frame = CGRect(x: CGFloat(index) * width, y: 0, width: width, height: 44)
            btn.setTitle(titles[index], for:.normal)
            btn.tag = 1000 + index
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.addTarget(self, action: #selector(navBtnClick(sender:)), for: .touchUpInside)
            contentView.addSubview(btn)
        }
        sliderView = UIView(frame: CGRect(x: 0, y: 44-6, width: width, height: 2))
        sliderView.backgroundColor = UIColor.white
        contentView.addSubview(sliderView)
        self.navigationController?.navigationBar.addSubview(contentView)
    }
    //btn click
    func navBtnClick(sender: UIButton) {
        mainView?.scrollToItem(at: IndexPath(item: sender.tag - 1000, section: 0), at: .centeredHorizontally, animated: true)
    }
    ///UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "mainItemID", for: indexPath) as! MainItem
        let currentVC = self.controllerCache.object(at: indexPath.row) as! UIViewController
        item.contentView.addSubview(currentVC.view)
        item.backgroundColor = UIColor.blue
        return item
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.mj_offsetX
        self.sliderAnimation(Int(x / SCREENW))
    }
    func sliderAnimation(_ index: Int) {
        print(index)
        let width = (SCREENW-140)/3.0
        UIView.animate(withDuration: 0.25) {
            self.sliderView.center.x = CGFloat(index) * width + width / 2
        }
    }
    func saveCachedVC() {
//        let listenNVC = UINavigationController(rootViewController: ListenViewController())
//        self.controllerCache.add(listenNVC)
//        
//        let lookNVC = UINavigationController(rootViewController: LookViewController())
//        self.controllerCache.add(lookNVC)
//        
//        let circleNVC = UINavigationController(rootViewController: CircleViewController())
//        self.controllerCache.add(circleNVC)
        let listenVC = ListenViewController()
        listenVC.navBlock = {
            UIView.animate(withDuration: 0.25) {
                self.contentView.alpha = 0.0
            }
            return self
        }
        self.controllerCache.add(listenVC)
        
        let lookVC = LookViewController()
        self.controllerCache.add(lookVC)
        
        let circleVC = CircleViewController()
        self.controllerCache.add(circleVC)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

