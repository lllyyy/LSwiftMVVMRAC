//
//  LLCommonColor.swift
//  LSwiftProject
//
//  Created by ios on 2019/11/19.
//  Copyright © 2019 ios. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import SnapKit
import SwiftyJSON
import Toast_Swift
import IQKeyboardManagerSwift
import Kingfisher
import SwiftDate


// MARK:- 颜色方法
func normalRGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor (red: r, green: g, blue: b, alpha: a)
}

// MARK:- 常用按钮颜色
 
 
// 分割线颜色
let kSplitLineColor = RGBA(r: 0.78, g: 0.78, b: 0.80, a: 1.00)
// 常规背景颜色
 
// 导航栏背景颜色
let kNavBarBgColor = normalRGBA(r: 20, g: 20, b: 20, a: 0.9)

// 表情键盘颜色大全
let kChatBoxColor = normalRGBA(r: 244.0, g: 244.0, b: 246.0, a: 1.0)
let kLineGrayColor = normalRGBA(r: 188.0, g: 188.0, b: 188.0, a: 0.6)
 
 
 
 //常用颜色
 //主色
 let MainColor = colorHex("#fd6b94") //red
 //分隔线
 let SeparatorLineColor = colorHex("#eeeeee")
 let SeparatorLineColor2 = colorHex("#e3e3e3")
 //背景色
 let BackgroundViewColor = colorHex("#f5f5f5")
 
 //字体颜色，提醒文字及提醒背景色块
 //一级色
 let FirstLevelColor = colorHex("#333333")
 //二级色
 let SecondLevelColor = colorHex("#666666")
 //三级色
 let ThreeLevelColor = colorHex("#999999")
 
 //辅助色1
 let AssistOneColor = colorHex("#afafaf")
 //辅助色2
 let AssistTwoColor = colorHex("#10b5a7")
 //辅助色3
 let AssistThreeColor = colorHex("#e4f8f7")
 //辅助色4
 let AssistTourColor = colorHex("#ff9616")
 
 let RedColor = colorHex("#fb3353") //red
 let BlueColor = colorHex("#0068c8")
 
 
 let SeparatorColor = colorHex("#dddddd")
 let BackgroundColor = colorHex("#f0f0f0")
 let PinkColor = colorHex("#ffedef")
 let LayBackgroundColors = colorHex("#ffffff")
 let BorderColor = colorHex("#aaaaaa")
 let GuidePageBackgroundColors = colorHex("#ffeff2")
 let MenstruationTimeColors = colorHex("#fed0d5")
 let avatarborderColor = colorHex("#dddddd")
 let BGViewColor = colorHex("#ffe5e9")
 let BGborderColor = colorHex("#fda4b2")
 let BGProfileColor = colorHex("#def2fe")
 let ShadowColor = colorHex("#0097f5")
 let LineColor = colorHex("#8ad5d9")
 let SelectButtonColor = colorHex("#dc2d49")
 let DisabledButtonTextColor = colorHex("#fc7284")
 let BalanceColor = colorHex("#ffa200")
 let BalanceMoneyColor = colorHex("#3bc995")
 let certificationBgColor = colorHex("#00ce7c")
 let prescriptionBgColor = colorHex("#ff7f40")
