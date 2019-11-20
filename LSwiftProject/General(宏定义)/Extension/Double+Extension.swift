 
 
 import UIKit
 
 extension Double {
    
    func toString(f: String) -> String {
        
        return String(format: f,  self)
    }
    
    func str() -> String {
        return String(self)
    }
    func roundTo(places:Int) -> Double {
        
        let divisor = pow(10.0, Double(places))
        
        return (self * divisor).rounded() / divisor
    }
   
 }
 
