 
 
 import UIKit
 import ReactiveCocoa
 import ReactiveSwift
 
 import ESTabBarController_swift
 
 class BBShopTabBarController: ESTabBarController {
    var webView3: WKWebViewController?
    
    var navCart = BBNavigationController()
    var num: NSNumber =  0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = MainColor
        tabBar.isTranslucent = true
        // 添加子控制器
        let linA = UILabel.init(frame: CGRect(x: 0, y: -1, width: kScreenW, height: 1));
        linA.backgroundColor =  colorHex("#EEEEEE")
        self.tabBar.addSubview(linA)
        self.tabBar.backgroundImage = UIImage(named: "background")
        
        addChildViewControllers()
    }
    
  //  ExampleProvider.customIrregularityStyle(delegate: nil)
    
    /**
     * 添加子控制器
     */
    fileprivate func addChildViewControllers() {
        
        self.shouldHijackHandler = {
            tabbarController, viewController, index in
        
            if index == 2 {
                self.navigationController?.popViewController(animated: true)
                return true
            }else if  index == 0 {
              //  self.webView1.webView.goBack()
            }else if  index == 3 {

                
            }
            return false
        }
        
         self.didHijackHandler = {
                      tabbarController, viewController, index in
  
                }
        
        self.getVC1()
        self.getVC2()
      
       
        let popularRecommendNav = BBNavigationController(rootViewController: UIViewController())
      //  popularRecommendNav.tabBarItem = ESTabBarItem.init(ExampleIrregularityContentView("ic_cloud_pharmacy_selected"), title: "医速递", image: UIImage(named: "ic_cloud_pharmacy_selected"), selectedImage: UIImage(named: "ic_cloud_pharmacy_selected"))
//            ESTabBarItem.init(ExampleIrregularityBasicContentView(),
//                              title: "医速递",
//                              image: UIImage(named: "ic_cloud_pharmacy_normal"),
//                              selectedImage: UIImage(named: "ic_cloud_pharmacy_selected"))
//
        popularRecommendNav.tabBarItem = UITabBarItem(
            title: "医速递",
            image: UIImage(named: "ic_back_app_normal")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "ic_back_app_selected")?.withRenderingMode(.alwaysOriginal)
        )
        addChild(popularRecommendNav)
   
//        self.getVC3()
//        self.getVC4()
    }
    
    func getVC1() {
         
       
        let webView =  WKWebViewController()
        webView.isRefresh = false
        webView.backFlag = 1
        webView.tabHeight = Int(kTabHeight)
//        webView.loadUrlSting(string: "\(WEB_URL)?uid=\(uid())")
            
        let hospitalNav = BBNavigationController(rootViewController: webView)
            //        hospitalNav.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "首页", image: UIImage(named: "ic_home_normal"), selectedImage: UIImage(named: "ic_home"))
            hospitalNav.tabBarItem = UITabBarItem(
                title: "首页",
                image: UIImage(named: "ic_home_normal")?.withRenderingMode(.alwaysOriginal),
                selectedImage: UIImage(named: "ic_home")?.withRenderingMode(.alwaysOriginal)
            )
        addChild(hospitalNav)
  
    }
    
    func getVC2() {
        
        let webView = WKWebViewController()
        webView.isRefresh = false
        webView.backFlag = 1
        webView.tabHeight = Int(kTabHeight)
       // webView.loadUrlSting(string: SHARE_URL + "Cloud/Cate/index?uid=\(uid())")
        
        let catNav = BBNavigationController(rootViewController: webView)
        //        catNav.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "分类", image: UIImage(named: "ic_classification_normal"), selectedImage: UIImage(named: "ic_classification_selected"))
        //
        catNav.tabBarItem = UITabBarItem(
            title: "分类",
            image: UIImage(named: "ic_classification_normal")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "ic_classification_selected")?.withRenderingMode(.alwaysOriginal)
        )
        
        addChild(catNav)
        
    }
    
    func getVC3() {
        
        let webView = WKWebViewController()
        webView.isRefresh = true
        webView.clear = true
        webView.backFlag = 1
        webView.tabHeight = Int(kTabHeight)
      //  webView.loadUrlSting(string: SHARE_URL + "Cloud/Cart/cartList?uid=\(uid())")
        
        self.webView3 = webView
        navCart = BBNavigationController(rootViewController: webView)
       
        navCart.tabBarItem = UITabBarItem(
            title: "购物车",
            image: UIImage(named: "ic_cart_normal")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "ic_cart_selected")?.withRenderingMode(.alwaysOriginal)
        )
        addChild(navCart)
        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(badgeNum(_:)),
//                                               name: NSNotification.Name(rawValue: kShoppingBadgeNum) , object: nil)
        
    }
//    func getVC4(){
//        let personalCenterVM = BBPersonalCenterViewModel()
//        let vc = BBPersonalCenterVC(personalCenterVM)
//
//        let personalCenterNav = BBNavigationController(rootViewController: vc)
//        //        personalCenterNav.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "个人中心", image: UIImage(named: "ic_personal_center_normal"), selectedImage: UIImage(named: "ic_personal_center_selected"))
//        //
//        personalCenterNav.tabBarItem = UITabBarItem(
//            title: "个人中心",
//            image: UIImage(named: "ic_personal_center_normal")?.withRenderingMode(.alwaysOriginal),
//            selectedImage: UIImage(named: "ic_personal_center_selected")?.withRenderingMode(.alwaysOriginal)
//        )
//        addChild(personalCenterNav)
//    }
    
//    @objc fileprivate func badgeNum(_ note: NSNotification) {
//
//        BBOrderAPI.shared.getShopping("api/cart/cartKind", param: ["uid":strCache(OTOUId),"store_id": strCache(OTOStoreId)]).startWithResult { result  in
//
//            let resultModel: BBResultBModel = result.value! as! BBResultBModel
//
//            if resultModel.rData() is [AnyHashable: Any] {
//                let dict:Dictionary = resultModel.rData() as! [AnyHashable: Any]
//
//                guard let count = dict["count"] else {
//                    return
//                }
//                pprint(count)
//                if count is NSNumber {
//
//                    let num  = (count as! NSNumber ).stringValue
//                    if num != "0" {
//                        self.navCart.tabBarItem.badgeValue = num
////
////                        QueueScheduler.main.schedule(after: Date.init(timeIntervalSinceNow:3)) {
////                        //    self.loadWV()
////                        }
//                    } else {
//                        self.navCart.tabBarItem.badgeValue = nil
//
//                    }
//                }
//
//            }
//
//
//        }
//
//    }
    
    func loadWV() {
        
//        let vc =  self.viewControllers![3]
//
//        let nav = vc as!  BBNavigationController
//        let webv = nav.topViewController as! WKWebViewController
//
  
        
    }
   
 }
 
 
