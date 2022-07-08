//
//  DetailController.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 20.06.2022.
//

import UIKit

class DetailController: UIViewController {
    
    var location = LocationViewController()
    
    var network = NetworkAPI()
    
    var detailCharacter: Character?
    
    var detailViewModel: DetailViewModelType?
    
    @IBOutlet weak var detailGender: UILabel!
    @IBOutlet weak var detailSpecies: UILabel!
    @IBOutlet weak var detailType: UILabel!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        detailName.text = detailViewModel?.name
        detailType.text = "Location \(detailViewModel?.locationName)"
        detailSpecies.text = detailViewModel?.type
        detailGender.text = detailViewModel?.gender
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        detailName.text = detailCharacter?.name ?? "nil"
//        detailType.text = "Location \(detailCharacter!.location.name)"
//        detailSpecies.text = detailCharacter?.type ?? "nil"
//        detailGender.text = detailCharacter?.gender.rawValue ?? "nil"
        
        DispatchQueue.global().async {
        
            self.network.downloadImage(url: self.detailViewModel?.image ?? "nil") { image in
                DispatchQueue.main.async {
                    self.imageDetail.image = image
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goLocation" {
            let detailVC = segue.destination as! LocationViewController
            detailVC.locationURL = detailCharacter?.location.url
        }
        if segue.identifier == "goEpisode" {
            let detailVC = segue.destination as! EpisodeViewController
            detailVC.episodeURL = detailCharacter?.url
        }
    }
}
