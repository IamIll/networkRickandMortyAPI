//
//  DetailViewModelProtocol.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 09.07.2022.
//

import Foundation


protocol DetailViewModelProtocol {
    var name: String? { get }
    var locationName: String? { get }
    var type: String? { get }
    var gender: String? { get }
    var image: String? { get }
    var location: String? { get }
    var episode: String? { get }
    var imageData: Data? { get }
    var detailCharacter: Character? { get }
}
