//
//  DetailViewModel.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 08.07.2022.
//

import Foundation

class DetailViewModel: DetailViewModelProtocol {
    
    var detailCharacter: Character?
    
    var network = Network()
    
    var name: String? {
        return detailCharacter?.name
    }
    
    var locationName: String? {
        return detailCharacter?.location.name
    }
    
    var type: String? {
        return detailCharacter?.type
    }
    
    var gender: String? {
        return detailCharacter?.gender.rawValue
    }
    
    var image: String? {
        return detailCharacter?.image
    }
    
    var location: String? {
        return detailCharacter?.location.url
    }
    var episode: String? {
        return detailCharacter?.url
    }
    
    var imageData: Data? {
        network.fetchImageData(from: detailCharacter?.image)
    }
    
    init(detailCharacter: Character) {
        self.detailCharacter = detailCharacter
    }
}
