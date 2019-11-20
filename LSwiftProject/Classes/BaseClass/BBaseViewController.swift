 
import UIKit

class BBaseViewController: BaseViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        BBProgressHUD.dismiss(10)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = BackgroundViewColor
         
        BBProgressHUD.initHUD()
//        delayDismiss()
    }
    
    lazy var backButton: UIButton = {
        let backButton = UIButton()
  
        backButton.setImage(UIImage.init(named: "ic_back 拷贝"), for: .normal)
       
        backButton.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)
        return backButton
    }()
    
    func createBack() {
        
        self.view.addSubview(self.backButton)
        backButton.snp.makeConstraints { (make) in
            make.top.equalTo(kStatusBarHeight + 15)
            make.left.equalTo(10)
            make.height.equalTo(36)
        }
    }
    
    @objc func backAction(button: UIButton) {
      self.navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
   
 
}
