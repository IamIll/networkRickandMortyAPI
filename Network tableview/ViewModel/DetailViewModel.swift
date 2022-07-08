//
//  DetailViewModel.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 08.07.2022.
//

import Foundation

class DetailViewModel {
    
    var detailCharacter: Character?
    
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
}
