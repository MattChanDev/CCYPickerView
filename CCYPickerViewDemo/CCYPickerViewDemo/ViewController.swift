//
//  ViewController.swift
//  CCYPickerViewDemo
//
//  Created by CCY on 2018/8/1.
//  Copyright © 2018年 cn.com.momole. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let a = ["abc","efg","刘德华","张学友"];
        PickerManager.share.showPicker(data: a, superView: self.view) { (model) in
            print(model);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

