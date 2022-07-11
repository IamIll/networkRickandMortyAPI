//
//  UITableDS.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 23.06.2022.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource, UITableViewDataSourcePrefetching {
    
    var index = 1
    
    var image: UIImage? 
    
    var characterArray: [Character?] = []
    
    var onCompletion: ((API) -> Void)?
    
    var network = Network()
    
    var basicURL = "https://rickandmortyapi.com/api/character"
    
    var dateAPI: API?
    
//    var charakter: Character?
    
    func сellCreation() {

        network.fetchData2(stringURL: basicURL, expacting: API.self) { result in
            DispatchQueue.main.async {
                self.dateAPI = result
                self.onCompletion?(result)
                self.characterArray.append(contentsOf: self.dateAPI!.results)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]){

        if index >= characterArray.count - 1  {
                basicURL = dateAPI?.info.next ?? "nil"
                сellCreation()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        index = indexPath.row
        
        let customViewModel = CustomTableViewCelModel(charakter: characterArray[indexPath.row]!)
        
        cell.customViewModel = customViewModel
        
        return cell
    }
}
