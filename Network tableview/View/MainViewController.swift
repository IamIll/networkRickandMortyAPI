//
//  MainViewController.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 15.06.2022.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var viewModel: MainViewControllerType?
    
    var tableDS = TableDS()
    var netwok = NetworkAPI()
    var index: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableDS.сellCreation()
        table.dataSource = tableDS
        table.delegate = self
        tableDS.onCompletion = { result in
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
        table.prefetchDataSource = tableDS
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
            detailVC.detailCharacter = tableDS.characterArray[index.row]
        }
    }
}
