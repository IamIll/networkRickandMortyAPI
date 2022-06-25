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
    
    var detailText: String!
    
    var detailCharacter: Character?
    
    var table = UITableView()

    var delegate: UITextViewDelegate!
    
    @IBAction func transitionLocation(_ sender: UIButton) {
        performSegue(withIdentifier: "goLocation", sender: Any?)
    }
    @IBAction func trancitionEpisode(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailName.text = detailCharacter?.name
        detailType.text = "Location \(detailCharacter?.location.name)"
        detailSpecies.text = detailCharacter?.species.rawValue
        detailGender.text = detailCharacter?.gender.rawValue
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: self.detailCharacter?.image ?? "no image") else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            self.location.locationURL = self.detailCharacter?.location.url
            
            DispatchQueue.main.async {
                self.imageDetail.image = UIImage(data: imageData)
            }
        }
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goLocation" {
                let detailVC = segue.destination as! LocationViewController
                detailVC.locationURL = detailCharacter?.url
            }
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
