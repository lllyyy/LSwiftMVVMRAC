 

import UIKit
import TBEmptyDataSet
import MJRefresh
class BBaseTableViewController: BBaseViewController {
    
    
    var tableView: UITableView!
   // var viewModel: BBaseTableViewModel!
    var idleImages:NSMutableArray = []
    var refreshingImages:NSMutableArray = []

    /**
     *下拉刷新控件
     */
   // let header = MJRefreshNormalHeader()
    
    /**
     *上拉加载控件
     */
    let footer = MJRefreshAutoNormalFooter()
  
    
    var lastPosition = CGPoint.zero

    /**
     *是否自动加载数据
     */
    //var isAutoStartLoadData = false
    /**
     *网络数据是否加载完成
     */
    //var isLoadFinish = false
    
    /**
     *tableView滚动delegate
     */
   // var scrollViewDelegate: BBScrollViewDelegate?
    
//    
    func contentInset() -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
     //   self.isLoadFinish = true;
     //   self.isAutoStartLoadData = true;
            
        self.tableView = UITableView(frame: self.view.bounds, style:UITableView.Style.grouped)
        self.tableView.top  = kNavBarHeight
        self.tableView.height = kScreenH - kNavBarHeight
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.tableView.contentInset = self.contentInset()
        self.tableView.showsVerticalScrollIndicator = false
        
//        tableView.emptyDataSetDataSource = self
//        tableView.emptyDataSetDelegate = self
        
//        self.tableView.estimatedRowHeight = 0
//        self.tableView.estimatedSectionHeaderHeight = 0
//        self.tableView.estimatedSectionFooterHeight = 0
               
        self.view.addSubview(self.tableView)
        self.view.bringSubviewToFront(self.customNavBar)
      //  self.view.insertSubview(self.customNavBar, belowSubview: self.tableView)
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        }
        
//         view.addSubview(floatView(self))
        // weak var weakSelf = self
        /**
        let fpsLabel = V2FPSLabel()
        fpsLabel.sizeToFit()
        fpsLabel.frame = CGRect(x: 10, y: 100, width: 100, height: 50)
        self.view.addSubview(fpsLabel)*/
        
        
//        for i in 1...4 {
//            let image: UIImage = UIImage(named: "loading0\(i)")! as UIImage
//            idleImages.add(image)
//        }
//                  
        if isShowRefreshHead() {
           // header.setRefreshingTarget(self, refreshingAction: #selector(BBaseTableViewController.refreshData))
            
            let header:MJRefreshGifHeader = MJRefreshGifHeader(refreshingTarget: self, refreshingAction:#selector(refreshData))
            //设置普通状态动画图片
//            header.setImages(idleImages as [AnyObject], for: MJRefreshState.idle)
//            //设置下拉操作时动画图片
//             header.setImages(idleImages as [AnyObject], for: MJRefreshState.pulling)
//            //设置正在刷新时动画图片
//           // header.setTitle("努力加载中......", for: MJRefreshState.refreshing)
//            header.setImages(idleImages as [AnyObject], for: MJRefreshState.refreshing)
//            header.lastUpdatedTimeLabel.isHidden = true
//       
//            header.stateLabel.isHidden = true
            //设置mj_header
            self.tableView.mj_header = header
          }
        
        if isShowRefreshFoot() {
            footer.setRefreshingTarget(self, refreshingAction: #selector(BBaseTableViewController.loadMoreData))
            self.tableView.mj_footer = footer
        }
        self.handleRefresh(false)
      //  self.scrollViewDelegate = self;
        
        
        
        

    }
    
//    func ishideView()  {
//        if hideView {
//            view.addSubview(floatView(self))
//        }
//    }
    
    
    /**
     *是否显示下拉刷新控件
     */
    func isShowRefreshHead() -> Bool {
        return false
    }
    
    /**
     *是否显示上拉加载控件
     */
    func isShowRefreshFoot() -> Bool {
        return false
    }
 
    func handleRefresh(_ canVisit: Bool) {
        if isShowRefreshHead() {
            self.tableView.mj_header.endRefreshing()
        }
        if isShowRefreshFoot() {
            self.tableView.mj_footer.endRefreshing()
        }
     
  
        if  canVisit {
            if isShowRefreshFoot() {
                 self.tableView.mj_footer.isHidden = false
            }
     
        }else {
            if isShowRefreshFoot() {
                self.tableView.mj_footer.isHidden = true
            }
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // self.navigationController?.navigationBar.isTranslucent = false
         
        /**
        // 修改为第一次加载后开始手动下拉刷新加载
        if self.isAutoStartLoadData && self.isLoadFinish {
            self.refreshData()
            self.isAutoStartLoadData = false
        }
        else {
            self.tableView.reloadData()
        }
        */
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.handleRefresh(false)
//        self.ishideView()
    }
 /**
    func fetchLocalData()
    {
        weak var weakSelf = self
        self.viewModel.fetchLocalDataWithCompletion { (result, error) in
            let result = result as! NSArray
            if result.count > 0 {
                DispatchQueue.main.async {
                    weakSelf!.tableView.reloadData()
                }
            }
            weakSelf?.refreshDataFromServer()
        }
    }*/
    
    @objc func refreshData() {
        /*
        if self.viewModel.isReadLoacalData {
            //设置NO只会第一次下拉刷新取本地数据
            self.viewModel.isReadLoacalData = false
            //取本地数据的话，就不需要显示loadMoreStatusView的views
            self.fetchLocalData()
        }
        else {
             self.refreshDataFromServer()
        }
 */
    }
    
     /*
    func refreshDataFromServer() {
     
        if (self.viewModel == nil) {
         //   self.refreshHeadView.noMoreData()
            self.tableView.mj_header.endRefreshing()
            
            return
        }
        
        if self.isLoadFinish == false {
            return
        }
        self.isLoadFinish = false;
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        weak var weakSelf = self
       
        self.viewModel.refreshNewDataCompletion { (result, error) in
            ///let resultData = result as! NSArray
        
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            weakSelf?.isLoadFinish = true;
            DispatchQueue.main.async{
                
                weakSelf?.tableView.mj_header.endRefreshing()
                if (error._code == 0)
                {
                  //  weakSelf?.refreshHeadView.endLoading()
                   // weakSelf?.refreshHeadView.statusLable.text = "网络请求失败"
                }else {
                  //  weakSelf?.refreshHeadView.endLoading()
                
                    if (weakSelf?.viewModel.canVisitNextPage)! {
                      //  weakSelf?.refreshFootView.endLoading()
                    }else {
                       // weakSelf?.refreshFootView.noMoreData()
                        weakSelf?.footer.endRefreshingWithNoMoreData()
                    }
                    weakSelf!.tableView.reloadData()
                    
                }
            }
        }
    }*/
    
    @objc func loadMoreData() {
    /*
        if self.isLoadFinish == false {
            return
        }
        
        if (self.viewModel == nil) {//noMoreData
            self.footer.endRefreshingWithNoMoreData()
            return
        }
        
        self.isLoadFinish = false;
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        weak var weakSelf = self
 
        self.viewModel.loadNextPageCompletion {  (result, error) in
            weakSelf?.isLoadFinish = true;
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
           
 
            DispatchQueue.main.async{
                if (error._code == 0)
                {
                    weakSelf?.tableView.mj_footer.endRefreshing()
                //    weakSelf?.refreshFootView.endLoading()
                 //   weakSelf?.refreshFootView.statusLable.text = "网络请求失败"
                }else{
                    if (weakSelf?.viewModel.canVisitNextPage)! {
                      //  weakSelf?.refreshFootView.endLoading()
                        weakSelf?.tableView.mj_footer.endRefreshing()
                    }else {
                      //  weakSelf?.refreshFootView.noMoreData()
                        weakSelf?.footer.endRefreshingWithNoMoreData()
                    }
                }
                weakSelf!.tableView.reloadData()
            }
 
            
        }
*/
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.lastPosition = scrollView.contentOffset
    }
 
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.lastPosition = scrollView.contentOffset
    }
}

extension BBaseTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       // return nil
       return UIView()
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
       //return nil
       return UIView()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0//self.viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId")!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
    }
    
    internal func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return " "
    }
    
    internal func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    }
    

}
/*

extension BBaseTableViewController: TBEmptyDataSetDataSource, TBEmptyDataSetDelegate {
    
    func imageForEmptyDataSet(in scrollView: UIScrollView) -> UIImage? {
        // return the image for EmptyDataSet
    }
    
    func titleForEmptyDataSet(in scrollView: UIScrollView) -> NSAttributedString? {
        // return the title for EmptyDataSet
    }
    
    func descriptionForEmptyDataSet(in scrollView: UIScrollView) -> NSAttributedString? {
        // return the description for EmptyDataSet
    }
    
    func imageTintColorForEmptyDataSet(in scrollView: UIScrollView) -> UIColor? {
        // return the image tint color for EmptyDataSet
    }
    
    func backgroundColorForEmptyDataSet(in scrollView: UIScrollView) -> UIColor? {
        // return the backgroundColor for EmptyDataSet
    }
    
    func verticalOffsetForEmptyDataSet(in scrollView: UIScrollView) -> CGFloat {
        // return the vertical offset for EmptyDataSet, default is 0
    }
    
    func verticalSpacesForEmptyDataSet(in scrollView: UIScrollView) -> [CGFloat] {
        // return the vertical spaces from top to bottom for EmptyDataSet, default is [12, 12]
    }
    
    func titleMarginForEmptyDataSet(in scrollView: UIScrollView) -> CGFloat {
        // return the minimum horizontal margin space for title, default is 15
    }
    
    func descriptionMarginForEmptyDataSet(in scrollView: UIScrollView) -> CGFloat {
        // return the minimum horizontal margin space for description, default is 15
    }
    
    func customViewForEmptyDataSet(in scrollView: UIScrollView) -> UIView? {
        // return an UIView instance for EmptyDataSet
    }
    
    
    
    //Delegate functions:
    func emptyDataSetShouldDisplay(in scrollView: UIScrollView) -> Bool {
        // should display EmptyDataSet or not, default is true
    }
    
    func emptyDataSetTapEnabled(in scrollView: UIScrollView) -> Bool {
        // enable tap gesture or not, default is true
    }
    
    func emptyDataSetScrollEnabled(in scrollView: UIScrollView) -> Bool {
        // scrollView can scroll or not, default is false
    }
    
    func emptyDataSetDidTapEmptyView(in scrollView: UIScrollView) {
        // do something
    }
    
    func emptyDataSetWillAppear(in scrollView: UIScrollView) {
        // do something
    }
    
    func emptyDataSetDidAppear(in scrollView: UIScrollView) {
        // do something
    }
    
    func emptyDataSetWillDisappear(in scrollView: UIScrollView) {
        // do something
    }
    
    func emptyDataSetDidDisappear(in scrollView: UIScrollView) {
        // do something
    }
}*/
