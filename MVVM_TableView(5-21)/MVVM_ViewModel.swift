//
//  MVVM_ViewModel.swift
//  MVVM_TableView(5-21)
//
//  Created by weihua on 2017/5/21.
//  Copyright © 2017年 Twh. All rights reserved.
//

import UIKit

class MVVM_ViewModel: NSObject {

   dynamic var leftTitleContent:String?
    
   dynamic var rightTitleContent:String?

    // 绑定model与ViewModel
    func bindWithModel(model:MVVM_Model)  {
        
        self.kvoController.observe(model, keyPath: "leftTitle", options: [.new,.initial]) { (observer, observe, change) in
            
            self.leftTitleContent = change[NSKeyValueChangeKey.newKey] as? String
        }
        
        self.kvoController.observe(model, keyPath: "rightTitle", options: [.new,.initial]) { (observer, observe, change) in
            
            self.rightTitleContent = change[NSKeyValueChangeKey.newKey] as? String
        }
    }
    
}
