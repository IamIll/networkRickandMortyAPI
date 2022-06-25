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
    
    let basicURL = "https://rickandmortyapi.com/api/character"
    
    var dateAPI: API?
    
    func fetchData() {
    
        guard let url = URL(string: basicURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else { return }
            
            do {
                let relust = try JSONDecoder().decode(API.self, from: data)
                self.dateAPI = relust
                self.delegate?.update()
            } catch let error {
                print(error)
            }
        }.resume()
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
