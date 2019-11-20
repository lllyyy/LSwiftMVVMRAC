//
//  LLPopularScienceViewController.swift
//  LSwiftProject
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019 ios. All rights reserved.
//

import UIKit

class LLPopularScienceViewController: BBaseTableViewController {

   
    
  override func viewDidLoad() {
         super.viewDidLoad()
         self.customNavBar.title  = "设置"
         self.tableView.separatorColor = SeparatorLineColor
         
         let currentVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
 //logo_gray@3x
         print("currentVersion")
         print(currentVersion)
         print("currentVersion")
         self.view.addSubview(bgView)
         bgView.snp.makeConstraints { (make) in
             make.bottom.equalTo(0)
             make.left.equalTo(0)
             make.right.equalTo(0)
             make.height.equalTo(40)
         }
         bgView.addSubview(editionLabel)
         editionLabel.snp.makeConstraints { (make) in
             make.bottom.equalTo(-30)
             make.left.equalTo(kScreenW/2-30)
          }
         bgView.addSubview(imageView)
         imageView.snp.makeConstraints { (make) in
             make.right.equalTo(-kScreenW/2-30)
             make.centerY.equalTo(editionLabel.snp.centerY)
             make.width.equalTo(30)
             make.height.equalTo(20)
         }
     }
     lazy var bgView: UIView = {
         let bgView = UIView()
         bgView.backgroundColor = UIColor.clear
         return bgView
     }()
     lazy var editionLabel: UILabel = {
         let editionLabel = UILabel()
         editionLabel.textColor = AssistOneColor
         editionLabel.font = fontStyle(FontSizeD)
         editionLabel.textAlignment = .left
         editionLabel.numberOfLines = 0
         let currentVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
         editionLabel.text = "  当前版本号V" + currentVersion + "\n 北京尖尖康医疗科技有限公司"
         return editionLabel
     }()
     lazy var imageView: UIImageView = {
         let imageView = UIImageView()
         imageView.contentMode = .scaleAspectFill
         imageView.image = UIImage(named: "logo_gray")
         return imageView
     }()
     override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         if section == 0 {
             return 0.1
         }
         return 10
     }
     
     override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
         if section == 2 {
             return 90
         }
         return 0.1
     }
     
     override func numberOfSections(in tableView: UITableView) -> Int {
         return 3
     }
     
     override func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return kTableCellHeight
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if section == 0 {
             return 2
         } else if section == 1 {
             return 3
         }
         return 1
     }
     
     override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
         
         return nil
     }
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
         cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
         cell.textLabel?.textColor = FirstLevelColor
         cell.textLabel?.font = fontStyle(FontSizeB)
         
         if indexPath.section == 0 {
             if indexPath.row == 0 {
                 cell.textLabel?.text = "帐号管理"
             } else if indexPath.row == 1 {
                 cell.textLabel?.text = "收货地址管理"
             }
         }else if indexPath.section == 1 {
             if indexPath.row == 0 {
                 cell.textLabel?.text = "评论我们"
             } else if indexPath.row == 1 {
                 cell.textLabel?.text = "服务协议"
             } else if indexPath.row == 2 {
                 cell.textLabel?.text = "分享APP"
             }
         } else if indexPath.section == 2 {
             cell.accessoryType = .none
             let logoutButton = UIButton(frame: CGRect(x: 0, y: 0, width: tableView.width, height: kTableCellHeight))
             logoutButton.backgroundColor = UIColor.white
             logoutButton.setTitle("退出登录", for: .normal)
             logoutButton.titleLabel?.font = fontStyle(FontSizeA)
             logoutButton.setTitleColor(MainColor, for: .normal)
             cell.contentView.addSubview(logoutButton)
              
             
         }
         
         return cell
     }
     
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
         
         
     }
     
       
}
