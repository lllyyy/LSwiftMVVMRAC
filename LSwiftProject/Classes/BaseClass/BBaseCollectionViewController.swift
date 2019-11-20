 
import UIKit

import MJRefresh
class BBaseCollectionViewController: BBaseViewController {
    
 
    var collectionView: UICollectionView?

    /**
     *下拉刷新控件
     */
    let header = MJRefreshNormalHeader()
    
    /**
     *上拉加载控件
     */
    let footer = MJRefreshAutoNormalFooter()
   
    func contentInset() -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
 

    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.collectionView = UICollectionView(frame: CGRect(x: 0, y: kNavBarHeight, width: kScreenW, height: kScreenH - kNavBarHeight), collectionViewLayout: BBCollectionViewFlowLayout())
        self.collectionView?.backgroundColor = UIColor.clear
        self.collectionView?.contentInset = self.contentInset()
        self.view.addSubview( self.collectionView! )
        self.view.bringSubviewToFront(self.customNavBar )
  
        if #available(iOS 11.0, *) {
            self.collectionView?.contentInsetAdjustmentBehavior = .never
        }
     
        if isShowRefreshHead() {
            self.header.setRefreshingTarget(self, refreshingAction: #selector(refreshData))
            self.collectionView?.mj_header = self.header
        }
        
        if isShowRefreshFoot() {
            self.footer.setRefreshingTarget(self, refreshingAction: #selector(loadMoreData))
            self.collectionView?.mj_footer = self.footer
        }
        self.handleRefresh(false)
//        view.addSubview(floatView(self))

    }

    func isShowRefreshHead() -> Bool {
        return false
    }
  
    func isShowRefreshFoot() -> Bool {
        return false
    }
 
    func handleRefresh(_ canVisit: Bool) {
        if isShowRefreshHead() {
            self.self.collectionView?.mj_header.endRefreshing()
        }
        if isShowRefreshFoot() {
            self.self.collectionView?.mj_footer.endRefreshing()
        }
        guard canVisit else {
            if isShowRefreshFoot() {
                self.self.collectionView?.mj_footer.isHidden = true
            }
            return
        }
        
        if isShowRefreshFoot() {
            self.self.collectionView?.mj_footer.isHidden = false
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
 
    @objc func refreshData() {
    }
    
    @objc func loadMoreData() {
    }
    
    
}



