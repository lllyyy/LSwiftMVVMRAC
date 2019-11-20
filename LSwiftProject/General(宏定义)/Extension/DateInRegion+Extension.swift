 
 
 import SwiftDate
 
 extension DateInRegion {
    
    func strYMDHMS() -> String {
        return self.toFormat(dateFormatA)
    }
    
    func strYMD() -> String {
        return self.toFormat(dateFormatB)
    }
    func strYMD2() -> String {
        return self.toFormat(dateFormatBB) 
    }
    
    
    
 }
 
 
