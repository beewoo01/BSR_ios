//
//  AllReviewViewModel.swift
//  BSR-ios
//
//  Created by codebros on 2022/10/28.
//

import Foundation
import SwiftyJSON

class AllReviewViewModel {
    
    var reviewList : Observable<[AllReviewModel]?> = Observable(nil)
    
    private var apiService : NetworkService!
    
    init() {
        apiService = NetworkService.shared
        self.reviewList.value = []
    }
    
    var numOfitems : Int {
        return reviewList.value?.count ?? 0
    }
    
    func getItem(at index : Int) -> AllReviewModel? {
        return reviewList.value?[index] ?? nil
    }
    
    func getData() {
        
        apiService.selectAllReview(completion: {(response) in
            switch(response) {
                
            case .success(let resultList) :
                
                let result = JSON(resultList)
                
                var subList : [AllReviewModel] = []
                
                for (index, subJson) : (String, JSON) in result {
                    let location_idx = subJson["location_idx"].int
                    let location_name = subJson["location_name"].string
                    let touristspot_idx = subJson["touristspot_idx"].int
                    let touristspot_name = subJson["touristspot_name"].string
                    let touristspot_img = subJson["touristspot_img"].string
                    let review_idx = subJson["review_idx"].int
                    let review_score = subJson["review_score"].float
                    let review_contents = subJson["review_contents"].string
                    let user_idx = subJson["user_idx"].int
                    let user_name = subJson["user_name"].string
                    let user_profile = subJson["user_profile"].string
                    let review_img_url = subJson["review_img_url"].string
                    
                    subList.append(
                        AllReviewModel(
                            location_idx : location_idx!,
                            location_name : location_name!,
                            touristspot_idx : touristspot_idx!,
                            touristspot_name : touristspot_name!,
                            touristspot_img : touristspot_img,
                            review_idx : review_idx!,
                            review_score : review_score!,
                            review_contents : review_contents!,
                            user_idx : user_idx!,
                            user_name : user_name!,
                            user_profile : user_profile,
                            review_img_url : review_img_url
                        )
                    )
                    
                }
                
                self.reviewList.value = subList
                
                //self.reviewList.value = result
            case .requestErr(let message):
                print(message)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .netWorkFail:
                print("networkFail")
            }
        })
    }
    
}
