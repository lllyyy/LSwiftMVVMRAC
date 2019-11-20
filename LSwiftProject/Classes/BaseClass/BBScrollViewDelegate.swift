 
import Foundation

@objc protocol BBScrollViewDelegate {
   @objc optional func customScrollViewDidScroll(_ scrollView: UIScrollView, lastPosition: CGPoint)
    
   @objc optional func customScrollViewDidEnd(_ scrollView: UIScrollView, lastPosition: CGPoint)
    
   @objc optional func customScrollViewEndDrag(_ scrollView: UIScrollView, lastPosition: CGPoint)
}
