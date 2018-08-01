//
//  PickerManager.swift
//  SelectedPicker
//
//  Created by CCY on 2018/6/28.
//  Copyright © 2018年 cn.com.momole. All rights reserved.
//

import UIKit

public class PickerManager: NSObject {
    static let share = PickerManager();
    let cpv = CustomerPickerView();
    
    func setUpPickerDataSource(items: [Any]){
        
        cpv.datas = items;
    }
    
    func showPicker(data: [Any], superView: UIView,click:@escaping(Any)->()){
        cpv.datas = data;
        cpv.show(superView: superView, click: click);
    }
}
