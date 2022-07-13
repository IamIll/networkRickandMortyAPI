//
//  EpisodeViewController.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 24.06.2022.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    var episodeURL: String?
    
    var episodeViewModel: EpisodeViewModelProtocol?

    @IBOutlet weak var episodeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        episodeViewModel?.update(completion: {
            DispatchQueue.main.async {
                self.episodeLabel.text = self.episodeViewModel?.episode
            }
        })
    }
}
