//
//  CustomTableViewCelModel.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 10.07.2022.
//

import Foundation

protocol CustomViewProtol {
    var name: String? { get }
    var origin: String? { get }
    var created: String? { get }
    var episode: String? { get }
    var imageData: Data? { get }
    var сharacter: Character? { get }
}

class CustomTableViewCelModel: CustomViewProtol {
    
    var сharacter: Character?
    
    var network = Network()
    
    var name: String? {
        return сharacter?.name
    }
    var origin: String? {
        return сharacter?.origin.name
    }
    var created: String? {
        return сharacter?.created
    }
    var episode: String? {
        return сharacter?.episode.first
    }
    var imageData: Data? {
        network.fetchImageData(from: сharacter?.image)
    }
    init(сharacter: Character) {
        self.сharacter = сharacter
    }
}
