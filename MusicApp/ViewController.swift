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
    
    var controllerCache: NSMutableArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.automaticallyAdjustsScrollViewInsets = false
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
        // Do any additional setup after loading the view, typically from a nib.
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

    
    func saveCachedVC() {
        let listenVC = ListenViewController()
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

