//
//  ZJUser.swift
//  HttpDemo_Swift
//
//  Created by 张剑 on 16/4/20.
//  Copyright © 2016年 张剑. All rights reserved.
//

import Foundation
import SwiftyJSON

class ZJUser: ALSwiftyJSONAble {
    var userName: String!
    var userPhone: String!
    var userAlias: String!
    var invitationCode: Int!
    
    
    required init?(jsonData:JSON){
        self.userName = jsonData["userName"].stringValue
        self.userPhone = jsonData["userPhone"].stringValue
        self.userAlias = jsonData["userAlias"].stringValue
        self.invitationCode = jsonData["userAlias"].intValue
    }
}
