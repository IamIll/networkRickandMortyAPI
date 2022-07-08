//
//  ViewModel.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 08.07.2022.
//

import Foundation


class ViewModel: MainViewControllerType {
    
    var selectedIndexPath: IndexPath?
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    
}
