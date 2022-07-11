//
//  MainViewController.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 15.06.2022.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var viewModel: MainViewControllerProtocol?
    
    var tableViewDataSource = TableViewDataSource()
    var netwok = Network()
    var index: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewDataSource.сellCreation()
        table.dataSource = tableViewDataSource
        table.delegate = self
        tableViewDataSource.onCompletion = { result in
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
        table.prefetchDataSource = tableViewDataSource
        viewModel = ViewModel()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath
        viewModel?.selectRow(atIndexPath: indexPath)
        performSegue(withIdentifier: "GoDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index = index {
            let detailVC = segue.destination as! DetailController
            let detailViewModel = DetailViewModel(detailCharacter: tableViewDataSource.characterArray[index.row]!)
            detailVC.detailViewModel = detailViewModel
        }
    }
}
