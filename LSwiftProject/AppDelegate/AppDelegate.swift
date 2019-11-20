//
//  AppDelegate.swift
//  LSwiftProject
//
//  Created by ios on 2019/11/18.
//  Copyright © 2019 ios. All rights reserved.
//

import UIKit
import SwiftDate
import SwiftyBeaver
import Alamofire



let log = SwiftyBeaver.self
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  var manager: NetworkReachabilityManager?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         window = UIWindow(frame: UIScreen.main.bounds)
//         window?.backgroundColor = UIColor.white
        
        window!.rootViewController = BBTabBarController()
        window?.makeKeyAndVisible()
        
        setupLogger()
        
        return true
    }
    
    
    
    func configureNetworkReachability() {
         
         self.manager = NetworkReachabilityManager(host: "www.baidu.com")
         self.manager?.listener = { status in
             if status == NetworkReachabilityManager.NetworkReachabilityStatus.notReachable {
                 //  SVProgressHUD.showInfo(withStatus: "不可获得的网络！")
             }
             if status == NetworkReachabilityManager.NetworkReachabilityStatus.unknown {
                 //SVProgressHUD.showInfo(withStatus: "未知的网络！")
             }
             print("Network Status Changed: \(status)")
         }
         self.manager?.startListening()
     }
    
    func configureBugtags() {
       
       let options = BugtagsOptions()
       options.trackingUserSteps = true // 具体可设置的属性请查看 Bugtags.h
       Bugtags.start(withAppKey: "73850b8cec4a274e5d5363b7b9409151", invocationEvent: BTGInvocationEventNone, options: options)
    }
    ///设置Log日志
       func setupLogger() {
           // add log destinations. at least one is needed!
           let console = ConsoleDestination()  // log to Xcode Console
           console.minLevel = .debug // just log .info, .warning & .error
           let file = FileDestination()  // log to default swiftybeaver.log file
           log.addDestination(console)
           log.addDestination(file)
       }
}

