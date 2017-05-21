//
//  MVVM_Cell.swift
//  MVVM_TableView(5-21)
//
//  Created by weihua on 2017/5/21.
//  Copyright © 2017年 Twh. All rights reserved.
//

import UIKit

class MVVM_Cell: UITableViewCell {

    // viewModel
    var viewModel:MVVM_ViewModel?
    
    var leftLab:UILabel?
    
    var rightLab:UILabel?
    
    // 绑定View与ViewModel
    public func bindWithViewModel(vm:MVVM_ViewModel){
      
        self.viewModel = vm
    
        self.kvoController.observe(vm, keyPath: "leftTitleContent", options: [.new,.initial]) { (observer, observe, change) in
            
            self.leftLab?.text = change[NSKeyValueChangeKey.newKey] as? String
        }
        
        self.kvoController.observe(vm, keyPath: "rightTitleContent", options: [.new,.initial]) { (observer, observe, change) in
          
            self.rightLab?.text = change[NSKeyValueChangeKey.newKey] as? String
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
      
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        leftLab = UILabel(frame: CGRect(x: 10, y: 20, width: 100, height: 30))
        leftLab?.backgroundColor = UIColor.blue
        leftLab?.textColor = UIColor.red
        self.addSubview(leftLab!)
        
        rightLab = UILabel(frame: CGRect(x: 130, y: 20, width: 100, height: 30))
        rightLab?.backgroundColor = UIColor.blue
        rightLab?.textColor = UIColor.green
        self.addSubview(rightLab!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
