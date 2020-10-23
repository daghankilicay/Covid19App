//
//  CountryViewModel.swift
//  Covid19
//
//  Created by Dağhan Kılıçay on 22.10.2020.
//

import UIKit

class CountryViewModel: NSObject {
    private var apiService : APIService!
    private(set) var baseResponse : BaseResponse! {
        didSet {
            if self.bindCountryViewModelToController != nil{
                self.bindCountryViewModelToController!(self.baseResponse)
            }
        }
    }
    
    private(set) var error : Error! {
        didSet {
            if self.bindErrorToController != nil{
                self.bindErrorToController!(error)
            }
        }
    }
    
    var bindCountryViewModelToController : ((BaseResponse) -> ())?
    var bindErrorToController : ((Error?) -> ())?
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.getHomePage { (baseResponse, error) in
            if error == nil{
                if baseResponse.error == nil{
                    self.baseResponse = baseResponse.value
                }else{
                    //show alert
                    self.error = baseResponse.error
                }
            }else{
                self.error = error
            }
        }
    }
}



