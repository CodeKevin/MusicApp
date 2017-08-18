//
//  SubLookViewController.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/11.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class SubLookViewController: BaseViewController,UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var collectionView: UICollectionView!
    var dataSource = [LookModel]()
    var catId: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = kLightGrayColor
        createCollectionView()
        initData()
        // Do any additional setup after loading the view.
    }
    func createCollectionView()  {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: CGRect(x:0, y:0, width:SCREENW, height:SCREENH-64-40), collectionViewLayout: layout)
        collectionView.backgroundColor = kLightGrayColor
        collectionView?.register((UINib(nibName: "LookCell", bundle: nil)), forCellWithReuseIdentifier: "lookcellid")
        collectionView?.dataSource = self
        collectionView?.delegate = self
        self.view.addSubview(collectionView)
    }
    func initData() {
        self.dataSource.removeAll()
        let urlStr = "http://wawa.fm:9090/wawa/api.php/document/getDocumentByCategory?&r=10&cid=" + catId!
        KVNetworkTool.shared.loadData(urlString: urlStr, containerView: collectionView) { (time, json) in
            if let data = json.arrayObject {
                for dict in data {
                    let model = LookModel(dict: dict as! [String : AnyObject])
                    self.dataSource.append(model)
                }
            }
            self.collectionView.reloadData()
        }
    }
    // MARK: collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "lookcellid", for: indexPath) as! LookCell
        cell.updateWithData(model: self.dataSource[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (SCREENW-30.0)/2.0 , height: (SCREENW-30.0)/3.0 + 65)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 10, 0, 10)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (indexPath.row % 2 != 0) {
            cell.transform = cell.transform.translatedBy(x: SCREENW/2, y: 0)
        }else{
            cell.transform = cell.transform.translatedBy(x: -SCREENW/2, y: 0)
        }
        cell.alpha = 0.0
        UIView.animate(withDuration: 0.5) {
            cell.transform = .identity
            cell.alpha = 1.0
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let articleVC = BaseWebViewController()
        let model = self.dataSource[indexPath.row]
        articleVC.title = model.title
        articleVC.articleId = model.id
        ViewController.rootVC.navigationController?.pushViewController(articleVC, animated: true)
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
