//
//  NetworkService.swift
//  BSR-ios
//
//  Created by 전성훈 on 2021/06/30.
//

import Foundation
import Alamofire

struct NetworkService{
    static let shared = NetworkService()
    
    
    
    func login(user : User, completion : @escaping (NetworkResult<Any>)->Void){
        
        let url = Singleton.url + "bsr_login_Exists"
//            Singleton.url + "bsr_login_Exists"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = AF.request(url,
                                    method: .get,
                                    parameters: user,
//                                    encoder: JSONParameterEncoder.default,
                                    headers: nil)
        
        dataRequest.responseString { dataResponse in
        
            switch dataResponse.result{
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else{return}
                guard let value = dataResponse.value else {return}
                completion(.success(value))
                print("지나감 ㅆ")
                
            case .failure:
                completion(.pathErr)
                
            
            }
        }
    
    }
    
    
    func getUserInfo(user : User, completion : @escaping (NetworkResult<Any>)->Void){
        
        let url = Singleton.url + "bsr_login"
//            Singleton.url + "bsr_login_Exists"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = AF.request(url,
                                    method: .get,
                                    parameters: user,
//                                    encoder: JSONParameterEncoder.default,
                                    headers: nil)
        
        dataRequest.response { dataResponse in
        
            switch dataResponse.result{
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else{return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.userjudgeStatus(by: statusCode, value!)
                print("지나감 ㅆ")
                completion(networkResult)
                
            case .failure:
                completion(.pathErr)
                
            
            }
        }
    
    }
    
    
    
    
    func get_token( completion : @escaping (NetworkResult<Any>)->Void){
        
        let url = Singleton.url + "gabia_token"
//            Singleton.url + "bsr_login_Exists"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = AF.request(url,
                                    method: .get,
                                    headers: nil)
        
        dataRequest.responseString { dataResponse in
            
            switch dataResponse.result{
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else{return}
                guard let value = dataResponse.value else {return}
                completion(.success(value))
                print("gabia_token 접근")
                
            case .failure:
                completion(.pathErr)
                
            
            }
        }
    
    }
    
    func phonenum_authorization(user: User, completion : @escaping (NetworkResult<Any>)->Void){
        
        let url = Singleton.url + "phonenum_authorization"
//            Singleton.url + "bsr_login_Exists"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = AF.request(url,
                                    method: .get,
                                    parameters: user,
                                    headers: nil)
        
        dataRequest.responseString { dataResponse in
            
            switch dataResponse.result{
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else{return}
                guard let value = dataResponse.value else {return}
                completion(.success(value))
                print("phonenum_authorization 접근")
                
            case .failure:
                completion(.pathErr)
                
            
            }
        }
    
    }
    
    
    

    func join(user : User,
              completion : @escaping (NetworkResult<Any>)->Void){

        
        let url = Singleton.url + "bsr_join"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = AF.request(url,
                                     method: .get,
                                     parameters: user,
//                                     encoder: JSONParameterEncoder.default,
                                     headers: header)
        
        dataRequest.responseString { dataResponse in
            
            switch dataResponse.result{
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else{return}
                guard let value = dataResponse.value else {return}
                completion(.success(value))

                
            case .failure: completion(.pathErr)
            
            
            }
        }
    
    }
    
    
    
    func getFourLocations(userIdx : Int, completion : @escaping (NetworkResult<Any>)->Void) {
        
        
        let url = Singleton.url + "getFourLocations"
        let parameter = ["userIdx" : userIdx]
        print("getFourLocations url \(url)")
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = AF.request(url,
                                     method: .get,
                                     parameters: parameter
                                     )
        
        dataRequest.responseJSON { dataResponse in
            
            switch dataResponse.result{
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else{return}
                guard let value = dataResponse.value else {return}
                print("getFourLocations.success")
                completion(.success(value))

                
            case .failure:
                print("getFourLocations.failure")
                completion(.pathErr)
                
            
            
            }
        }
        
    }
    
    
    func selectAllReview(completion : @escaping (NetworkResult<Any>)->Void) {
        let url = Singleton.url + "select_all_review"
        
        let dataRequest = AF.request(url,
                                     method: .get
                                     )
        
        dataRequest.responseJSON { dataResponse in
            
            switch dataResponse.result{
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else{return}
                guard let value = dataResponse.value else {return}
                print("getFourLocations.success")
                completion(.success(value))

                
            case .failure:
                print("getFourLocations.failure")
                completion(.pathErr)
                
            
            
            }
        }
    }
    
    
    
//    func join(user : User,
//              completion : @escaping (NetworkResult<Any>)->Void){
//
//
//        let url = Singleton.url + "bsr_join"
//        let header : HTTPHeaders = ["Content-Type": "application/json"]
//        let dataRequest = AF.request(url,
//                                     method: .get,
//                                     parameters: user,
////                                     encoder: JSONParameterEncoder.default,
//                                     headers: header)
//
//        dataRequest.responseData { dataResponse in
//
//            switch dataResponse.result{
//            case .success:
//                guard let statusCode = dataResponse.response?.statusCode else{return}
//                guard let value = dataResponse.value else {return}
//                let networkResult  = self.judgeStatus(by: statusCode, value)
//                completion(networkResult)
//
//            case .failure: completion(.pathErr)
//
//
//            }
//        }
//
//    }
    
    
    
    
    
    private func judgeStatus(by statusCode: Int, _ data: Data)-> NetworkResult<Any>{
        
        switch statusCode{
        case 200: return .success(data)
//            isValidData(data: data)// 성공 -> 데이터를 가공해서 전달해줘야 하기 때문에 함수로 넘김
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .netWorkFail
        }
        
    }
    
    private func userjudgeStatus(by statusCode: Int, _ data: Data)-> NetworkResult<Any>{
        
        switch statusCode{
        case 200:
            print("userjudgeStatus")
            return isValidUserData(data: data)// 성공 -> 데이터를 가공해서 전달해줘야 하기 때문에 함수로 넘김
        
//
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .netWorkFail
        }
        
    }
    
    
    private func isValidUserData(data: Data)-> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(User.self, from: data) else { return .pathErr }
        return .success(decodedData)
    }
}
