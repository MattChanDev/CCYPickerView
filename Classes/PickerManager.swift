//
//  PickerManager.swift
//  SelectedPicker
//
//  Created by CCY on 2018/6/28.
//  Copyright ©  cn.com.momole. All rights reserved.
//

import UIKit

public class PickerManager: NSObject {
    public static let share = PickerManager();
    let cpv = CustomerPickerView();
    
    public func showPicker(data: [Any], superView: UIView,click:@escaping(Any)->()){
        cpv.datas = data;
        cpv.show(superView: superView, click: click);
    }
}
