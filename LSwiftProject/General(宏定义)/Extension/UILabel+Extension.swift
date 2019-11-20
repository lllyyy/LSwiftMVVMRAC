import UIKit

extension UILabel {
    
    func labelSize(_ rect: CGRect,text: String, space: CGFloat, font: CGFloat) -> UILabel {
        self.font = fontStyle(font)
        let cont = text as NSString
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: text)
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = space
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, cont.length))
        self.attributedText = attributedString
        self.numberOfLines = 0
        self.frame = rect
        self.sizeToFit()
        return self
    }
    
    
}

