//
//  Singleton.swift
//  WorkForm_ios
//
//  Created by 고선균 on 2021/01/19.
//

import Foundation
class Singleton{
 
    static var url: String = "http://coratest.kr/base_project_brs/"
    //static var url: String = "http://192.168.0.137:8080/project/"
    


    //유저정보
    static var user_idx: Int?
    static var user_phone: String?
    static var user_name: String?
    static var user_email: String?
    static var user_location: String?
    static var user_enable: Int?
    static var access_token: String?
    
    
    //색상값
    static var login_main_color: UInt = 0xE5F6FF
    static var main_color: UInt = 0x590EDE
    static var background_color: UInt = 0xF5F6F8
    static var title_color: UInt = 0x0E4F84
    static var content_color: UInt = 0x191919
    static var line_color: UInt = 0xE0E3EC
    static var popup_gray: UInt = 0xEBEBEB
    static var popup_btn: UInt = 0x343b58

    static var tf_gray: UInt = 0xF1F1F5
    static var text_black: UInt = 0x191919


}
