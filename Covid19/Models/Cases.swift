//
//  Cases.swift
//  Covid19
//
//  Created by Dağhan Kılıçay on 22.10.2020.
//

import Foundation

// MARK: - Cases
struct Cases: Codable {
    let new: String?
    let active, critical, recovered: Int?
    let the1MPop: String?
    let total: Int?

    enum CodingKeys: String, CodingKey {
        case new, active, critical, recovered
        case the1MPop = "1M_pop"
        case total
    }
}
