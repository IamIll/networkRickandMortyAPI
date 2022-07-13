//
//  LocationViewModel.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 10.07.2022.
//

import Foundation

protocol LocationViewModelProtocol {
    var name: String? { get }
    var type: String? { get }
    var dimension: String? { get }
    var locationURL: String? { get set }
    func update(completion: @escaping () -> Void)
}

class LocationViewModel: LocationViewModelProtocol {
    
    var network = Network()
    
    var locationURL: String?
    
    var name: String?
    
    var type: String?
    
    var dimension: String?
    
    func update(completion: @escaping () -> Void) {
        guard let url = locationURL else {return}
        network.fetchData2(stringURL: url,
                           expacting: LocationModel.self) { result in
            self.name = result.name
            self.type = result.type
            self.dimension = result.dimension ?? "nil"
            completion()
        }
    }
}
