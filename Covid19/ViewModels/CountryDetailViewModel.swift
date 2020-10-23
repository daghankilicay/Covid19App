//
//  CountryDetailViewModel.swift
//  Covid19
//
//  Created by Dağhan Kılıçay on 22.10.2020.
//

import UIKit

class CountryDetailViewModel: NSObject {
    private var apiService : APIService!
    private(set) var baseResponse : BaseResponse! {
        didSet {
            if self.bindCountryViewModelToController != nil{
                self.bindCountryViewModelToController!(self.baseResponse)
            }
        }
    }
    
    var bindCountryViewModelToController : ((BaseResponse) -> ())?
    var countryName :String?
    var strDay :String?
    
     init(countryName: String?, strDay: String?) {
        super.init()
        self.apiService =  APIService()
        callFuncToGetEmpData(countryName: countryName, strDay: strDay)
    }
    
    func callFuncToGetEmpData(countryName: String!, strDay: String!) {
        
        self.apiService.getDetail(countryName: countryName, strDate: strDay) { (response, error) in
            if error == nil{
                self.baseResponse = response.value
            }
        }
    }
}
