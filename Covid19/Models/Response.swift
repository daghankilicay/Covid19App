//
//  Response.swift
//  Covid19
//
//  Created by Dağhan Kılıçay on 22.10.2020.
//

import Foundation

// MARK: - Response
//struct Response: Codable {
//    let country: String?
//    let population: Int?
////    let cases: Cases
////    let deaths: Deaths
////    let tests: Tests
//    let day: String?
//    let time: Date?
//    
//    enum CodingKeys: String, CodingKey {
//        case country = "country"
//        case population = "population"
//        case day = "day"
//        case time = "time"
//    }
//}

struct Response: Codable {
    let continent, country: String?
    let population: Int?
    let cases: Cases
    let deaths: Deaths
    let tests: Tests
    let day: String?
    let time: String?
}
