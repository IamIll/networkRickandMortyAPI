//
//  UITableDS.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 23.06.2022.
//

import UIKit

protocol TableDelegate {
    func update ()
}
class TableDS: NSObject, UITableViewDataSource {
    
    var delegate: TableDelegate?
    
    var shareAPI = NetworkAPI()
    
    let basicURL = "https://rickandmortyapi.com/api/character"
    
    var dateAPI: API?
    
    func networkUpdate() {
        shareAPI.fetchData(stringURL: basicURL) { relust in
            DispatchQueue.main.async {
                self.dateAPI = relust
                self.delegate?.update()
            }
        }
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateAPI?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        guard let positiv = dateAPI?.results[indexPath.row] else { return cell}
        cell.configure(with: positiv)
        
        return cell
    }
}
