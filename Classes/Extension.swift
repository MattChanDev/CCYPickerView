//
//  Extension.swift
//  SelectedPicker
//
//  Created by CCY on 2018/6/28.
//  Copyright © 2018年 cn.com.momole. All rights reserved.
//

import UIKit

protocol defaultColor {
    func useDefaulColor()->Void;
}

extension defaultColor where Self:UIView{
    func useDefaulColor(){
        self.backgroundColor = UIColor.green;
    }
}

extension UIButton{
    typealias buttonClick = (()->()) // 定义数据类型(其实就是设置别名)
    private struct RuntimeKey {
        static let actionBlock = UnsafeRawPointer.init(bitPattern: "actionBlock".hashValue)
        /// ...其他Key声明
        
    }
    
    var click : buttonClick?{
        set{
            
            self.addTarget(self, action: #selector(tapped(button:)), for: .touchUpInside);
            objc_setAssociatedObject(self, RuntimeKey.actionBlock!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC);
        }
        
        get{
            return objc_getAssociatedObject(self, RuntimeKey.actionBlock!) as? UIButton.buttonClick;
        }
    }
    
    /// 运行时关联
     var actionBlock: buttonClick? {
        set {
            objc_setAssociatedObject(self, UIButton.RuntimeKey.actionBlock!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return  objc_getAssociatedObject(self, UIButton.RuntimeKey.actionBlock!) as? buttonClick
        }
    }
    
    /// 快速创建
    convenience init(setImage:UIImage?, title: String?,action:@escaping buttonClick){
        self.init()
        self.frame = frame
        self.setTitle(title, for: .normal);
        self.setImage(setImage, for: UIControlState.normal)
        self.addTarget(self, action:#selector(tapped(button:)) , for:.touchUpInside)
        self.actionBlock = action
        self.sizeToFit()
    }
    /// 点击回调
    @objc func tapped(button:UIButton){
        if self.actionBlock != nil {
            self.actionBlock!()
        }
    }
    /// 快速创建按钮 setImage: 图片名 frame:frame action:点击事件的回调
    convenience init(setImage:UIImage?, title:String?,frame:CGRect, action: @escaping buttonClick){
        self.init( setImage: setImage, title: title, action: action)
        self.frame = frame
    }
  
}
