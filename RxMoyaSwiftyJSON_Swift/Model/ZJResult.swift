//
//  ZJResult.swift
//  HttpDemo_Swift
//
//  Created by 张剑 on 16/4/20.
//  Copyright © 2016年 张剑. All rights reserved.
//

import Foundation
import SwiftyJSON

class ZJResult<T: ALSwiftyJSONAble>: ALSwiftyJSONAble {
    var success: String!
    var msg: String!
    var obj: T?
    
    
    required init?(jsonData:JSON){
        self.success = jsonData["success"].stringValue
        self.msg = jsonData["msg"].stringValue
        self.obj = T(jsonData: jsonData["obj"])
    }
}
