//
//  Deaths.swift
//  Covid19
//
//  Created by Dağhan Kılıçay on 22.10.2020.
//

import Foundation

// MARK: - Deaths
struct Deaths: Codable {
    let new: String?
    let the1MPop: String?
    let total: Int?

    enum CodingKeys: String, CodingKey {
        case new
        case the1MPop = "1M_pop"
        case total
    }
}
