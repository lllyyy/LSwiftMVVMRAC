//
//  LLConst.swift
//  LSwiftProject
//
//  Created by ios on 2019/11/19.
//  Copyright © 2019 ios. All rights reserved.
//

 
import SwiftDate

let APPDELEGATE = UIApplication.shared.delegate as! AppDelegate

let DOCUMENT_DIRECTORY = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!

let FMDB_PATH =  String("\(DOCUMENT_DIRECTORY)/baby.sqlite")

let RETURN_OK = "1"

let RETURN_Code = "0"
/// 间距
let kMargin: CGFloat = 10.0
let kLeftMargin: CGFloat = 15.0
/// 圆角
let kCornerRadius: CGFloat = 6.0
/// 线高
let klineHeight: CGFloat = 1.0
/// CELL高
let kTableCellHeight: CGFloat = 45.0


let kCellTextWidth = kScreenW - 2 * kLeftMargin

/// 新特性界面图片数量
let kNewFeatureCount = 4

/// 屏幕的宽
let kScreenW = UIScreen.main.bounds.size.width

/// 屏幕的高
let kScreenH = UIScreen.main.bounds.size.height

/// 状态栏高度
let kStatusBarHeight: CGFloat =  UIDevice.current.isX() ? 44 : 20

/// 导航栏高度
let kNavBarHeight: CGFloat =  UIDevice.current.isX() ? 88 : 64

/// TabBar高度
let kTabHeight: CGFloat =  UIDevice.current.isX() ? (49 + 34) : 49

let kHomeIndicatorHeight: CGFloat =  UIDevice.current.isX()  ? 34 : 0

let kScrollTabbar: CGFloat =  45
let kBottomViewHeight: CGFloat =  60


let LimitPageCount: Int = 10 //分页请求默认数据
let NOImage = UIImage(named:"default_pic")
let PlaceholderImage = UIImage(named:"defoult_logo")
let PlaceholderDoctor = UIImage(named:"chat_default_doc")
let PlaceholderShopping = UIImage(named:"组 24")

let PlaceholderadImg = UIImage(named:"pic_prize0")
let PlaceholderUser = UIImage(named:"chat_default_user")
let NoDataTitle = "暂无数据"
let NoSearchDataTitle = "没有搜索结果"
let NoDataImage =  UIImage(named: "default_order")
let NoSearchDataImage =  UIImage(named: "default_search")
let DEFAULTCOUPON =  UIImage(named: "default_coupon")


let FontSizeA: CGFloat = 18
let FontSizeF: CGFloat = 16
let FontSizeB: CGFloat = 15
let FontSizeC: CGFloat = 14
let FontSizeCC: CGFloat = 13
let FontSizeD: CGFloat = 12
let FontSizeE: CGFloat = 10

//随机数
let CoderandomIn = Int(arc4random_uniform(899999) + 100000)
 
 
