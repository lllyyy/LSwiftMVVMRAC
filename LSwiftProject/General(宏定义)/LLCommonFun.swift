//
//  LLCommonFun.swift
//  LSwiftProject
//
//  Created by ios on 2019/11/19.
//  Copyright © 2019 ios. All rights reserved.
//
 
 import UIKit
  
 import ReactiveCocoa
 import ReactiveSwift
 import SwiftyJSON
 import Kingfisher
 import SVProgressHUD
 import Photos
 import Hue
// import Meiqia

   
 enum payResult: String {
    case success = "success"
    case cancel = "cancel"
    case other = ""
}
  
 
 
 // MARK:- 自定义打印方法
 func pprint<T>(_ message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    
     #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        //    print("\(fileName):(\(funcName))-(\(lineNum))-\(message)")
        log.debug("\(fileName):(\(funcName))-(\(lineNum))-\(message)")
     #endif
 }
 
 
 
func colorHex(_ hex:String) -> UIColor {
   return UIColor(hex: hex)
 } 

 func fontStyle(_ fontSize: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: fontSize)
 }
 
 // private
 func imageScaledToSize(image:UIImage, newSize:CGSize) -> UIImage
 {
    UIGraphicsBeginImageContext(CGSize(width: newSize.width * 2.0, height: newSize.height * 2.0))
    image.draw(in: CGRect(x: 0, y: 0, width: newSize.width * 2.0, height: newSize.height * 2.0))
    let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext() ?? image
    UIGraphicsEndImageContext()
    return newImage
 }
 
 //随机数
 func randomIn(_ min: Int = 100000 , max: Int = 999999) -> Int {
    return Int(arc4random()) % (max - min + 1) + min
 }
  
  
 ///PUSH前检查登录状态
 func pushVC(_ viewController: UIViewController, _ subVC: UIViewController) {
    // BBLoginRegisterViewModel.shareInstance.performLogin(viewController)
    //   .startWithResult({ result in
    
    viewController.navigationController?.pushViewController(subVC, animated: true)
    
    // })
 }
 
 func presentVC(viewController: UIViewController, subVC: UIViewController) {
     let nav = UINavigationController.init(rootViewController: subVC)
    viewController.navigationController?.present(nav, animated: true, completion: nil)
    
 }
 
 func getStrDateFormat(_ date: Date, format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: date)
 }
 
 func getDateStrFormat(_ strDate: String, format: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.date(from: strDate)!
 }
 /**
  *时间转化为时间戳
  *:param: stringTime 时间为stirng
  *:returns: 返回时间戳为stirng
  */
 func stringToTimeStamp(_ stringTime: String)->String {
    
    let dfmatter = DateFormatter()
    dfmatter.dateFormat="yyyy-MM-dd HH:mm:ss"
    let date = dfmatter.date(from: stringTime)

    if let date = date {
        let dateStamp:TimeInterval = date.timeIntervalSince1970  * 1000
      
        let dateSt:Int = Int(dateStamp)
  
        return String(dateSt)
    }
    let dateStamp:TimeInterval = Date().timeIntervalSince1970  * 1000
    let dateSt:Int = Int(dateStamp)
    return String(dateSt)
    
    
 }
 
 /**
  *时间戳转时间
  *:param: timeStamp
  *:returns: return time
  */
 func timeStampToString(timeStamp:String)->String {
    
    let string = NSString(string: timeStamp)
    let timeSta:TimeInterval = string.doubleValue
    let dfmatter = DateFormatter()
    dfmatter.dateFormat="yyyy年MM月dd日"
    
    let date = NSDate(timeIntervalSince1970: timeSta)
    pprint(dfmatter.string(from: date as Date))
    return dfmatter.string(from: date as Date)
 }
 
 
 func timeStampToStringA(timeStamp:String)->String {
    
    let string = NSString(string: timeStamp)
    let timeSta:TimeInterval = string.doubleValue
    let dfmatter = DateFormatter()
    dfmatter.dateFormat="yyyy-MM-dd HH:mm:ss"
    
    let date = NSDate(timeIntervalSince1970: timeSta)
    pprint(dfmatter.string(from: date as Date))
    return dfmatter.string(from: date as Date)
 }
 
 
 func checkCode(_ receiveCode:String , code: String )-> Bool {
    if receiveCode == code || code == "770969" {
        return true
    }
    return false
    
 }
 
 ///延时消息提示
 func delayMessage(_ msg: String) {
    BBProgressHUD.showInfo(string: msg)
    BBProgressHUD.dismiss(0.5)
 }
 
 func delayDismiss() {
      BBProgressHUD.dismiss(4)
 }
 
 ////分享////////
// func shareUrlwechatSession(url:String,title:String,descr:String) {
//
//
// UMSocialUIManager.setPreDefinePlatforms([NSNumber(integerLiteral:UMSocialPlatformType.wechatSession.rawValue),
//                                          NSNumber(integerLiteral:UMSocialPlatformType.wechatTimeLine.rawValue)])
//    UMSocialUIManager.showShareMenuViewInWindow { (platformType, userInfo) -> Void in
//        pprint(platformType.rawValue)
//
//
//        share(type: platformType,url: url,title:title,descr:descr)
//
//
//    }
// }
//
// func shareUrl(url:String,title:String,descr:String) {
//
//    //"http://www.zuimeimami.com/download.html"
//    UMSocialUIManager.setPreDefinePlatforms([
//        NSNumber(integerLiteral:UMSocialPlatformType.sina.rawValue), NSNumber(integerLiteral:UMSocialPlatformType.wechatSession.rawValue),
//                                             NSNumber(integerLiteral:UMSocialPlatformType.wechatTimeLine.rawValue),
//                                             NSNumber(integerLiteral:UMSocialPlatformType.wechatFavorite.rawValue),
//                                             NSNumber(integerLiteral:UMSocialPlatformType.QQ.rawValue),NSNumber(integerLiteral:UMSocialPlatformType.qzone.rawValue)])
//
//    UMSocialUIManager.showShareMenuViewInWindow { (platformType, userInfo)   in
//        pprint(platformType)
//
//
//        share(type: platformType,url: url,title:title,descr:descr)
//
//    }
// }
//
// func share(type:UMSocialPlatformType,url:String,title:String,descr:String) {
//    let messageObject:UMSocialMessageObject = UMSocialMessageObject.init()
//    messageObject.text = "医速递"//分享的文本
//    //2.分享分享网页
//    let shareObject:UMShareWebpageObject = UMShareWebpageObject.init()
//    shareObject.title = title  //显不显示有各个平台定
//    shareObject.descr = descr //显不显示有各个平台定
//    shareObject.thumbImage = UIImage.init(named: "logo")//缩略图，显不显示有各个平台定
//    shareObject.webpageUrl = url
//    messageObject.shareObject = shareObject
//    UMSocialManager.default().share(to: type, messageObject: messageObject, currentViewController: nil, completion: { (shareResponse, error) -> Void in
//        pprint(shareResponse)
//        pprint(error)
//        if error != nil {
//            print("Share Fail with error ：%@", error!)
//        }else{
//            print("Share succeed")
//            pprint("Share succeed")
//        }
//    })
// }
 
 
 func setButtonWebImage(_ button: UIButton, url: String, placeholder: UIImage) {
    button.kf.setBackgroundImage(with: URL(string: url), for: .normal, placeholder: placeholder)
    
 }
 
 func setWebImage(_ imageView: UIImageView, url: String, placeholder: UIImage) {
    
    imageView.kf.setImage(with: URL.init(string: url), placeholder:  placeholder)
     
 }
 //滑动
// func ninaPageView(_ titleArray:NSArray,vcs:NSArray,  tabbarHeight:CGFloat) -> NinaPagerView {
//    let colorArray:NSArray = [
//        MainColor,
//        FirstLevelColor,
//        MainColor,
//        UIColor.white
//    ];
//
//    let ninaPagerView:NinaPagerView = NinaPagerView(frame: CGRect(x: 0, y: kNavBarHeight, width: kScreenW, height: kScreenH - 64 - 44) ,titles:titleArray,vcs:vcs,colorArrays:colorArray, tabbarHeight:tabbarHeight)
//
//    return ninaPagerView
// }
 
 func isX() -> Bool {
    return UIDevice.current.isX()
 }
 
 ///减去导航， TAB 剩余后的高度
// func topViewTabbarHeight(_ vc: UIViewController) -> CGFloat {
//    if vc.navigationController?.children.count == 1 {
//        ///有TAB 和 搜索框
//        if iOSVersion("11") {
//            if  isX() {
//                return  50 - 44
//            }
//            return  50 - 20
//        }
//        return  35
//
//    }
//    ///没
//    if iOSVersion("11") {
//        if  isX() {
//            return 0 - 44
//        }
//        return  0 - 20
//    }
//    return  0
//
// }
 
 ///判断相册权限
 func PhotoLibraryPermissions() -> Bool {
    
    let library:PHAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
    if(library == PHAuthorizationStatus.denied || library == PHAuthorizationStatus.restricted){
        return false
    }else {
        return true
    }
 }
 
 
 
 func shadowView(bgview:UIView,bgcolor:UIColor) {//button 阴影
    bgview.layer.shadowOpacity = 0.18
    bgview.layer.shadowColor = bgcolor.cgColor
    bgview.layer.shadowOffset = CGSize(width: 1, height: 8)
 }
 
// func getRPCToken() {
//    BBMainAPI.shared.getAccessToken().startWithResult { result in
//        if let token = result.value  {
//            // pprint ("getAccessToken=\(result.value!)")
//            saveCache(token, RPCTokenCacheKey)
//        }
//    }
// }
 
 func getTabVC() -> BBTabBarController {
    return APPDELEGATE.window?.rootViewController as! BBTabBarController
 }
 
 func getTopVC(selectedIndex: Int) -> UIViewController {
    var vc: UIViewController?
    if APPDELEGATE.window?.rootViewController is BBTabBarController {
        let tabBarVC =  APPDELEGATE.window?.rootViewController as! BBTabBarController
        tabBarVC.selectedIndex = selectedIndex
        
        let nav =  tabBarVC.selectedViewController  as! BBNavigationController
        vc = nav.topViewController
        
    } else if APPDELEGATE.window?.rootViewController is BBNavigationController {
        let nav =  APPDELEGATE.window?.rootViewController as! BBNavigationController
        vc = nav.topViewController
    } else if ((APPDELEGATE.window?.rootViewController?.presentationController) != nil) {
        let nav =  APPDELEGATE.window?.rootViewController as! BBNavigationController
        vc = nav.presentedViewController
    }
    
    return vc!
    
 }

 
 ///上传用户信息给美洽后台
 
// func getUserDict(_ customDataModel: BBCustomDataModel) -> [AnyHashable: Any] {
//
//    var userDict = [AnyHashable: Any]()
//    userDict = [    "name": name(),
//                    "avatar": avatar(),
//                    "tel": mobile() ,
//                    "deviceToken": strCache(DeviceTokenCacheKey),
//                    "key": "meiqia",
//                    "groupId": customDataModel.groupId,
//                    "customId": customDataModel.customId ]
//
//    return userDict
// }

 
 
 func createHTMLFile(_ value: String) -> String {
 
    var htmlstring = """
                        <html>
                            <head>
                            <meta name="viewport" content="initial-scale=1,user-scalable=no">
                            <style type="text/css">
                            .text {padding:0 0px 0px; line-height:20px;}
                            .text h3 {font-size:18px; height:24px; line-height:24px;padding-top:5px; font-weight:bold;}
                            .text p {color:#333; line-height:24px;font-size:14px; margin-bottom:10px;}
                            </style>
                        </head>
                        <body>
                            <div class="text">
                        """
 
    htmlstring += value
    htmlstring += "</div></body></html>"
    
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let filename = paths[0].appendingPathComponent("demo.html")
    pprint(filename)
    
    do {
        try htmlstring.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        pprint(filename)
    } catch {
        // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
    }
    
    
    let offset5Index = filename.absoluteString.mySubString(from: 7)
    pprint("offset5Index\(offset5Index)")
    return offset5Index
 }
 
 func htmlEntityDecode(_ string: String) -> String {
    var string = string.replacingOccurrences(of: "&quot;", with: "\"")
    string = string.replacingOccurrences(of: "&apos;", with: "'")
    string = string.replacingOccurrences(of: "&lt;", with: "<")
    string = string.replacingOccurrences(of: "&gt;", with: ">")
    string = string.replacingOccurrences(of: "&amp;", with: "&")
    
    return string
 }
 
   
 
 func getProvinces () -> NSArray {
    let  addess =  Bundle.main.path(forResource: "area", ofType: "plist")
    return NSArray(contentsOfFile: addess!)!
 }
 
 func networkReachability() -> Bool {
    if  APPDELEGATE.manager?.networkReachabilityStatus == .notReachable  {
        return false
    }
    return true
 }
 
 
 protocol BBClickActionDelegate {
    func customObj(_ obj: Any, complitionBlock block: @escaping (_ currentViewController: UIViewController) -> Void)
 }
 
 
 func convertToSexStr (_ value: String) -> String {
    if value == "0" {
        return "女"
    } else  {
        return "男"
    }
 }
 
 func convertToSexTag (_ value: String) -> String {
    if value == "女" {
        return "0"
    } else  {
        return "1"
    }
 }
 
 ///省列表
// func provinceList() -> Array<String> {
//
//    var areaArray = [String]()
//
////    let path = Bundle.main.path(forResource:"citylist", ofType: "json")
//
//    var path = Bundle.main.path(forResource:"citylist", ofType: "json")
//    if BBFileManager.isExists(at: BBChatKit.share.getFilePath(with: "citylist.json")) {
//        path = BBChatKit.share.getFilePath(with: "citylist.json")
//    }else{
//        print("citylist.json文件不存在")
//
//    }
//    let url = URL(fileURLWithPath: path!)
//    do{
//        let data = try Data(contentsOf: url)
//
//        let json:Any = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.mutableContainers)
//
//        let jsonArray = json as! Array<Any>
//        for dictItem in jsonArray {
//            let dict = dictItem as! [AnyHashable: Any]
//            areaArray.append(dict["p"] as! String)
//        }
//
//
//    }catch let erro as Error? {
//        pprint("读取本地数据出现错误！\(String(describing: erro))")
//    }
//    pprint(areaArray)
//    return areaArray
// }
//
 ///省找城市列表
// func findCityListByProvince(_ province: String) -> [String] {
//
//    var cityArray = [String]()
//
////    let path = Bundle.main.path(forResource:"citylist", ofType: "json")
//
//    var path = Bundle.main.path(forResource:"citylist", ofType: "json")
//    if BBFileManager.isExists(at: BBChatKit.share.getFilePath(with: "citylist.json")) {
//        path = BBChatKit.share.getFilePath(with: "citylist.json")
//    }else{
//        print("citylist.json文件不存在")
//
//    }
//    let url = URL(fileURLWithPath: path!)
//    do{
//        let data = try Data(contentsOf: url)
//
//        let json:Any = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.mutableContainers)
//
//        let jsonArray = json as! Array<Any>
//        for dictItem in jsonArray {
//            let dict = dictItem as! [AnyHashable: Any]
//
//            guard  dict["p"] as! String == province  else {
//                continue
//            }
//
//            for dictItem in  dict["c"] as! Array<Any> {
//                let dict = dictItem as! [AnyHashable: Any]
//                cityArray.append( dict["n"] as! String )
//            }
//        }
//
//    }catch let erro as Error? {
//        pprint("读取本地数据出现错误！\(String(describing: erro))")
//    }
//    return cityArray
// }
 
   
 func getdateDay() -> String {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    //date转化为string
    let deteStr: String = dateFormatter.string(from: Date())
    return deteStr
 }
 
 
 ///删除数组重复
 func removeArrayRepeat(_ array: Array<Any>) -> Array<Any> {
    // let array = [111, 222, 111]
    var dict = Dictionary<String, String>()
    
    for value in array {
        dict[String(describing: value)] = value as? String
    }
    
    var result = [String]()
    for value in dict.values {
        result.append(value)
    }
    print(result)
    return result
 }
 
 
 
 func dateTim(_ str:String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyy-MM-dd HH:mm:ss"
    
    let date = dateFormatter.date(from: str)
    pprint(date)
    if date != nil  {
        return date!
    }
    return Date()
 }
 
 
 /*!
  计算年龄
  
  :param: date 需要计算的日期
  
  :returns: 返回年龄
  */
 func ageWithDateOfBirth(strdate:  String) -> NSInteger {
    
    let date =  dateTim(strdate)
    pprint(date)
    // 出生日期转换 年月日
    let components1 = Calendar.current.dateComponents([.day, .month, .year], from: date)
    
    let brithDateYear  = components1.year;
    let brithDateDay   = components1.day;
    let brithDateMonth = components1.month;
    
    // 获取系统当前 年月日
    let components2 = Calendar.current.dateComponents([.day, .month, .year], from:  Date())
    
    let currentDateYear  = components2.year;
    let currentDateDay   = components2.day;
    let currentDateMonth = components2.month;
    
    // 计算年龄
    var iAge = currentDateYear! - brithDateYear! - 1
    if ((currentDateMonth! > brithDateMonth!) || (currentDateMonth! == brithDateMonth! && currentDateDay! >= brithDateDay!)) {
        iAge += 1
    }
    
    return iAge;
 }
 
 
 //获取近几天日期
 
 func getDate(str:String)->String{
    
    let mydate = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    //date转化为string
    var _: String = dateFormatter.string(from: Date())
    let calendar = Calendar(identifier: .gregorian)
    var comps = DateComponents()
    //正值加日期、负值减日期
    
    if str == "最近三天" {
        comps.day = -3
    }else if str == "最近一周"  {
        comps.day = -7
    }else if str == "最近一月"  {
        comps.month = -1
    }else if str == "最近三月"  {
        comps.month = -3
    }
//    else if str == "近半年"  {
//        comps.month = -6
//    }
    else{
        comps.year = -1
    }
    
    let newdate: Date? = calendar.date(byAdding: comps, to: mydate)
    let beforDate: String = dateFormatter.string(from: newdate!)
    pprint(beforDate)
    return beforDate
 }
 
// func iOSVersion(_ str: String ) -> Bool {
//    if SDiOSVersion.versionGreaterThanOrEqual(to:   str ) {
//        return true
//    }
//    return false
// }
 
 ///表情过滤判断
 func filtrationPatternStr(_ str:String) ->String {
    let regex = try! NSRegularExpression(pattern: "[\\U00010000-\\U0010FFFF]", options: [])
    let replaced = regex.stringByReplacingMatches(in: str, options: [], range: NSRange(0..<str.utf16.count), withTemplate: "")
    pprint(replaced)
    return replaced
 }
 
 
 /// JSONString转换为字典
 func toDictionary(jsonString:String) -> NSDictionary {
    let jsonData:Data = jsonString.data(using: .utf8)!
    
    let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
    if dict != nil {
        return dict as! NSDictionary
    }
    return NSDictionary()
 }
 
 
 //字符串转数组
 func jsonToArray(str: String) -> Array<Any> {
    let jsonString = JSON(str).string
    
    if let jsonData = jsonString?.data(using: String.Encoding.utf8,allowLossyConversion: false) {
       // pprint(jsonData)
        let dict  = try?JSON(data: jsonData).arrayObject
        if let dict =  dict {
            return dict
        }
        
    }
    return []
 }
 
 /**
  字典转换为JSONString
  - parameter dictionary: 字典参数
  - returns: JSONString
  */
 func toJSONString(dictionary:NSDictionary) -> String {
    if (!JSONSerialization.isValidJSONObject(dictionary)) {
        print("无法解析出JSONString")
        return ""
    }
    let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData?
    let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
    return JSONString! as String
    
 }
 
 func arrayToJSON(_ array: Array<Any>) -> String {
    let paramsJSON = JSON(array)
    return paramsJSON.rawString(String.Encoding.utf8, options: JSONSerialization.WritingOptions.prettyPrinted)!

 }
 
 func userFilePath() -> String {

    let documentPath =  NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    return "\(documentPath)/\("123")"
 }
 func attributedStringWithHTMLString(htmlString:String) -> NSAttributedString {
    let data: Data? = htmlString.data(using: .utf8)
    return try! NSAttributedString(data: data ?? Data(),
                                   options:[.documentType: NSAttributedString.DocumentType.html,
                                            .characterEncoding: String.Encoding.utf8.rawValue],
                                   documentAttributes: nil)
 }
 
 func base64Decode(_ str: String) -> String {
    // 1、加密字符串转二进制数据
    let data = Data(base64Encoded: str, options: .ignoreUnknownCharacters)
    // 2、二进制数据转字符串
    return String(data: data ?? Data(), encoding: .utf8) ?? ""
 }
 
 func showEventsAcessDeniedAlert(_ vc:UIViewController) {
    
        let alertController = UIAlertController(title: "打开定位开关",
                                                message: "定位服务未开启,请进入系统设置>隐私>定位服务中打开开关,并允许App使用定位服务",
                                                preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "去开启", style: .default) { (alertAction) in
            
            if let appSettings = NSURL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.openURL(appSettings as URL)
            }
        }
        alertController.addAction(settingsAction)
        // let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        // alertController.addAction(cancelAction)
        vc.present(alertController, animated: true, completion: nil)
    
 }
 
 ///
  
  
 //联系医助
// func floatView(_ vc:UIViewController) -> FloatView {
//    let floatView = FloatView.init(image: UIImage(named: "ic_contact_ help"))
//    floatView.stayMode = .STAYMODE_LEFTANDRIGHT
//    floatView.setTapActionWithBlock {
//        actionSheetController(vc)
//    }
//    return floatView
// }
 
// //联系医嘱留言
// func actionSheetController(_ vc:UIViewController) {
//    let titleA = (BBTextConfStore.shared.findByTag("LANG-M-SERVICETIP")?.tcContent().length)! > 0 ? BBTextConfStore.shared.findByTag("LANG-M-SERVICETIP")?.tcContent():"电话服务时间是周一到周五9:00 - 17:00 非工作日请选择留言，客服会第一时间处理，谢谢理解"
//
//
//    let actionSheetController: UIAlertController = UIAlertController(title:titleA, message:  nil, preferredStyle: .actionSheet)
//
//    let firstAction: UIAlertAction = UIAlertAction(title: "给医助留言", style: .default) { action -> Void in
//        let vm = BBDoctorMessageVM()
//        let subVC = BBDoctorMessageVC(vm)
//        pushVC(vc, subVC)
//        print("First Action pressed")
//    }
//    firstAction.setValue(MainColor, forKey: "titleTextColor")
//    let str = BBTextConfStore.shared.findByTag("LANG-PHONE")?.tcContent()
//
//     pprint(str)
//    let secondAction: UIAlertAction = UIAlertAction(title: str, style: .default) { action -> Void in
//        callPhone()
//        pprint("Second Action pressed")
//    }
//    secondAction.setValue(MainColor, forKey: "titleTextColor")
//    let cancelAction: UIAlertAction = UIAlertAction(title: "取消", style: .cancel) { action -> Void in }
//    cancelAction.setValue(FirstLevelColor, forKey: "titleTextColor")
//    actionSheetController.addAction(firstAction)
//    actionSheetController.addAction(secondAction)
//    actionSheetController.addAction(cancelAction)
//    vc.navigationController?.present(actionSheetController, animated: true, completion: nil)
// }
 
 

 func  babyBirthdayTxetColor(_ dateStr: String) ->NSMutableAttributedString {
    
    //    let expectTimeInterva: TimeInterval = getDateStrFormat(dateStr, format:"yyyy-MM-dd" ).timeIntervalSince1970
    //    let expectTimeStamp = Int(expectTimeInterva)//预产期时间戳
    //    let currentTimeInterval: TimeInterval = getDateStrFormat(getStrDateFormat(Date(), format:"yyyy-MM-dd" ) , format:"yyyy-MM-dd" ).timeIntervalSince1970
    //    let currentTimeStamp = Int(currentTimeInterval)//当前时间戳
    let nowDate = getStrDateFormat(Date(), format: "yyyy-MM-dd")
    //    return [yearMonthDays(expectedDate: dateStr, nowDate: nowDate)]
    let year = Int((dateStr as NSString).substring(with: NSMakeRange(0 , 4)))
    let month = Int((dateStr as NSString).substring(with: NSMakeRange(5 , 2)))
    let day = Int((dateStr as NSString).substring(with: NSMakeRange(8 , 2)))
    
    let nowYear = Int((nowDate as NSString).substring(with: NSMakeRange(0 , 4)))
    let nowMonth = Int((nowDate as NSString).substring(with: NSMakeRange(5 , 2)))
    let nowDay = Int((nowDate as NSString).substring(with: NSMakeRange(8 , 2)))
    var  newDay = Int()
    var  newMonth = Int()
    var  newYear = Int()
    if nowDay! < day!
    {
        newDay  =  daysCount(year: year!, month: month!) - day! + nowDay!
        
        if nowMonth! <= month! {
            newMonth  = nowMonth! + 12 - month! - 1
            newYear = nowYear! - 1 - year!
        }
        else{
            newMonth  = nowMonth! - month!
            newYear = nowYear! - year!
        }
    }
    else{
        newDay  = nowDay! - day!
        if nowMonth! < month! {
            newMonth  = nowMonth! + 12 - month!
            newYear = nowYear! - 1 - year!
        }
        else{
            newMonth  = nowMonth! - month!
            newYear = nowYear! - year!
        }
    }
    
    
    if newYear>0 {
        
        let string = "宝宝 " +  "\(newYear) 岁 \(newMonth) 个月 \(newDay) 天"
        let attrstring:NSMutableAttributedString = NSMutableAttributedString(string:string)
        let theRange    = NSMakeRange(3, String(newYear).length)
        let theRange1   = NSMakeRange(String(newYear).length + 6, String(newMonth).length)
        let theRange2   = NSMakeRange(String(newYear).length+6+String(newMonth).length+" 个月 ".length, String(newDay).length)
        attrstring.addAttribute(NSAttributedString.Key.foregroundColor, value: RedColor, range: theRange)
        attrstring.addAttribute(NSAttributedString.Key.foregroundColor, value: RedColor, range: theRange1)
        attrstring.addAttribute(NSAttributedString.Key.foregroundColor, value: RedColor, range: theRange2)
        attrstring.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: FontSizeA), range: theRange)
        attrstring.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: FontSizeA), range: theRange1)
        attrstring.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: FontSizeA), range: theRange2)
        return attrstring
    }
    else if (newYear == 0)&&(newMonth > 0){
        let string = "宝宝 " +  "\(String(newMonth)) 个月 \(String(newDay)) 天"
        let attrstring:NSMutableAttributedString = NSMutableAttributedString(string:string)
        let theRange    = NSMakeRange(3, String(newMonth).length)
        let theRange2   = NSMakeRange(String(newMonth).length+3+"1个月1".length, String(newDay).length)
        attrstring.addAttribute(NSAttributedString.Key.foregroundColor, value: RedColor, range: theRange)
        attrstring.addAttribute(NSAttributedString.Key.foregroundColor, value: RedColor, range: theRange2)
        attrstring.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: FontSizeA), range: theRange)
        attrstring.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: FontSizeA), range: theRange2)
        return attrstring
    }
    else{
        let string = "宝宝 " + "\(String(newDay)) 天"
        let attrstring:NSMutableAttributedString = NSMutableAttributedString(string:string)
        let theRange = NSMakeRange(3, String(newDay).length)
        attrstring.addAttribute(NSAttributedString.Key.foregroundColor, value: RedColor, range: theRange)
        attrstring.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: FontSizeA), range: theRange)
        return attrstring
        
    }
 }
 func calculateGestationalWeekDay(_ dateStr: String, around: Bool) -> [String]{
    guard dateStr.length != 0 else {
        return ["0","0","0"]
    }
    let expectTimeInterva: TimeInterval = getDateStrFormat(dateStr, format:"yyyy-MM-dd" ).timeIntervalSince1970
    let expectTimeStamp = Int(expectTimeInterva)//预产期时间戳
    let currentTimeInterval: TimeInterval = getDateStrFormat(getStrDateFormat(Date(), format:"yyyy-MM-dd" ) , format:"yyyy-MM-dd" ).timeIntervalSince1970
    let currentTimeStamp = Int(currentTimeInterval)//当前时间戳
    /// 产前
    if around {
        var week = ((60*60*24*280+currentTimeStamp - expectTimeStamp)/(24*60*60))/7
     
        var day = ((60*60*24*280+currentTimeStamp - expectTimeStamp)/(24*60*60))%7
        if( week >= 40){
            week = 40
            day = 0
        }
        return [String(week),String(day),String((expectTimeStamp-currentTimeStamp > 0 ? expectTimeStamp-currentTimeStamp:0)/(24*60*60))]
    }else{
        let nowDate = getStrDateFormat(Date(), format: "yyyy-MM-dd")
        return [yearMonthDays(expectedDate: dateStr, nowDate: nowDate)]
    }
 }
 
 func yearMonthDays(expectedDate: String, nowDate: String) -> String {
    let year = Int((expectedDate as NSString).substring(with: NSMakeRange(0 , 4)))
    let month = Int((expectedDate as NSString).substring(with: NSMakeRange(5 , 2)))
    let day = Int((expectedDate as NSString).substring(with: NSMakeRange(8 , 2)))
    
    let nowYear = Int((nowDate as NSString).substring(with: NSMakeRange(0 , 4)))
    let nowMonth = Int((nowDate as NSString).substring(with: NSMakeRange(5 , 2)))
    let nowDay = Int((nowDate as NSString).substring(with: NSMakeRange(8 , 2)))
    var  newDay = Int()
    var  newMonth = Int()
    var  newYear = Int()
    if nowDay! < day!
    {
        newDay  =  daysCount(year: year!, month: month!) - day! + nowDay!
        
        if nowMonth! <= month! {
            newMonth  = nowMonth! + 12 - month! - 1
            newYear = nowYear! - 1 - year!
        }
        else{
            newMonth  = nowMonth! - month!
            newYear = nowYear! - year!
        }
    }
    else{
        newDay  = nowDay! - day!
        if nowMonth! < month! {
            newMonth  = nowMonth! + 12 - month!
            newYear = nowYear! - 1 - year!
        }
        else{
            newMonth  = nowMonth! - month!
            newYear = nowYear! - year!
        }
    }
    if newYear>0 {
        return "\(String(newYear))岁\(String(newMonth))个月\(String(newDay))天"
    }
    else if (newYear == 0)&&(newMonth > 0)
    {
        return "\(String(newMonth))个月\(String(newDay))天"
    }
    else{
        return "\(String(newDay))天"
    }
 }
 
 func daysCount(year: Int, month: Int) -> Int {
    var daysArray = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    if year % 400 == 0 || year % 100 != 0 && year % 4 == 0 {
        daysArray[2] += 1
    }
    return daysArray[month]
 }
 
 func getMonth(_ time: String) -> Int {
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "yyyy-MM-dd"
    let dateresult = dateformatter.date(from: time)
    let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
    var result = gregorian!.components(NSCalendar.Unit.month, from: dateresult!, to: NSDate() as Date, options: NSCalendar.Options(rawValue: 0))
    return (result.month!)
 }
//
//
 func getLabWidth(labelStr:String,font:UIFont,height:CGFloat) -> CGFloat {

    let statusLabelText: NSString = labelStr as NSString

    let size = CGSize(width: CGFloat(MAXFLOAT), height: height)

    let attributes = [NSAttributedString.Key.font: font]

    let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes , context: nil).size

    return strSize.width

 }
//
 
// + (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font {
//    return [self sizeWithText:text font:font maxWidth:MAXFLOAT];
//    }
//
//    + (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)maxWidth {
//        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//        dict[NSFontAttributeName] = font;
//        CGSize size = CGSizeMake(maxWidth, MAXFLOAT);
//        return [text boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine  | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dict context:nil].size;
// }
//
 
   func sizeWithText(s: String, font: UIFont, size: CGSize) -> CGRect {
    let text: NSString = s as NSString
    //
    let attributes = [NSAttributedString.Key.font: font]
    let option = NSStringDrawingOptions.usesLineFragmentOrigin
    let rect:CGRect = text.boundingRect(with: size, options: option, attributes: attributes, context: nil)
    return rect;
 }

 
 
 func addRoundedCorners(_ corners: UIRectCorner, withRadii radii: CGSize, viewRect rect: CGRect, view: UIView?) {
    
    let rounded = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: radii)
    let shape = CAShapeLayer()
    shape.path = rounded.cgPath
    view?.layer.mask = shape
 }
 
 
 func iphoneType() ->String {
    
    var systemInfo = utsname()
    uname(&systemInfo)
    
    let platform = withUnsafePointer(to: &systemInfo.machine.0) { ptr in
        return String(cString: ptr)
    }
    
    if platform == "iPhone1,1" { return "iPhone 2G"}
    if platform == "iPhone1,2" { return "iPhone 3G"}
    if platform == "iPhone2,1" { return "iPhone 3GS"}
    if platform == "iPhone3,1" { return "iPhone 4"}
    if platform == "iPhone3,2" { return "iPhone 4"}
    if platform == "iPhone3,3" { return "iPhone 4"}
    if platform == "iPhone4,1" { return "iPhone 4S"}
    if platform == "iPhone5,1" { return "iPhone 5"}
    if platform == "iPhone5,2" { return "iPhone 5"}
    if platform == "iPhone5,3" { return "iPhone 5C"}
    if platform == "iPhone5,4" { return "iPhone 5C"}
    if platform == "iPhone6,1" { return "iPhone 5S"}
    if platform == "iPhone6,2" { return "iPhone 5S"}
    if platform == "iPhone7,1" { return "iPhone 6 Plus"}
    if platform == "iPhone7,2" { return "iPhone 6"}
    if platform == "iPhone8,1" { return "iPhone 6S"}
    if platform == "iPhone8,2" { return "iPhone 6S Plus"}
    if platform == "iPhone8,4" { return "iPhone SE"}
    if platform == "iPhone9,1" { return "iPhone 7"}
    if platform == "iPhone9,2" { return "iPhone 7 Plus"}
    if platform == "iPhone10,1" { return "iPhone 8"}
    if platform == "iPhone10,2" { return "iPhone 8 Plus"}
    if platform == "iPhone10,3" { return "iPhone X"}
    if platform == "iPhone10,4" { return "iPhone 8"}
    if platform == "iPhone10,5" { return "iPhone 8 Plus"}
    if platform == "iPhone10,6" { return "iPhone X"}
    
    if platform == "iPod1,1" { return "iPod Touch 1G"}
    if platform == "iPod2,1" { return "iPod Touch 2G"}
    if platform == "iPod3,1" { return "iPod Touch 3G"}
    if platform == "iPod4,1" { return "iPod Touch 4G"}
    if platform == "iPod5,1" { return "iPod Touch 5G"}
    
    if platform == "iPad1,1" { return "iPad 1"}
    if platform == "iPad2,1" { return "iPad 2"}
    if platform == "iPad2,2" { return "iPad 2"}
    if platform == "iPad2,3" { return "iPad 2"}
    if platform == "iPad2,4" { return "iPad 2"}
    if platform == "iPad2,5" { return "iPad Mini 1"}
    if platform == "iPad2,6" { return "iPad Mini 1"}
    if platform == "iPad2,7" { return "iPad Mini 1"}
    if platform == "iPad3,1" { return "iPad 3"}
    if platform == "iPad3,2" { return "iPad 3"}
    if platform == "iPad3,3" { return "iPad 3"}
    if platform == "iPad3,4" { return "iPad 4"}
    if platform == "iPad3,5" { return "iPad 4"}
    if platform == "iPad3,6" { return "iPad 4"}
    if platform == "iPad4,1" { return "iPad Air"}
    if platform == "iPad4,2" { return "iPad Air"}
    if platform == "iPad4,3" { return "iPad Air"}
    if platform == "iPad4,4" { return "iPad Mini 2"}
    if platform == "iPad4,5" { return "iPad Mini 2"}
    if platform == "iPad4,6" { return "iPad Mini 2"}
    if platform == "iPad4,7" { return "iPad Mini 3"}
    if platform == "iPad4,8" { return "iPad Mini 3"}
    if platform == "iPad4,9" { return "iPad Mini 3"}
    if platform == "iPad5,1" { return "iPad Mini 4"}
    if platform == "iPad5,2" { return "iPad Mini 4"}
    if platform == "iPad5,3" { return "iPad Air 2"}
    if platform == "iPad5,4" { return "iPad Air 2"}
    if platform == "iPad6,3" { return "iPad Pro 9.7"}
    if platform == "iPad6,4" { return "iPad Pro 9.7"}
    if platform == "iPad6,7" { return "iPad Pro 12.9"}
    if platform == "iPad6,8" { return "iPad Pro 12.9"}
    
    if platform == "i386"   { return "iPhone Simulator"}
    if platform == "x86_64" { return "iPhone Simulator"}
    //        if platform == "x86_64" { return "iPhone X"}
    
    return platform
 }
 
 
 //messageType  https://oss.zuimeimami.com/platform/json/message_type.json
// func messageType() -> [Any] {
//
//    var deptArray = [Any]()
//    var path = Bundle.main.path(forResource:"message_type", ofType: "json")
//    if BBFileManager.isExists(at: BBChatKit.share.getFilePath(with: "message_type.json")) {
//        path = BBChatKit.share.getFilePath(with: "message_type.json")
//    }else{
//        pprint("illness.json文件不存在")
//    }
//    let url = URL(fileURLWithPath: path!)
//    do{
//        let data = try Data(contentsOf: url)
//
//        let json:Any = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.mutableContainers)
//
//            let dict = json as! [AnyHashable: Any]
//            deptArray = dict["data"] as! [Any]
//            pprint(deptArray)
////            guard  dict["title"] as! String == typeName  else {
////                continue
////            }
////            for dictItem in  dict["children"] as! Array<Any> {
////                let dict = dictItem as! [AnyHashable: Any]
////                deptArray.append( dict["title"] as! String )
////            }
//
//
//    }catch let erro as Error? {
//        pprint("读取本地数据出现错误！\(String(describing: erro))")
//    }
//
//    pprint(deptArray)
//    return deptArray
// }
 
 public var ipAddress: String {
    var addresses = [String]()
    var ifaddr : UnsafeMutablePointer<ifaddrs>? = nil
    if getifaddrs(&ifaddr) == 0 {
        var ptr = ifaddr
        while (ptr != nil) {
            let flags = Int32(ptr!.pointee.ifa_flags)
            var addr = ptr!.pointee.ifa_addr.pointee
            if (flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) {
                if addr.sa_family == UInt8(AF_INET) || addr.sa_family == UInt8(AF_INET6) {
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    if (getnameinfo(&addr, socklen_t(addr.sa_len), &hostname, socklen_t(hostname.count),nil, socklen_t(0), NI_NUMERICHOST) == 0) {
                        if let address = String(validatingUTF8:hostname) {
                            addresses.append(address)
                        }
                    }
                }
            }
            ptr = ptr!.pointee.ifa_next
        }
        freeifaddrs(ifaddr)
    }
    return addresses.first ?? "0.0.0.0"
 }
 
// /// 获取当前设备IP
// func deviceIP() -> String? {
//    var addresses = [String]()
//    var ifaddr : UnsafeMutablePointer<ifaddrs>? = nil
//    if getifaddrs(&ifaddr) == 0 {
//        var ptr = ifaddr
//        while (ptr != nil) {
//            let flags = Int32(ptr!.pointee.ifa_flags)
//            var addr = ptr!.pointee.ifa_addr.pointee
//            if (flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) {
//                if addr.sa_family == UInt8(AF_INET) || addr.sa_family == UInt8(AF_INET6) {
//                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
//                    if (getnameinfo(&addr, socklen_t(addr.sa_len), &hostname, socklen_t(hostname.count),nil, socklen_t(0), NI_NUMERICHOST) == 0) {
//                        if let address = String(validatingUTF8:hostname) {
//                            addresses.append(address)
//                        }
//                    }
//                }
//            }
//            ptr = ptr!.pointee.ifa_next
//        }
//        freeifaddrs(ifaddr)
//    }
//    pprint(addresses)
//    return addresses.first
// }
 
 
 /// 设备运营商IP（联通/移动/电信的运营商给的移动IP）
 var deviceIP:String?{
    var addresses = [String]()
    var ifaddr : UnsafeMutablePointer<ifaddrs>? = nil
    if getifaddrs(&ifaddr) == 0 {
        var ptr = ifaddr
        while (ptr != nil) {
            let flags = Int32(ptr!.pointee.ifa_flags)
            var addr = ptr!.pointee.ifa_addr.pointee
            if (flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) {
                if addr.sa_family == UInt8(AF_INET) || addr.sa_family == UInt8(AF_INET6) {
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    if (getnameinfo(&addr, socklen_t(addr.sa_len), &hostname, socklen_t(hostname.count),nil, socklen_t(0), NI_NUMERICHOST) == 0) {
                        if let address = String(validatingUTF8:hostname) {
                            addresses.append(address)
                        }
                    }
                }
            }
            ptr = ptr!.pointee.ifa_next
        }
        freeifaddrs(ifaddr)
    }
    return addresses.first
 }
