//
//  CustomTableViewCell.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 15.06.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var network = NetworkAPI()
    
    @IBOutlet weak var imageNameCharacter: UIImageView!
    @IBOutlet weak var labelnameCharacter: UILabel!
    @IBOutlet weak var labelkindCharacter: UILabel!
    @IBOutlet weak var labelnameLocation: UILabel!
    @IBOutlet weak var labelnameEpisode: UILabel!
    
    func configure(with result: Character) {
        labelnameCharacter.text = result.name
        labelkindCharacter.text = result.origin.name
        labelnameLocation.text = result.created
        labelnameEpisode.text = result.episode.first
        print(result.image)
        
        DispatchQueue.main.async {
            self.network.downloadImage(url: result.image) { (image) in
                print(result.image)
                self.imageNameCharacter.image = image
                print(print(result.image))
            }
        }
    }
}
