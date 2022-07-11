//
//  ViewModel.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 08.07.2022.
//

import Foundation


class ViewModel: MainViewControllerProtocol {
    
    var selectedIndexPath: IndexPath?
    
    var tableViewDataSource = TableViewDataSource()
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
}
 
