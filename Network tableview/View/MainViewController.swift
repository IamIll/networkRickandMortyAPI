//
//  MainViewController.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 15.06.2022.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var viewModel: ViewModel?
    
    var tableViewDataSource: TableViewDataSource?
    
    var index: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel()
        tableViewDataSource = TableViewDataSource()
        
        viewModel?.mainTableDataSource = tableViewDataSource
        
        
        viewModel?.update(completion: {
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        })
        
        viewModel?.mainTableDataSource?.completionHandler = { url in
            self.viewModel?.basicURL =  url
            self.viewModel?.update {
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
            }
        }
        
        table.dataSource = self.tableViewDataSource
        table.delegate = self
        table.prefetchDataSource = self.tableViewDataSource
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath
        viewModel?.selectRow(atIndexPath: indexPath)
        performSegue(withIdentifier: "GoDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index = index {
            let detailVC = segue.destination as! DetailController
            guard let detailCharacter = tableViewDataSource?.characterArray[index.row] else {return}
            let detailViewModel = DetailViewModel(detailCharacter: detailCharacter)
            detailVC.detailViewModel = detailViewModel
        }
    }
}
