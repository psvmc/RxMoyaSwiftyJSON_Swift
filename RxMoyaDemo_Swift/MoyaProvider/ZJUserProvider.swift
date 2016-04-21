//
//  ZJUserProvider.swift
//  MoyaRxSwiftDemo_Swift
//
//  Created by 张剑 on 16/4/20.
//  Copyright © 2016年 张剑. All rights reserved.
//

import Foundation
import Moya
public enum ZJUserProvider {
    case login(userName:String,userPwd:String) //登录
}

extension ZJUserProvider: TargetType {
    // API地址
    public var baseURL: NSURL { return NSURL(string: "http://t.yidaisong.com:90/")! }
    /// 拼接请求字符串
    public var path: String {
        switch self {
        case .login:
            return ("login!in.do")
        }
    }
    /// 请求方法
    public var method: Moya.Method {
        return .POST
    }
    /// 配置参数
    public var parameters: [String: AnyObject]? {
        switch self {
            case .login(let userName, let userPwd):
                return ["userPhone":userName,"userLoginPswd":userPwd];
        }
    }
    /// 数据
    public var sampleData: NSData {
        switch self {
        case .login:
            return "Half measures are as bad as nothing at all.".dataUsingEncoding(NSUTF8StringEncoding)!
        }
    }
}