//
//  LocationViewController.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 24.06.2022.
//

import UIKit

class LocationViewController: UIViewController {
    
    var locationURL: String?
    
    var shareAPI = NetworkAPI()

    @IBOutlet weak var localName: UILabel!
    
    @IBOutlet weak var localType: UILabel!
    
    @IBOutlet weak var localDimensin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shareAPI.fetchData2(stringURL: locationURL ?? "nil", expacting: LocationModel.self) { result in
            DispatchQueue.main.async {
                self.localName.text = result.name
                self.localType.text = result.type
                self.localDimensin.text = result.dimension ?? "nil"
            }
        }
    }
}
