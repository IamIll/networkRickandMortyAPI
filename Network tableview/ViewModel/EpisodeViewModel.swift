//
//  EpisodeViewModel.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 11.07.2022.
//

import Foundation

protocol EpisodeViewModelProtocol {
    var episode: String? { get }
    var episodeURL: String? { get }
    func update(completion: @escaping () -> Void)
}

class EpisodeViewModel: EpisodeViewModelProtocol {
    
    var episodeURL: String?
    
    var network = Network()
    
    var episode: String?
    
    func update(completion: @escaping () -> Void) {
        guard let url = episodeURL else {return}
        network.fetchData2(stringURL: url,
                           expacting: Character.self) { result in
            
            self.episode = result.episode.joined(separator: "n/")
            completion()
        }
    }
}
