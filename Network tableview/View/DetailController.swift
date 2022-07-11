//
//  DetailController.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 20.06.2022.
//

import UIKit

class DetailController: UIViewController {
    
    var detailViewModel: DetailViewModelProtocol?
    
    @IBOutlet weak var detailGender: UILabel!
    @IBOutlet weak var detailSpecies: UILabel!
    @IBOutlet weak var detailType: UILabel!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailName.text = detailViewModel?.name
        detailType.text = "Location \(detailViewModel?.locationName)"
        detailSpecies.text = detailViewModel?.type
        detailGender.text = detailViewModel?.gender
        
        DispatchQueue.main.async {
            guard let imageData = self.detailViewModel?.imageData else {return}
            self.imageDetail.image = UIImage(data: imageData)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goLocation" {
            let detailVC = segue.destination as! LocationViewController
            let locationViewModel = LocationViewModel()
            detailVC.locationURL = detailViewModel?.location
            locationViewModel.locationURL = detailVC.locationURL
            detailVC.locationViewModel = locationViewModel
        }
        if segue.identifier == "goEpisode" {
            let detailVC = segue.destination as! EpisodeViewController
            let episodeViewModel = EpisodeViewModel()
            detailVC.episodeURL = detailViewModel?.episode
            episodeViewModel.episodeURL = detailVC.episodeURL
            detailVC.episodeViewModel = episodeViewModel
        }
    }
}
