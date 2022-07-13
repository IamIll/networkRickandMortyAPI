//
//  UITableDS.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 23.06.2022.
//

import UIKit

//protocol DelegateForDelegate {
//    func upDateURL(type: String, completion: @escaping () -> Void)
//}

class TableViewDataSource: NSObject, UITableViewDataSource, UITableViewDataSourcePrefetching {
    
//    var delegate: DelegateForDelegate?
    
    var index = 1
    
    var characterArray: [Character?] = []
    
    var onCompletion: ((API) -> Void)?
    
    var network = Network()
    
    var basicURL = "https://rickandmortyapi.com/api/character"
    
    var dateAPI: API?
    
    var completionHandler: ((String) -> Void)?
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]){
        
        if index >= characterArray.count - 1  {
            basicURL = dateAPI?.info.next ?? "nil"
            completionHandler?(basicURL)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        index = indexPath.row
        
        let customViewModel = CustomTableViewCelModel(сharacter: characterArray[indexPath.row]!)
        
        cell.customViewModel = customViewModel
         
        return cell
    }
}
