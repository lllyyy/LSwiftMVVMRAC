 
 
 import UIKit
 import ReactiveCocoa
 import ReactiveSwift
 
 import ESTabBarController_swift
 
 class BBTabBarController: ESTabBarController {
    var homeVC: LLHomeViewController!
    var myVC: LLAccountViewController!
    var foundVC: LLFoundViewController!
    var popularScienceVC: LLPopularScienceViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = MainColor
        tabBar.isTranslucent = true
    
        let linA = UILabel.init(frame: CGRect(x: 0, y: -1, width: kScreenW, height: 1));
        linA.backgroundColor =  colorHex("#EEEEEE")
        self.tabBar.addSubview(linA)
        // 添加子控制器
        addChildViewControllers()
        self.tabBar.backgroundImage = UIImage(named: "background")
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//self.tabBar.backgroundImage = UIImage(named: "background")
//        } self.tabBar.backgroundColor  = UIColor.white
//
        
    }
   
    /**
     # 添加子控制器
     */
    fileprivate func addChildViewControllers() {
        self.shouldHijackHandler = {
            tabbarController, viewController, index in
//            if index == 2 {
//
//                let   webView = BBShopTabBarController()
//           //    kTabHeight
//                getTopVC(selectedIndex:  getTabVC().selectedIndex).navigationController?.pushViewController(webView, animated: true)
//                return true
//            }
            return false
        }
  
        self.homeVC = LLHomeViewController()
        let homeNav = BBNavigationController(rootViewController: homeVC)
        homeNav.tabBarItem = UITabBarItem(
            title: "首页",
            image: UIImage(named: "ic_home_normal")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "ic_home")?.withRenderingMode(.alwaysOriginal)
        )
       addChild(homeNav)
        
 
        self.foundVC = LLFoundViewController()
 
        let foundNav = BBNavigationController(rootViewController: foundVC)
        foundNav.tabBarItem = UITabBarItem(
            title: "特色专科",
            image: UIImage(named: "ic_specialistss")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "ic_specialist_selected")?.withRenderingMode(.alwaysOriginal)
        )
        addChild(foundNav)
        
        self.popularScienceVC = LLPopularScienceViewController()
        let popularScienceNav = BBNavigationController(rootViewController: popularScienceVC)
 
        popularScienceNav.tabBarItem = UITabBarItem(
            title: "科普健康",
            image: UIImage(named: "ic_cloud_pharmacy_normal")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "ic_cloud_pharmacy_selected")?.withRenderingMode(.alwaysOriginal)
        )
        addChild(popularScienceNav)
 
  
        self.myVC = LLAccountViewController()
        let personalCenterNav = BBNavigationController(rootViewController: myVC)
         personalCenterNav.tabBarItem = UITabBarItem(
            title: "个人中心",
            image: UIImage(named: "ic_personal_center_normal")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "ic_personal_center_selected")?.withRenderingMode(.alwaysOriginal)
        )
        addChild(personalCenterNav)
   
    }
    
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//
//    }

 }
 
 
