//
//  User.swift
//  BSR-ios
//
//  Created by 전성훈 on 2021/06/29.
//

import Foundation
struct User: Codable{
    
    var user_idx: Int?
    var user_phone: String?
    var user_password: String?
    var user_name: String?
    var user_email: String?
    var user_location: String?
    var user_enable: Int?
    var access_token: String?
    
    init() {
         user_idx = nil
         user_phone = nil
        user_password = nil
         user_name = nil
         user_email = nil
         user_location = nil
         user_enable = nil
         access_token = nil
    }
}
