 
import Foundation

enum UITextFieldPaddingDirection {
    case left
    case right
}

extension UITextField {
    func setPadding(with width: CGFloat, direction: UITextFieldPaddingDirection) {
        let frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        let paddingView = UIView(frame: frame)
        switch direction {
        case .left:
            self.leftViewMode = .always
            self.leftView = paddingView
        default:
            self.rightViewMode = .always
            self.rightView = paddingView
        }
        
    }
}
