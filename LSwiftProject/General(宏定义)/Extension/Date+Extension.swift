 
 
 import SwiftDate

 let dateFormatAA = "yyyyMMdd"
 let dateFormatA = "yyyy-MM-dd HH:mm:ss"
 ///yyyy-MM-dd
 let dateFormatB = "yyyy-MM-dd"
 let dateFormatBB = "yyyy年MM月dd日"
 let dateFormatC = "HH:mm"
 extension Date {
 
    func strYMDHMS() -> String {
        return self.toFormat(dateFormatA)
    }
    
    func strYMD( ) -> String {
       return self.toFormat(dateFormatB)
    }
    
    func strYMD2() -> String {
        
        return self.toFormat(dateFormatBB)
    }
    func currYMD() -> Date {
        
        if let d = strYMD().toDate(dateFormatB)  {
            return d.date
        }
        return Date()
    }
    
    
    func dateYMDHMS() -> Date {
        
        if let d = strYMDHMS().toDate(dateFormatA)  {
            return d.date
        }
        return Date()
    }
    
  
    
 }
 
 
