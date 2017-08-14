//
//  LookViewController.swift
//  MusicApp
//
//  Created by Kevin on 2017/5/12.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class LookViewController: BaseViewController{
    fileprivate var pageIndexChange: Int = 0
    fileprivate var titleView: XFPageTitleView!
    fileprivate var pageView:XFPageContentView!
    var dataSource = [1,2,3,4]
    var titles = ["艺文","有品","旅行","应用"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        createPageView()
        // Do any additional setup after loading the view.
    }
    func createPageView() {
        var arr = [UIViewController]()
        for _ in dataSource {
            let vc = SubLookViewController()
            arr.append(vc)
        }
        titleView = XFPageTitleView(frame: CGRect(x: 0, y: 0, width: SCREENW, height: 44), titles: self.titles)
        titleView!.delegate = self
        pageView = XFPageContentView(frame: CGRect(x: 0, y: 44, width: SCREENW, height: SCREENH), childVcs: arr, parentVc: self)
        pageView!.delegate = self
        self.view.addSubview(titleView)
        self.view.addSubview(pageView)
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
extension LookViewController: XFPageTitleViewDelegate {
    
    func pageTitleView(pageTitleView: XFPageTitleView, didSelectedIndex index: Int) {
        //        QBLog("====index==\(index)=")
        pageIndexChange = index
        titleView?.scrollToIndex(index: index)
    }
}
extension LookViewController: XFPageContentViewDelegate {
    
    func pageContentView(pageContentView: XFPageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        //        QBLog("====sourceIndex====\(sourceIndex)====targetIndex==\(targetIndex)=")
        pageIndexChange = targetIndex
        titleView?.setTitleWithProgerss(sourceIndex: sourceIndex, targetIndex: targetIndex, progress: progress)
        
    }
}
