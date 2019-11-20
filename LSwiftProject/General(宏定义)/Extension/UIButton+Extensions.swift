 
import UIKit
import Kingfisher
extension UIButton {
    
    @objc func set(image anImage: UIImage?, title: String,
                   titlePosition: UIView.ContentMode, additionalSpacing: CGFloat, state: UIControl.State){
        self.imageView?.contentMode = .center
        self.setImage(anImage, for: state)
        self.setImage(anImage, for: .selected)
        self.setImage(anImage, for: .selected)
              pprint((anImage?.size.width)!)
        positionLabelRespectToImage(title: title, position: titlePosition, spacing: additionalSpacing, imgWidth: (anImage?.size.width)!)
        
        self.titleLabel?.contentMode = .center
        self.setTitle(title, for: state)
    }
    
    private func positionLabelRespectToImage(title: String, position: UIView.ContentMode,
                                             spacing: CGFloat,  imgWidth: CGFloat) {
        let imageSize = self.imageRect(forContentRect: self.frame)
        pprint(imageSize)
        let titleFont = self.titleLabel?.font!
        let titleSize = title.size(withAttributes: [NSAttributedString.Key.font: titleFont!])
        
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch (position){
        case .top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .bottom:
            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),
                                       left: -imgWidth, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                                       right: -(titleSize.width * 2 + spacing))
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
    
    func webImage(_ url: String, _ placeholder: UIImage) {
        self.kf.setBackgroundImage(with: URL(string: url), for: .normal, placeholder: placeholder)
    }
    
    public func setNormalImage(_ image: UIImage, highlighted hlimage: UIImage) {
        self.setImage(image, for: .normal)
        self.setImage(image, for: .highlighted)
        self.setImage(hlimage, for: [.highlighted,.selected])
        self.setImage(hlimage, for: .selected)
    }
    
    public func doCircleRadius(_ radiu: CGFloat, borderColor color:UIColor = UIColor.gray) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radiu
        //self.layer.borderWidth = 1/kScreenScale
        self.layer.borderColor = color.cgColor
    }
    
    /**
     button 提交Style
     */
    public func commitStyle() {
        
        //设置字体大小颜色
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        self.setTitleColor(UIColor.white, for: UIControl.State())
        self.setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .disabled)
        self.setTitleColor(UIColor.white.withAlphaComponent(0.6), for: .highlighted)

        let normalImage = UIImage(named: "button_normal")
        let disableImage = UIImage(named: "button_disable")
        let selectImage = UIImage(named: "button_select")

        self.setBackgroundImage(normalImage?.resizableImage(), for: UIControl.State())
        self.setBackgroundImage(selectImage?.resizableImage(), for: .highlighted)
        self.setBackgroundImage(disableImage?.resizableImage(), for: .disabled)
    }
    
    /**
     button 提交Style
     */
    public func deleteStyle() {
        
        //设置字体大小颜色
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        self.setTitleColor(UIColor.white, for: UIControl.State())
        self.setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .disabled)
        self.setTitleColor(UIColor.white.withAlphaComponent(0.6), for: .highlighted)
        
        let normalImage = UIImage(named: "button_normal")
        let disableImage = UIImage(named: "button_disable")
        let selectImage = UIImage(named: "button_select")
        
        self.setBackgroundImage(normalImage?.resizableImage(), for: UIControl.State())
        self.setBackgroundImage(selectImage?.resizableImage(), for: .highlighted)
        self.setBackgroundImage(disableImage?.resizableImage(), for: .disabled)
    }
    
    /**
     button 提交Style
     */
    public func normalStyle() {
        
        //设置字体大小颜色
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        self.setTitleColor(UIColor.white, for: UIControl.State())
        self.setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .disabled)
        self.setTitleColor(UIColor.white.withAlphaComponent(0.6), for: .highlighted)
        
        let normalImage = UIImage(named: "button_normal")
        let disableImage = UIImage(named: "button_disable")
        let selectImage = UIImage(named: "button_select")
        
        self.setBackgroundImage(normalImage?.resizableImage(), for: UIControl.State())
        self.setBackgroundImage(selectImage?.resizableImage(), for: .highlighted)
        self.setBackgroundImage(disableImage?.resizableImage(), for: .disabled)
    }
    
    class func btn(bgColor: UIColor, disabledColor: UIColor, title: String, titleColor: UIColor) -> UIButton {
        
        let btn = UIButton(type: .custom)
        btn.setTitleColor(titleColor, for: .normal)
        btn.backgroundColor = bgColor
        btn.layer.cornerRadius = 3.0
        btn.layer.masksToBounds = true
        
        return btn
    }
}
