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
    var charakter: Character? { get }
}

class CustomTableViewCelModel: CustomViewProtol {
    
    var charakter: Character?
    
    var network = Network()
    
    var name: String? {
        return charakter?.name
    }
    var origin: String? {
        return charakter?.origin.name
    }
    var created: String? {
        return charakter?.created
    }
    var episode: String? {
        return charakter?.episode.first
    }
    
    var imageData: Data? {
            network.fetchImageData(from: charakter?.image)
    }
    
    init(charakter: Character) {
        self.charakter = charakter
    }
}
