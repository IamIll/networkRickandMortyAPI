//
//  DetailController.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 20.06.2022.
//

import UIKit

class DetailController: UIViewController {
    
    var location = LocationViewController()
    
    @IBOutlet weak var detailGender: UILabel!
    @IBOutlet weak var detailSpecies: UILabel!
    @IBOutlet weak var detailType: UILabel!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    
    var detailCharacter: Character?
    
    @IBAction func transitionLocation(_ sender: UIButton) {
    }
    @IBAction func trancitionEpisode(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailName.text = detailCharacter?.name
        detailType.text = "Location \(detailCharacter!.location.name)"
        detailSpecies.text = detailCharacter?.species.rawValue
        detailGender.text = detailCharacter?.gender.rawValue
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: self.detailCharacter?.image ?? "no image") else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                self.imageDetail.image = UIImage(data: imageData)
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
