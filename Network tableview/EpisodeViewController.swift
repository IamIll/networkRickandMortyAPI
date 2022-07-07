//
//  EpisodeViewController.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 24.06.2022.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    var episodeURL: String?
    var network = NetworkAPI()

    @IBOutlet weak var episodeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        network.fetchData2(stringURL: episodeURL ?? "nil") { result in
//            DispatchQueue.main.async {
//                self.episodeLabel.text = result?.episode.joined(separator: "n/")
//            }
//        }
        
        network.fetchData2(stringURL: episodeURL ?? "nil", expacting: Character.self ) { result in
            DispatchQueue.main.async {
                self.episodeLabel.text = result.episode.joined(separator: "n/")
                
            }
        }
    }
}
