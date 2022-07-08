//
//  DetailViewModelType.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 09.07.2022.
//

import Foundation


protocol DetailViewModelType {
    var name: String? { get }
    var locationName: String? { get }
    var type: String? { get }
    var gender: String? { get }
    var image: String? { get }
}
