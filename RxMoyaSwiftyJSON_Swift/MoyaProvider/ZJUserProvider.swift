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
    public var task: Task {
        return .request;
    }



    // API地址
    public var baseURL: URL { return URL(string: "http://www.psvmc.cn/")! }
    /// 拼接请求字符串
    public var path: String {
        switch self {
        case .login:
            return ("navi_list.json")
        }
    }
    /// 请求方法
    public var method: Moya.Method {
        return .get
    }
    /// 配置参数
    public var parameters: [String: Any]? {
        switch self {
            case .login(let userName, let userPwd):
                return ["userPhone":userName as AnyObject,"userLoginPswd":userPwd as AnyObject];
        }
    }
    /// 数据
    public var sampleData: Data {
        switch self {
        case .login:
            return "Half measures are as bad as nothing at all.".data(using: String.Encoding.utf8)!
        }
    }
}
