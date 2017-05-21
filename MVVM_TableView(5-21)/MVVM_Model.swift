//
//  MVVM_Model.swift
//  MVVM_TableView(5-21)
//
//  Created by weihua on 2017/5/21.
//  Copyright © 2017年 Twh. All rights reserved.
//

import UIKit

class MVVM_Model: NSObject {

   dynamic var leftTitle:String?
    
   dynamic var rightTitle:String?
    
    /// 快速创建Model
    class func createModel(leftTitle:String,rightTitle:String) ->MVVM_Model {
     
        let model = MVVM_Model()
        model.leftTitle = leftTitle
        model.rightTitle = rightTitle
        
        return model
    }
    
}
