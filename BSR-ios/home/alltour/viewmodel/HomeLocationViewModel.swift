//
//  HomeLocationViewModel.swift
//  BSR-ios
//
//  Created by codebros on 2022/10/27.
//

import Foundation
import SwiftyJSON

class HomeLocationViewModel {
    
    
    var locationList : Observable<[TopFourLocationModel]?> = Observable(nil)
    private var apiService : NetworkService!
    
    init() {
        print("HomeLocationViewModel init")
        apiService = NetworkService.shared
        self.locationList.value = []
        
        
    }
    
    
    var currentList : [TopFourLocationModel]? {
        return locationList.value ?? nil
    }
    
    var numOfItems: Int {
        return locationList.value?.count ?? 0
    }
    
    func getItem(at index: Int) ->  TopFourLocationModel? {
        return locationList.value?[index] ?? nil
    }
    
    func getData() {
        //TODO Get getFourLocations
        print("HomeLocationViewModel getData")
        
        apiService.getFourLocations(userIdx: 9, completion: { [self](response) in
            switch(response) {
            case .success(let resultList) :
                let result = JSON(resultList)
                //print("result type \(type(of: result))")
                //print("resultList type \(type(of: resultList))")
                
                //                let jsonCreate = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                
                self.locationList.value = resultList as? [TopFourLocationModel]
                //print("이거됨? \(String(describing: self.locationList.value?[0].location_name))")
                var subList : [TopFourLocationModel] = []
                
                print("\r getFourLocations ⚡️: \(Thread.current)\r" + "🏭: \(OperationQueue.current?.underlyingQueue?.label ?? "None")\r")
                
                for (index, subJson) : (String, JSON) in result {
                    let location_idx = subJson["location_idx"].int
                    let popular = subJson["popular"].int
                    let allPointCount = subJson["allPointCount"].int
                    let myInterCount = subJson["myInterCount"].int
                    let location_name = subJson["location_name"].string
                    let allSpotCount = subJson["allSpotCount"].int
                    let myHistoryCount = subJson["myHistoryCount"].int
                    
                    let location_img = subJson["location_img"].string
                    let touristspot_latitude = subJson["touristspot_latitude"].double
                    let touristspot_longitude = subJson["touristspot_longitude"].double
                    let touristspotpoint_createtime = subJson["touristspotpoint_createtime"].string
                    
                    
                    subList.append(
                        TopFourLocationModel(myInterCount: myInterCount!, allSpotCount: allSpotCount!, popular: popular!, location_idx: location_idx!, location_name: location_name!, location_img: location_img, myHistoryCount: myHistoryCount!, allPointCount: allPointCount!, touristspot_latitude: touristspot_latitude, touristspot_longitude: touristspot_longitude, touristspotpoint_createtime: touristspotpoint_createtime)
                    )
                    
                    
                    
                    
                    print("touristspot_longitude HI \(touristspot_longitude)")
                    print("touristspot_latitude HI \(touristspot_latitude)")
                    
                }
                
              
                self.locationList.value = subList
                
                print("locationList \(self.locationList.value?.count)")
                
                
                break
                
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
