//
//  CustomTableViewCell.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 15.06.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
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
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: result.image) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.imageNameCharacter.image = UIImage(data: imageData)
            }
        }
        
    }
    
}
