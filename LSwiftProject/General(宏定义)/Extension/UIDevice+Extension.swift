

extension UIDevice {
    public func isX() -> Bool {
        
        if UIApplication.shared.statusBarFrame.size.height == 44 {
            return true
        }
        
        return false
    }
}
