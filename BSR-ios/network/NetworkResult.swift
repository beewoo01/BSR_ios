//
//  Network.swift
//  BSR-ios
//
//  Created by 전성훈 on 2021/06/30.
//

import Foundation

enum NetworkResult<T>{
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case netWorkFail
    
    
}
