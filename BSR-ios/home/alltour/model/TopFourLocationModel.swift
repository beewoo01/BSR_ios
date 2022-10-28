//
//  TopFourLocationModel.swift
//  BSR-ios
//
//  Created by codebros on 2022/10/27.
//

import Foundation

struct TopFourLocationModel : Codable{
    let myInterCount : Int
    let allSpotCount : Int
    let popular : Int
    let location_idx : Int
    let location_name : String
    let location_img: String?
    let myHistoryCount: Int
    let allPointCount: Int
    let touristspot_latitude : Double?
    let touristspot_longitude : Double?
    let touristspotpoint_createtime : String?
    
    
    init(myInterCount: Int, allSpotCount: Int, popular: Int, location_idx: Int, location_name: String, location_img: String?, myHistoryCount: Int, allPointCount: Int, touristspot_latitude: Double?, touristspot_longitude: Double?, touristspotpoint_createtime: String?) {
        self.myInterCount = myInterCount
        self.allSpotCount = allSpotCount
        self.popular = popular
        self.location_idx = location_idx
        self.location_name = location_name
        self.location_img = location_img
        self.myHistoryCount = myHistoryCount
        self.allPointCount = allPointCount
        self.touristspot_latitude = touristspot_latitude
        self.touristspot_longitude = touristspot_longitude
        self.touristspotpoint_createtime = touristspotpoint_createtime
    }
    
    init(){
        self.myInterCount = 0
        self.allSpotCount = 0
        self.popular = 0
        self.location_idx = 0
        self.location_name = ""
        self.location_img = ""
        self.myHistoryCount = 0
        self.allPointCount = 0
        self.touristspot_latitude = 0
        self.touristspot_longitude = 0
        self.touristspotpoint_createtime = ""
    }
    
    
}
