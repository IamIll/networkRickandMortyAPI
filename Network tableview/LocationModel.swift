//
//  LocationModel.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 25.06.2022.
//

import Foundation

struct LocationModel: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
