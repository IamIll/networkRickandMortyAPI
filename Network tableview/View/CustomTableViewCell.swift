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
    
    var customViewModel: CustomViewProtol? {
        willSet(customViewModel) {
                labelnameCharacter.text = customViewModel?.name
                labelkindCharacter.text = customViewModel?.origin
                labelnameLocation.text = customViewModel?.created
                labelnameEpisode.text = customViewModel?.episode
                guard let imageData = customViewModel?.imageData else {return}
                imageNameCharacter.image = UIImage(data: imageData)
        }
    }
}
