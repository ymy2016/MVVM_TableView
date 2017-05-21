//
//  ViewController.swift
//  MVVM_TableView(5-21)
//
//  Created by weihua on 2017/5/21.
//  Copyright © 2017年 Twh. All rights reserved.
//

import UIKit

let identy = "cell"

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

   lazy var tableView:UITableView = {
    
      let myTableView = UITableView(frame:  self.view.bounds, style: UITableViewStyle.plain)
          myTableView.delegate = self
          myTableView.dataSource = self
          myTableView.tableFooterView = UIView()
          myTableView.register(MVVM_Cell.classForCoder(), forCellReuseIdentifier: identy)

        return myTableView
    }()
    
    lazy var array:Array<MVVM_Model> = {
        
        let model_1 = MVVM_Model.createModel(leftTitle: "左边001", rightTitle: "右边001")
        let model_2 = MVVM_Model.createModel(leftTitle: "左边002", rightTitle: "右边002")
        let model_3 = MVVM_Model.createModel(leftTitle: "左边003", rightTitle: "右边003")
        let model_4 = MVVM_Model.createModel(leftTitle: "左边004", rightTitle: "右边004")
        let model_5 = MVVM_Model.createModel(leftTitle: "左边005", rightTitle: "右边005")
        let model_6 = MVVM_Model.createModel(leftTitle: "左边006", rightTitle: "右边006")
        let model_7 = MVVM_Model.createModel(leftTitle: "左边007", rightTitle: "右边007")
        
        let myDataList = [model_1,model_2,model_3,model_4,model_5,model_6,model_7]
        
        return myDataList
    }()
    
    lazy var dataList:Array<MVVM_Model> = {
        
       let myDataList = self.array
        
       return myDataList
    }()
    
    var myModel:MVVM_Model?
    var myViewModel:MVVM_ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.view.addSubview(self.tableView)

        deleteItem()
    }

    func deleteItem()  {
       
        if  self.dataList.count > 0{
           
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
                
                self.dataList.remove(at: self.dataList.count-1)
                self.deleteItem()
                self.tableView.reloadData()
            }
        }
        else{
        
           self.dataList = self.array
           self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:MVVM_Cell = tableView.dequeueReusableCell(withIdentifier: identy, for: indexPath) as! MVVM_Cell
        
        let model:MVVM_Model = self.dataList[indexPath.row]
        
        let viewModel = MVVM_ViewModel()
        
        cell.bindWithViewModel(vm: viewModel)
        viewModel.bindWithModel(model: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }

}

