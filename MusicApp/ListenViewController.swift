//
//  ListenViewController.swift
//  MusicApp
//
//  Created by Kevin on 2017/5/12.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
import FSPagerView
import Alamofire
import SwiftyJSON
import Kingfisher
import Spring
class ListenViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,FSPagerViewDelegate,FSPagerViewDataSource{
    var banner : FSPagerView!
    var collectionView: UICollectionView!
    var adList = [AdModel]()
    var datasource = [Musician]()
    var playList = [PlayModel]()
    var albumList = [AlbumModel]()
    var springView = SpringView()
    override  func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let overlayClass = NSClassFromString("UIDebuggingInformationOverlay") as? UIWindow.Type
//        _ = overlayClass?.perform(NSSelectorFromString("prepareDebuggingOverlay"))
//        let overlay = overlayClass?.perform(NSSelectorFromString("overlay")).takeUnretainedValue() as? UIWindow
//        _ = overlay?.perform(NSSelectorFromString("toggleVisibility"))
        self.view.backgroundColor = UIColor.white
        //self.navigationController?.navigationBar.backgroundColor = UIColor(colorLiteralRed: <#T##Float#>, green: <#T##Float#>, blue: <#T##Float#>, alpha: <#T##Float#>)
        createBannerView()
        createUI()
        initData()
        springView.animation = "flipX"
        springView.curve = "easeInOut"
        springView.duration = 1.0
        springView.animate()
        
        
        
        // Do any additional setup after loading the view.
    }
    func initData() {
        KVNetworkTool.shared.loadData(urlString: "http://wawa.fm:9090/wawa/api.php/index/fmfragment1",containerView: collectionView) { (time, json) in
   
            self.adList.removeAll()
            self.datasource.removeAll()
            self.albumList.removeAll()
            self.playList.removeAll()
            
            if let ad = json["ad"].arrayObject {
                for dict in ad {
                    let model = AdModel(dict: dict as! [String : AnyObject])
                    self.adList.append(model)
                }
            }
            if let data = json["musician"].arrayObject {
                for dict in data {
                    let model = Musician(dict: dict as! [String : AnyObject])
                    self.datasource.append(model)
                }
            }
            if let album = json["album"].dictionaryObject {
                let model = AlbumModel(dict: album as [String : AnyObject])
                self.albumList.append(model)
            }
            if let playlist = json["playlist"].arrayObject {
                for dict in playlist {
                    let model = PlayModel(dict: dict as! [String : AnyObject])
                    self.playList.append(model)
                }
            }
            self.collectionView.reloadData()
        }
    }
    
    func createUI()  {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: CGRect(x:0, y:0, width:SCREENW, height:SCREENH-64), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView?.register((UINib(nibName: "ListenItem", bundle: nil)), forCellWithReuseIdentifier: "cellId")
        collectionView?.register((UINib(nibName: "FirstItemStyle", bundle: nil)), forCellWithReuseIdentifier: "oneCellId")
        collectionView?.register((UINib(nibName: "SecItemStyle", bundle: nil)), forCellWithReuseIdentifier: "twoCellId")
        collectionView?.register((UINib(nibName: "ThirdItemStyle", bundle: nil)), forCellWithReuseIdentifier: "thirdCellId")
        collectionView?.register(UINib(nibName: "SectionHeadView",bundle: nil), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "sectionHeadView")
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "sectionFootView")
        collectionView?.dataSource = self
        collectionView?.delegate = self
        springView = SpringView(frame: self.view.bounds)
        springView.addSubview(collectionView!)
        self.view.addSubview(springView)
    }
    // MARK: collectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 3 {
            return self.playList.count
        }else if section == 1 {
            return self.datasource.count > 0 ? 1 : 0
        }else if section == 2 {
            return self.albumList.count
        }else {
            return self.adList.count > 0 ? 1 : 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ListenItem
            banner.reloadData()
            cell.contentView.addSubview(banner)
             return cell
        }else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "twoCellId", for: indexPath) as! SecItemStyle
            cell.updateWithData(data: self.datasource)
            return cell
        }else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "oneCellId", for: indexPath) as! FirstItemStyle
            cell.updateWithData(model: albumList[indexPath.row])
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thirdCellId", for: indexPath) as! ThirdItemStyle
            cell.updateWithData(model: playList[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let sectionView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "sectionHeadView", for: indexPath) as! SectionHeadView
                    switch indexPath.section {
                        case 1:
                            sectionView.sectionTitle.text = "乐人推荐"
                            sectionView.moreBtn.tag = 1000
                        case 2:
                            sectionView.sectionTitle.text = "猎乐合集"
                            sectionView.moreBtn.tag = 1001
                        case 3:
                            sectionView.sectionTitle.text = "达人歌单"
                            sectionView.moreBtn.tag = 1002
                        default:
                            sectionView.sectionTitle.text = ""
                        }
            sectionView.moreBtn.addTarget(self, action: #selector(moreClick(sender:)), for:.touchUpInside)
            sectionView.backgroundColor = UIColor.white
            return sectionView
        }else {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "sectionFootView", for: indexPath)
            footerView.backgroundColor = kLightGrayColor
            return footerView
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 3 {
            return CGSize(width: (SCREENW-30)/2, height: (SCREENW-30)/2)
        } else if indexPath.section == 2 {
            return CGSize(width: SCREENW-10, height: 200-20)
        } else {
            return CGSize(width: SCREENW-10, height: 150*SCALE)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: SCREENW, height: 15)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section > 0 { return CGSize(width: SCREENW, height: 40) } else { return CGSize.zero }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 3 {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }else {
            return UIEdgeInsets.zero
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            ViewController.rootVC.navigationController?.pushViewController(MusicListViewController(), animated: true)
        }
    }
    // MARK: moreClock
    func moreClick(sender: UIButton) {
        switch sender.tag - 1000 {
        case 0:
                ViewController.rootVC.navigationController?.pushViewController(MusicManViewController(), animated: true)
        case 1:
                ViewController.rootVC.navigationController?.pushViewController(MusicListViewController(), animated: true)
        case 2:
                ViewController.rootVC.navigationController?.pushViewController(FasionListViewController(), animated: true)
        default:
            print("default")
        }
    }
    
    
    // MARK: banner
    func createBannerView() {
        banner = FSPagerView(frame: CGRect(x: 0, y: 0, width: SCREENW, height: 150*SCALE))
        banner.backgroundColor = UIColor.white
        banner.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        banner.dataSource = self
        banner.delegate = self
        banner.automaticSlidingInterval = 3.0
        banner.transformer = FSPagerViewTransformer(type:.coverFlow)
    }
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return adList.count
    }
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        let model = adList[index]
        cell.imageView?.kf.setImage(with: URL(string: model.image!))
        cell.textLabel?.text = String(index+1)
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

        
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
