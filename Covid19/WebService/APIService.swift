//
//  APIService.swift
//  Covid19
//
//  Created by Dağhan Kılıçay on 22.10.2020.
//

import UIKit
import Alamofire

class APIService: NSObject {
    
    func getHomePage(callback:@escaping (DataResponse<BaseResponse, AFError>,Error?) -> Void) {

        let headers: HTTPHeaders = [
            "\(Constant.rapidapiHostKey)": "\(Constant.rapidapiHostValue)",
            "\(Constant.rapidapiKey)": "\(Constant.rapidapiValue)"
        ]
        
        AF.request(Constant.homePageUrl,headers: headers).validate().responseDecodable(of: BaseResponse.self) { response in
            callback(response,nil)
        }
    }
    
    func getDetail(countryName:String!,strDate : String!, callback:@escaping (DataResponse<BaseResponse, AFError>,Error?) -> Void) {

        let headers: HTTPHeaders = [
            "\(Constant.rapidapiHostKey)": "\(Constant.rapidapiHostValue)",
            "\(Constant.rapidapiKey)": "\(Constant.rapidapiValue)"
        ]
        
        let paramaters: Parameters = [
            "country": "\(countryName!)",
            "day": "\(strDate!)"
        ]
        
        AF.request(Constant.history,parameters: paramaters, headers: headers).validate().responseDecodable(of: BaseResponse.self) { response in
            callback(response,nil)
        }
    
        
        
    }
}
