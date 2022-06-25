//
//  LocationViewController.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 24.06.2022.
//

import UIKit

class LocationViewController: UIViewController {
    
    var locationURL: String?

    @IBOutlet weak var localName: UILabel!
    
    @IBOutlet weak var localType: UILabel!
    
    @IBOutlet weak var localDimensin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData1()
        print(locationURL)
    }
    
    
    //"https://rickandmortyapi.com/api/location/"
    
    func fetchData1() {
    
        guard let url = URL(string: locationURL ?? "nil") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else { return }
            
            do {
                let relust = try JSONDecoder().decode(LocationModel.self, from: data)
                DispatchQueue.main.async {
                    self.localName.text = relust.name
                    self.localType.text = relust.type
                    self.localDimensin.text = relust.dimension
//                    print(relust.name)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
