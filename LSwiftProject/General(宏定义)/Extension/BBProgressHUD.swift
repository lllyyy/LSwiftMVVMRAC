 
 import UIKit
 import SVProgressHUD
 
 fileprivate enum HUDType: Int {
    case success
    case errorObject
    case errorString
    case info
    case loading
 }
 
 class BBProgressHUD: NSObject {
    class func initHUD() {
        SVProgressHUD.setBackgroundColor(UIColor ( red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7 ))
        SVProgressHUD.setForegroundColor(UIColor.white)
        SVProgressHUD.setFont(UIFont.systemFont(ofSize: 14))
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        
        
        //SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.light)
        //SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.native)
 
        SVProgressHUD.setMinimumDismissTimeInterval(2.0)
        SVProgressHUD.setMaximumDismissTimeInterval(2)
 
        //SVProgressHUD.setBackgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5))
        //SVProgressHUD.setForegroundColor(UIColor.white)
    }
    
    class func showInfo(string: String) {
        SVProgressHUD.showInfo(withStatus: string)
    }
    //成功
    class func showSuccess(withStatus string: String?) {
        self.progressHUDShow(.success, status: string)
    }
    
    //失败 ，NSError
    class func showError(withObject error: NSError) {
        self.progressHUDShow(.errorObject, status: nil, error: error)
    }
    
    //失败，String
    class func showError(withStatus string: String?) {
        self.progressHUDShow(.errorString, status: string)
    }
    
    //转菊花
    class func showWithStatus(_ string: String?) {
        self.progressHUDShow(.loading, status: string)
    }
    
    //警告
    class func showWarning(withStatus string: String?) {
        self.progressHUDShow(.info, status: string)
    }
 
    class func show() {
        SVProgressHUD.show()
    }
    //dismiss消失
    class func dismiss() {
        SVProgressHUD.dismiss()
    }
    class func dismiss(_ time: TimeInterval) {
        SVProgressHUD.dismiss(withDelay: time)
    }
    //私有方法
    fileprivate class func progressHUDShow(_ type: HUDType, status: String? = nil, error: NSError? = nil) {
        SVProgressHUD.setDefaultMaskType(.none)
        switch type {
        case .success:
            SVProgressHUD.showSuccess(withStatus: status)
            break
        case .errorObject:
            guard let newError = error else {
                SVProgressHUD.showError(withStatus: "Error:出错拉")
                return
            }
            
            if newError.localizedFailureReason == nil {
                SVProgressHUD.showError(withStatus: "Error:出错拉")
            } else {
                SVProgressHUD.showError(withStatus: error!.localizedFailureReason)
            }
            break
        case .errorString:
            SVProgressHUD.showError(withStatus: status)
            break
        case .info:
            SVProgressHUD.showInfo(withStatus: status)
            break
        case .loading:
            SVProgressHUD.setDefaultMaskType(.clear)
            SVProgressHUD.show(withStatus: status)
            break
        }
    }
    
 }
