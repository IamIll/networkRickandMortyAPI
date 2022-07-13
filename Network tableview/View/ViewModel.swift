//
//  ViewModel.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 08.07.2022.
//

import Foundation

protocol MainViewControllerProtocol {
    func selectRow(atIndexPath indexPath: IndexPath)
    func update(completion: @escaping () -> Void)
    var basicURL: String? {get set}
    var mainTableDataSource: TableViewDataSource? {get set}
}

class ViewModel: MainViewControllerProtocol {
    
    var mainTableDataSource: TableViewDataSource?
    
    var basicURL: String? = "https://rickandmortyapi.com/api/character"
    
    var selectedIndexPath: IndexPath?
    
    var tableViewDataSource = TableViewDataSource()
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    var network = Network()
    
    func update(completion: @escaping () -> Void) {
        network.fetchData2(stringURL: basicURL ?? "nil",
                           expacting: API.self) { result in
            self.mainTableDataSource?.dateAPI = result
            guard let characterArray = self.mainTableDataSource?.dateAPI?.results else {return}
            self.mainTableDataSource?.characterArray.append(contentsOf: characterArray)
            completion()
        }
    }
}
 
