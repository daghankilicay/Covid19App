//
//  Tests.swift
//  Covid19
//
//  Created by Dağhan Kılıçay on 22.10.2020.
//

import Foundation
// MARK: - Tests
struct Tests: Codable {
    let the1MPop: String?
    let total: Int?

    enum CodingKeys: String, CodingKey {
        case the1MPop = "1M_pop"
        case total
    }
}
