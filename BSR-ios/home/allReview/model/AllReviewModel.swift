//
//  AllReviewModel.swift
//  BSR-ios
//
//  Created by codebros on 2022/10/28.
//

import Foundation

struct AllReviewModel: Codable {
    let location_idx: Int
    let location_name: String
    let touristspot_idx : Int
    let touristspot_name : String
    let touristspot_img: String?
    let review_idx : Int
    let review_score : Float
    let review_contents : String
    let user_idx : Int
    let user_name : String
    let user_profile : String?
    let review_img_url : String?
    
    init(location_idx: Int, location_name: String, touristspot_idx : Int, touristspot_name : String,
         touristspot_img: String?, review_idx : Int, review_score : Float, review_contents : String,
         user_idx : Int, user_name : String,  user_profile : String?, review_img_url : String?
    ) {
        self.location_idx = location_idx
        self.location_name = location_name
        self.touristspot_idx = touristspot_idx
        self.touristspot_name = touristspot_name
        self.touristspot_img = touristspot_img
        self.review_idx = review_idx
        self.review_score = review_score
        self.review_contents = review_contents
        self.user_idx = user_idx
        self.user_name = user_name
        self.user_profile = user_profile
        self.review_img_url = review_img_url
        
    }
    
}
