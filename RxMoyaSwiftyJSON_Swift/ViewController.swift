//
//  ViewController.swift
//  MoyaRxSwiftDemo_Swift
//
//  Created by 张剑 on 16/4/20.
//  Copyright © 2016年 张剑. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var showTextView: UITextView!
    
    let userProvider = RxMoyaProvider<ZJUserProvider>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    @IBAction func queryDataClick(_ sender: AnyObject) {
        
        _ = userProvider.request(ZJUserProvider.login(userName: "15225178360", userPwd: "123456"))
            .mapObject(type: ZJResult<ZJUser>.self)
            .subscribe(
                onNext:{
                    (repos) -> Void in
                    self.showTextView.text = "用SwiftyJSON把结果转为对象\n"
                                            + "是否成功：\(repos.success!)\n"
                                            + "信息：\(repos.msg!)";
                },
                onError:{
                    (error) -> Void in
                    self.showTextView.text = "\(error)";
                }
        )
        
    }
    
    
}

