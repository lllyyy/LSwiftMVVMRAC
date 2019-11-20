 
 
 import UIKit
 import SwiftDate
 extension String {
    
    func hexTodec() -> Int {  //16->10
        let str = self.uppercased()
        var sum = 0
        for i in str.utf8 {
            sum = sum * 16 + Int(i) - 48
            if i >= 65 {
                sum -= 7
            }
        }
        return sum
    }
    
    
    ///
    func encodeToString(_ hexBytes: [UInt8]) -> String {
        var outString = ""
        for val in hexBytes {
            // Prefix with 0 for values less than 16.
            if val < 16 { outString += "0" }
            outString += String(val, radix: 16)
        }
        return outString
    }
    
    func subStr(_ startIndex: Int, _ endIndex: Int ) -> String {//字符串截取
        let startIndex = self.index(self.startIndex, offsetBy:startIndex)
        let endIndex = self.index(startIndex, offsetBy:endIndex)
        let result = self.substring(with: startIndex..<endIndex)
        return result
    }
    
    
    public static func UUIDString() -> String {
        let uuid = UUID().uuidString
        return uuid
    }
    
    var length: Int {
        return self.count
    }
     
    
//    subscript (range: Range<Int>) -> String {
//        get {
//            let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
//            let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
//            return String(self[Range(startIndex..<endIndex)])
//        }
//        
//        set {
//            let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
//            let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
//            let strRange = Range(startIndex..<endIndex)
//            self.replaceSubrange(strRange, with: newValue)
//        }
//    }
//    
    
    func sha1() -> String {
        let data = self.data(using: String.Encoding.utf8)!
        var digest = [UInt8](repeating: 0, count:Int(CC_SHA1_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA1($0, CC_LONG(data.count), &digest)
        }
        let hexBytes = digest.map { String(format: "%02hhx", $0) }
        return hexBytes.joined()
    }
    var OCString: NSString {
        get {
            return self as NSString
        }
    }
    
    var lastPathComponent: String {
        get {
            return self.OCString.lastPathComponent
        }
    }
    
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
    
    //截取字符串(从第几位开始截取)
    func mySubString(from index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)...])
    }
    //从开始截取到第几位
    func mySubString(to index: Int) -> String {
        return String(self[..<self.index(self.startIndex, offsetBy: index)])
    }
    
    func nsrange(fromRange range : Range<String.Index>) -> NSRange {
        return NSRange(range, in: self)
    }
  
    
    //html
//    var attributedHtmlString: NSAttributedString? {
//        guard let data = self.utfData else {
//            return nil
//        }
//        do {
//            return try NSAttributedString(data: data,
//                                          options: [
//                                            .documentType: NSAttributedString.DocumentType.html,
//                                            .characterEncoding: String.Encoding.utf8.rawValue
//                ], documentAttributes: nil)
//        } catch {
//            print(error.localizedDescription)
//            return nil
//        }
//    }
    
    
 }
 
 
 
 // MARK:- 通讯录
 extension String {
    // 判断是否为字母
    func isAlpha() -> Bool {
        if self == "" {
            return false
        }
        
        //jian
        
//        for chr in self.characters {
//            let chrStr = chr.description
//            if (!(chrStr >= "a" && chrStr <= "z") && !(chrStr >= "A" && chrStr <= "Z") ) {
//                pprint("false")
//                return false
//            }
//        }
        pprint("true")
        return true
    }
    
    // 拼音
    func pinyin() -> String {
        let str = NSMutableString(string: self)
        CFStringTransform(str as CFMutableString, nil, kCFStringTransformMandarinLatin, false)
        CFStringTransform(str as CFMutableString, nil, kCFStringTransformStripDiacritics, false)
        return str.replacingOccurrences(of: " ", with: "")
    }
 }
 
 extension String {
    // MARK:- 获取字符串的CGSize
    func getSize(with font: UIFont) -> CGSize {
        return getSize(width: UIScreen.main.bounds.width, font: font)
    }
    // MARK:- 获取字符串的CGSize(指定宽度)
    func getSize(width: CGFloat, font: UIFont) -> CGSize {
        let str = self as NSString
        
        let size = CGSize(width: width, height: CGFloat(Float.greatestFiniteMagnitude))
        return str.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil).size
    }
    
   
    
 }
 
 
 extension String {
    
    func dateYMDHMS() -> DateInRegion {
        if let date = self.toDate(dateFormatA) {
            return date
        }
        return DateInRegion.init()
    }
    func dateYMD() -> DateInRegion {
        return self.toDate(dateFormatB)!
    }
    
    func dateYMD2() -> DateInRegion {
        return self.toDate(dateFormatBB)!
    }
    
    func date2YMD() -> Date {
        if let d = self.toDate(dateFormatB) {
            return d.date
        }
        return Date()
    }
 }
 
 extension String {
    
    /// 生成随机字符串
    ///
    /// - Parameters:
    ///   - count: 生成字符串长度
    ///   - isLetter: false=大小写字母和数字组成，true=大小写字母组成，默认为false
    /// - Returns: String
    static func random(_ count: Int, _ isLetter: Bool = false) -> String {
        
        var ch: [CChar] = Array(repeating: 0, count: count)
        for index in 0..<count {
            
            var num = isLetter ? arc4random_uniform(58)+65:arc4random_uniform(75)+48
            if num>57 && num<65 && isLetter==false { num = num%57+48 }
            else if num>90 && num<97 { num = num%90+65 }
            
            ch[index] = CChar(num)
        }
        pprint("================*****************============")
        pprint(String(cString: ch).length)
        
        if String(cString: ch).length > 32 {
             pprint(String(cString: ch).mySubString(to: 32))
          return String(cString: ch).mySubString(to: 32)
        }
        
        return String(cString: ch)
    }
 }
 
