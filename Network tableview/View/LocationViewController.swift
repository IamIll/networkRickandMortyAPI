//
//  LocationViewController.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 24.06.2022.
//

import UIKit

class LocationViewController: UIViewController {
    
    var locationURL: String?
    
    var network = Network()
    
    var locationViewModel: LocationViewModelProtocol?
    
    @IBOutlet weak var localName: UILabel!
    
    @IBOutlet weak var localType: UILabel!
    
    @IBOutlet weak var localDimensin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationViewModel?.update(completion: {
            DispatchQueue.main.async {
                self.localName.text = self.locationViewModel?.name
                self.localType.text = self.locationViewModel?.type
                self.localDimensin.text = self.locationViewModel?.dimension
            }
        })
        
    }
}

