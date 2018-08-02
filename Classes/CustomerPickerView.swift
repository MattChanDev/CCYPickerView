//
//  CustomerPickerView.swift
//  SelectedPicker
//
//  Created by CCY on 2018/6/28.
//  Copyright © 2018年 cn.com.momole. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.width;
let kScreenHeight = UIScreen.main.bounds.height;

class CustomerPickerView: UIView {
    
    var datas : [Any] = [];
    var model : Any?;
    var selectedBlock: ((Any)->())?;
    override init(frame: CGRect) {
        super.init(frame: frame);
        
    }
    
    @objc func confirmAction(){
        self.removeFromSuperview();
        if selectedBlock != nil{
            selectedBlock!(model ?? datas.first ?? "");
        }
        
    }
    
    func show(superView: UIView,click: @escaping(Any)->()){
        self.frame = superView.bounds;
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4);
        superView.addSubview(self);
        
        model = datas.first;
        let pickerView = UIPickerView();
        pickerView.backgroundColor = UIColor.white;
        pickerView.dataSource = self;
        pickerView.delegate = self;
        self.addSubview(pickerView);
        pickerView.frame = CGRect(x: 50, y: kScreenHeight * 0.5 - 100, width: kScreenWidth * 0.7, height: 200);
        pickerView.layer.cornerRadius = 15;
        
        let pickerViewBar = UIView();
        pickerViewBar.backgroundColor = UIColor.white;
        self.addSubview(pickerViewBar);
        pickerViewBar.frame = CGRect(x: 50, y: pickerView.frame.origin.y - 55, width: pickerView.bounds.width, height: 50);
        pickerViewBar.layer.cornerRadius = 15;

        
        let button = UIButton(type: .custom);
        button.setTitleColor(UIColor(red: 0/255.0, green: 133/255.0, blue: 207/255.0, alpha: 1), for: .normal);
        button.setTitle("确定", for: .normal);
        button.addTarget(self, action: #selector(confirmAction), for: .touchUpInside);
        pickerViewBar.addSubview(button);
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50);

        
        let cancelButton = UIButton(type: .custom);
        cancelButton.setTitleColor(UIColor.red, for: .normal);
        cancelButton.setTitle("取消", for: .normal);
        pickerViewBar.addSubview(cancelButton);
        cancelButton.frame = CGRect(x: pickerViewBar.bounds.width - 50, y: 0, width: 50, height: 50);

        cancelButton.click = {[weak self] in
            self?.removeFromSuperview();
        }
        selectedBlock = click;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CustomerPickerView: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return datas.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel();
        label.textAlignment = .center;
        label.text = datas[row] as? String;
        return label;
    }
    
}

extension CustomerPickerView: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        model = datas[row];
    }
}
